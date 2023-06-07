package controller;

import java.sql.Date;
import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import Util.HibernateUtil;
import model.CT_LopTinChi;
import model.HocKi;
import model.SV_HocLopTinChi;
import model.SinhVien;
import model.TaiKhoan;

@Controller
public class StudentController {
	SessionFactory factory = HibernateUtil.getSessionFactory();
	@RequestMapping("/index_student")
	public String indexStudent() {
		return "student/index_student";
	}
	
	@RequestMapping("/dkimonhoc")
	public String dkiMonHoc() {
		return "student/dkimonhoc";
	}
	
	@RequestMapping("/thongtincanhansv")
	public String thongTinCaNhan(HttpSession session, Model model) {
		Object ob = session.getAttribute("taiKhoan");
		TaiKhoan tk = new TaiKhoan();
		tk = (TaiKhoan) ob;
		SinhVien sinhVien = new SinhVien();
		sinhVien = sinhVien.getSVById(tk.getTenDN(), getSinhVien());
		model.addAttribute("student", sinhVien);
		return "student/thongtincanhan";
	}
	
	@RequestMapping("/xemdiem")
	public String xemDiem() {
		return "student/diem";
	}
	
	@RequestMapping(value = "/suattcnsv", method = RequestMethod.POST)
	public String suaThongTinCN(HttpServletRequest request, Model model) {
		
		Session session = factory.getCurrentSession();
		Transaction tr = session.beginTransaction();
		String maSV = request.getParameter("maSV");
		SinhVien sinhVien = session.get(SinhVien.class, maSV);
		String tenSV = request.getParameter("tenSV");
		String ngaySinh = request.getParameter("ngaySinh");
		Date NS = Date.valueOf(ngaySinh);
		String gioiTinh = request.getParameter("gioiTinh");
		String queQuan = request.getParameter("queQuan");
		String email2 = request.getParameter("email2");
		String sdt2 = request.getParameter("sdt2");
		sinhVien.setHoTen(tenSV);
		sinhVien.setNgaySinh(NS);
		sinhVien.setGioiTinh(gioiTinh);
		sinhVien.setQueQuan(queQuan);
		sinhVien.setEmail2(email2);
		sinhVien.setSDT2(sdt2);
		session.merge(sinhVien);
		tr.commit();
		session.close();
		model.addAttribute("student", sinhVien);
		request.setAttribute("mgs_updateTTSV", "Thay đổi thông tin thành công!");
		return "student/thongtincanhan";
	}
	
	@RequestMapping(value = "/thuchiendkimonhoc", method = RequestMethod.POST)
	public String thucHienDkiLTC(HttpServletRequest request, HttpSession session, Model model) {
		Object ob = session.getAttribute("taiKhoan");
		TaiKhoan tk = new TaiKhoan();
		tk = (TaiKhoan) ob;
		SinhVien sinhVien = new SinhVien();
		sinhVien = sinhVien.getSVById(tk.getTenDN(), getSinhVien());
		Session session1 = factory.getCurrentSession();
		Transaction tr = session1.beginTransaction();
		Query query1 = session1.createNativeQuery("{call SP_CHECKSVDKI(?, ?, ?, ?)}");
		String[] idMonHocList = request.getParameterValues("idMonHoc");
		String[] tthList = request.getParameterValues("thhMonHoc");
		String[] idLopList = request.getParameterValues("idLop");
		String maHK = request.getParameter("maHK");
		String hql = "from CT_LopTinChi CT where CT.monHoc.maMH = :maMH and CT.lop.maLop = :maLop "
				+ "and CT.maNhom = :maNhom and CT.hocKi.maHK = :maHK";
		List<CT_LopTinChi> lopTCSVChon = new ArrayList<>();
		Query query = session1.createQuery(hql);
		if(idMonHocList.length != 0 && tthList.length != 0 && idLopList.length != 0) {
			for (int i = 0; i < idMonHocList.length; i++) {
				query1.setParameter(1, maHK);
				query1.setParameter(2, idLopList[i]);
				query1.setParameter(3, idMonHocList[i]);
				query1.setParameter(4, tk.getTenDN());
				if(query1.getResultList().size() == 0) {
					query.setParameter("maMH", idMonHocList[i]);
					query.setParameter("maLop", idLopList[i]);
					query.setParameter("maNhom", Integer.parseInt(tthList[i]));
					query.setParameter("maHK", maHK);
					List<CT_LopTinChi> result = new ArrayList<>();
					result = query.getResultList();
					CT_LopTinChi ct_ltc = result.get(0);
					lopTCSVChon.add(ct_ltc);
				}
			}
			for (CT_LopTinChi ltc : lopTCSVChon) {
				SV_HocLopTinChi sv_ltc = new SV_HocLopTinChi(ltc, sinhVien, (double)0, (double)0, (double)0, (double)0, (double)0, (double)0, null);
				session1.save(sv_ltc);
			}
			for (CT_LopTinChi ltc : lopTCSVChon) {
				ltc.setSlThucTeDK(ltc.getSlThucTeDK() + 1);
				session1.update(ltc);
			}
		}
		tr.commit();
		session1.close();
		model.addAttribute("listLopTC", getListLTC());
		return "student/dkimonhoc";
	}

	public List<SinhVien> getSinhVien() {
		SessionFactory factory = HibernateUtil.getSessionFactory();
		List<SinhVien> listSinhVien = new ArrayList<>();
		Session session = factory.getCurrentSession();
		Transaction tr = session.beginTransaction();
		String hql = "from SinhVien";
		Query query = session.createQuery(hql);
		listSinhVien = query.list();
		tr.commit();
		session.close();
		return listSinhVien;
	}
	
	@ModelAttribute("listLopTC")
	public List<CT_LopTinChi> getListLTC(){
		SessionFactory factory = HibernateUtil.getSessionFactory();
		List<CT_LopTinChi> listLTC = new ArrayList<>();
		Session session = factory.getCurrentSession();
		Transaction tr = session.beginTransaction();
		String hql = "from CT_LopTinChi CT where CT.trangThai = 0";
		Query query = session.createQuery(hql);
		listLTC = query.list();
		tr.commit();
		session.close();
		return listLTC;
	}
	
	@ModelAttribute("listHocKiSV")
	public List<HocKi> getListHocKi(HttpSession session){
		SessionFactory factory = HibernateUtil.getSessionFactory();
		Object ob = session.getAttribute("taiKhoan");
		TaiKhoan tk = new TaiKhoan();
		tk = (TaiKhoan)ob;
		List<HocKi> listHocKi = new ArrayList<>();
		Session session1 = factory.getCurrentSession();
		Transaction tr = session1.beginTransaction();
		String hql = "SELECT CT.hocKi FROM CT_LopTinChi CT "
				+ "INNER JOIN SV_HocLopTinChi SVHLTC ON CT.id = SVHLTC.lopTinChi.id "
				+ "WHERE SVHLTC.sinhVien.maSV = :maSV";
		Query query = session1.createQuery(hql);
		query.setParameter("maSV", tk.getTenDN());
		listHocKi = query.list();
		Set<HocKi> lhk = new LinkedHashSet<>();
		for (HocKi hocKi : listHocKi) {
			lhk.add(hocKi);
		}
		listHocKi.clear();
		listHocKi.addAll(lhk);
		tr.commit();
		session1.close();
		return listHocKi;
	}
	
	
	@RequestMapping(value = "/locdiemsvhk", method = RequestMethod.POST)
	public String locDiemSV(HttpServletRequest request, Model model) {
		String maHK = request.getParameter("maHK");
		request.setAttribute("maHK", maHK);
		return "student/locdiem";
	}
	@ModelAttribute("listDiem")
	public List<Object[]> getListDiemSV(HttpServletRequest request, HttpSession session){
		Object ob = session.getAttribute("taiKhoan");
		TaiKhoan tk = new TaiKhoan();
		tk = (TaiKhoan) ob;
		System.out.println(tk.getTenDN());
		List<Object[]> listDiem = new ArrayList<>();
		Session session1 = factory.getCurrentSession();
		Transaction tr = session1.beginTransaction();
		Query query = session1.createNativeQuery("{call SP_LKDiem(?)}");
		query.setParameter(1, tk.getTenDN());
		listDiem = query.getResultList();
		tr.commit();
		session1.close();
		return listDiem;
	}
	
	
}
