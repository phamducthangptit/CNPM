package controller;

import java.sql.Date;
import java.util.ArrayList;
import java.util.HashSet;
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
import model.GiangVien;
import model.HocKi;
import model.Lop;
import model.MonHoc;
import model.SinhVien;
import model.TaiKhoan;

@Controller
public class TeacherController {
	SessionFactory factory = HibernateUtil.getSessionFactory();
	

	@RequestMapping("/index_teacher")
	public String indexTeacher() {
		return "teacher/index_teacher";
	}
	
	@RequestMapping("/thongtingiangvien")
	public String thongTinGV(Model model, HttpSession session) {
		Object ob = session.getAttribute("taiKhoan");
		TaiKhoan tk = new TaiKhoan();
		tk = (TaiKhoan) ob;
		GiangVien giangVien = new GiangVien();
		giangVien = giangVien.getGVById(tk.getTenDN(), getListTeacher());
		model.addAttribute("teacher", giangVien);
		return "teacher/thongtincanhan";
	}
	
	@RequestMapping("/dssv")
	public String dsSV(Model model, HttpSession session) {
		Object ob = session.getAttribute("taiKhoan");
		TaiKhoan tk = new TaiKhoan();
		tk = (TaiKhoan) ob;
		model.addAttribute("listHK", getListHocKi(tk.getTenDN()));
		model.addAttribute("listLop", getListLop(tk.getTenDN()));
		model.addAttribute("listMH", getListMonHoc(tk.getTenDN()));
		return "teacher/danhsachsinhvienltc";
	}
	@RequestMapping("/xemdiemsv")
	public String xemDiemSV(Model model, HttpSession session) {
		Object ob = session.getAttribute("taiKhoan");
		TaiKhoan tk = new TaiKhoan();
		tk = (TaiKhoan) ob;
		model.addAttribute("listHK", getListHocKi(tk.getTenDN()));
		model.addAttribute("listLop", getListLop(tk.getTenDN()));
		model.addAttribute("listMH", getListMonHoc(tk.getTenDN()));
		return "teacher/diemsinhvienltc";
	}
	
	@RequestMapping("/nhapdiemsvltc")
	public String nhapDiemSV(Model model, HttpSession session) {
		Object ob = session.getAttribute("taiKhoan");
		TaiKhoan tk = new TaiKhoan();
		tk = (TaiKhoan) ob;
		model.addAttribute("listHK", getListHocKi(tk.getTenDN()));
		model.addAttribute("listLop", getListLop(tk.getTenDN()));
		model.addAttribute("listMH", getListMonHoc(tk.getTenDN()));
		return "teacher/nhapdiemsvltc";
	}
	
	@RequestMapping(value = "/locdssv", method = RequestMethod.POST)
	public String locDsSV(HttpServletRequest request, Model model, HttpSession session) {
		Object ob = session.getAttribute("taiKhoan");
		TaiKhoan tk = new TaiKhoan();
		tk = (TaiKhoan) ob;
		GiangVien giangVien = new GiangVien();
		giangVien = giangVien.getGVById(tk.getTenDN(), getListTeacher());
		String maGV = giangVien.getMaGV();
		String maHK = request.getParameter("maHK");
		String maLop = request.getParameter("maLop");
		String maMH = request.getParameter("maMH");
		
		request.setAttribute("maHK", maHK);
		request.setAttribute("maLop", maLop);
		request.setAttribute("maMH", maMH);
		
		model.addAttribute("listHK", getListHocKi(tk.getTenDN()));
		model.addAttribute("listLop", getListLop(tk.getTenDN()));
		model.addAttribute("listMH", getListMonHoc(tk.getTenDN()));
		
		model.addAttribute("listSV", locSvByGV(maGV, maLop, maHK, maMH));
		return "teacher/danhsachsinhvienltc";
	}
	
	@RequestMapping(value = "/locdiemsv", method = RequestMethod.POST)
	public String locDiemSVByGV(HttpServletRequest request, Model model, HttpSession session) {
		Object ob = session.getAttribute("taiKhoan");
		TaiKhoan tk = new TaiKhoan();
		tk = (TaiKhoan) ob;
		GiangVien giangVien = new GiangVien();
		giangVien = giangVien.getGVById(tk.getTenDN(), getListTeacher());
		String maGV = giangVien.getMaGV();
		String maHK = request.getParameter("maHK");
		String maLop = request.getParameter("maLop");
		String maMH = request.getParameter("maMH");
		
		request.setAttribute("maHK", maHK);
		request.setAttribute("maLop", maLop);
		request.setAttribute("maMH", maMH);
		
		model.addAttribute("listHK", getListHocKi(tk.getTenDN()));
		model.addAttribute("listLop", getListLop(tk.getTenDN()));
		model.addAttribute("listMH", getListMonHoc(tk.getTenDN()));
		model.addAttribute("listDSV", diemSVByGV(maGV, maLop, maHK, maMH));
		return "teacher/diemsinhvienltc";
	}
	
	@RequestMapping(value = "/locsvnhapdiem", method = RequestMethod.POST)
	public String locSVNhapDiem(HttpServletRequest request, Model model, HttpSession session) {
		Object ob = session.getAttribute("taiKhoan");
		TaiKhoan tk = new TaiKhoan();
		tk = (TaiKhoan) ob;
		GiangVien giangVien = new GiangVien();
		giangVien = giangVien.getGVById(tk.getTenDN(), getListTeacher());
		String maGV = giangVien.getMaGV();
		String maHK = request.getParameter("maHK");
		String maLop = request.getParameter("maLop");
		String maMH = request.getParameter("maMH");
		
		request.setAttribute("maHK", maHK);
		request.setAttribute("maLop", maLop);
		request.setAttribute("maMH", maMH);
		
		model.addAttribute("listHK", getListHocKi(tk.getTenDN()));
		model.addAttribute("listLop", getListLop(tk.getTenDN()));
		model.addAttribute("listMH", getListMonHoc(tk.getTenDN()));
		model.addAttribute("listDSV", diemSVByGV(maGV, maLop, maHK, maMH));
		return "teacher/nhapdiemsvltc";
	}
	
	
	@RequestMapping(value = "/luudiemcsdlbygv", method = RequestMethod.POST)
	public String luuDiem(HttpServletRequest request, Model model, HttpSession session1) {
		Object ob = session1.getAttribute("taiKhoan");
		TaiKhoan tk = new TaiKhoan();
		tk = (TaiKhoan) ob;
		
		String maHK = request.getParameter("maHK");
		String maLop = request.getParameter("maLop");
		String maMH = request.getParameter("maMH");
		
		String[] idLTC = request.getParameterValues("ID");
		String[] idSV = request.getParameterValues("idSv");
		String[] diemCC = request.getParameterValues("diemCC");
		String[] diemKT = request.getParameterValues("diemKT");
		String[] diemTH = request.getParameterValues("diemTH");
		String[] diemSE = request.getParameterValues("diemSE");
		MonHoc monHoc = new MonHoc();
		monHoc = monHoc.getMonHocById(maMH, getListMonHoc(tk.getTenDN()));
		int rs = idLTC.length;
		Session session = factory.getCurrentSession();
		Transaction tr = session.beginTransaction();
		Query query = session.createNativeQuery("{call SP_UpdateDiemByGV(?, ?, ?, ?, ?, ?)}");
		for(int i = 0; i < rs; i++) {
			query.setParameter(1, idLTC[i]);
			query.setParameter(2, idSV[i]);
			query.setParameter(3, Double.parseDouble(diemCC[i]));
			query.setParameter(4, Double.parseDouble(diemKT[i]));
			query.setParameter(5, Double.parseDouble(diemTH[i]));
			query.setParameter(6, Double.parseDouble(diemSE[i]));
			query.executeUpdate();
		}
		tr.commit();
		session.close();
		request.setAttribute("maHK", maHK);
		request.setAttribute("maLop", maLop);
		request.setAttribute("maMH", maMH);		
		model.addAttribute("listHK", getListHocKi(tk.getTenDN()));
		model.addAttribute("listLop", getListLop(tk.getTenDN()));
		model.addAttribute("listMH", getListMonHoc(tk.getTenDN()));
		model.addAttribute("listDSV", diemSVByGV(tk.getTenDN(), maLop, maHK, maMH));
		
		return "teacher/nhapdiemsvltc";
	}
	
	@RequestMapping(value = "/suattcngv", method = RequestMethod.POST)
	public String suaTTCaNhanGV(HttpServletRequest request, Model model) {
		
		Session session = factory.getCurrentSession();
		Transaction tr = session.beginTransaction();
		String maGV = request.getParameter("maGV");
		GiangVien giangVien = session.get(GiangVien.class, maGV);
		String tenGV = request.getParameter("tenGV");
		String ngaySinh = request.getParameter("ngaySinh");
		Date NS = Date.valueOf(ngaySinh);
		String gioiTinh = request.getParameter("gioiTinh");
		String hocHam = request.getParameter("hocHam");
		String queQuan = request.getParameter("queQuan");
		String email2 = request.getParameter("email2");
		String sdt2 = request.getParameter("sdt2");
		giangVien.setHoTen(tenGV);
		giangVien.setNgaySinh(NS);
		giangVien.setGioiTinh(gioiTinh);
		giangVien.setHocHam(hocHam);
		giangVien.setQueQuan(queQuan);
		giangVien.setEmail2(email2);
		giangVien.setSDT2(sdt2);
		session.merge(giangVien);
		tr.commit();
		session.close();
		model.addAttribute("teacher", giangVien);
		request.setAttribute("mgs_updateTTGV", "Thay đổi thông tin thành công!");
		return "teacher/thongtincanhan";
	}
	@RequestMapping("/thongkebygv")
	public String thongKeDiem(Model model, HttpSession session) {
		Object ob = session.getAttribute("taiKhoan");
		TaiKhoan tk = new TaiKhoan();
		tk = (TaiKhoan) ob;
		model.addAttribute("listHK", getListHocKi(tk.getTenDN()));
		model.addAttribute("listLop", getListLop(tk.getTenDN()));
		model.addAttribute("listMH", getListMonHoc(tk.getTenDN()));
		return "teacher/thongke";
	}
	@RequestMapping(value = "/thongkebygv", method = RequestMethod.POST)
	public String thongKeDiemSVByAd(HttpServletRequest request, Model model, HttpSession session) {
		Object ob = session.getAttribute("taiKhoan");
		TaiKhoan tk = new TaiKhoan();
		tk = (TaiKhoan) ob;
		
		String maHK = request.getParameter("maHK");
		String maLop = request.getParameter("maLop");
		String maMH = request.getParameter("maMH");
		
		request.setAttribute("maHK", maHK);
		request.setAttribute("maLop", maLop);
		request.setAttribute("maMH", maMH);
		
		model.addAttribute("listHK", getListHocKi(tk.getTenDN()));
		model.addAttribute("listLop", getListLop(tk.getTenDN()));
		model.addAttribute("listMH", getListMonHoc(tk.getTenDN()));
		model.addAttribute("data", thongKeByGV(tk.getTenDN(), maLop, maHK, maMH));
		return "teacher/thongke";
	}
	public List<GiangVien> getListTeacher() {
		SessionFactory factory = HibernateUtil.getSessionFactory();
		List<GiangVien> listTeacher = new ArrayList<>();
		Session session = factory.getCurrentSession();
		Transaction tr = session.beginTransaction();
		String hql = "from GiangVien";
		Query query = session.createQuery(hql);
		listTeacher = query.list();
		tr.commit();
		session.close();
		return listTeacher;
	}
	@ModelAttribute("listHocKi")
	public List<HocKi> getListHocKi(String maGV){
		SessionFactory factory = HibernateUtil.getSessionFactory();
		List<HocKi> listHocKi = new ArrayList<>();
		Set<HocKi> lHK = new HashSet<>();
		Session session = factory.getCurrentSession();
		Transaction tr = session.beginTransaction();
		String hql = "select CT.hocKi from CT_LopTinChi CT where CT.giangVien.maGV = :maGV";
		Query query = session.createQuery(hql);
		query.setParameter("maGV", maGV);
		listHocKi = query.list();
		lHK.addAll(listHocKi);
		listHocKi.clear();
		listHocKi.addAll(lHK);
		tr.commit();
		session.close();
		return listHocKi;
	}
	
	@ModelAttribute("listLop")
	public List<Lop> getListLop(String maGV){
		SessionFactory factory = HibernateUtil.getSessionFactory();
		List<Lop> listLop = new ArrayList<>();
		Set<Lop> l = new HashSet<>();
		Session session = factory.getCurrentSession();
		Transaction tr = session.beginTransaction();
		String hql = "select CT.lop from CT_LopTinChi CT where CT.giangVien.maGV = :maGV";
		Query query = session.createQuery(hql);
		query.setParameter("maGV", maGV);
		listLop = query.list();
		l.addAll(listLop);
		listLop.clear();
		listLop.addAll(l);
		tr.commit();
		session.close();
		return listLop;
	}
	
	@ModelAttribute("listMonHoc")
	public List<MonHoc> getListMonHoc(String maGV){
		SessionFactory factory = HibernateUtil.getSessionFactory();
		List<MonHoc> listMonHoc = new ArrayList<>();
		Set<MonHoc> mh = new HashSet<>();
		Session session = factory.getCurrentSession();
		Transaction tr = session.beginTransaction();
		String hql = "select CT.monHoc from CT_LopTinChi CT where CT.giangVien.maGV = :maGV";
		Query query = session.createQuery(hql);
		query.setParameter("maGV", maGV);
		listMonHoc = query.list();
		mh.addAll(listMonHoc);
		listMonHoc.clear();
		listMonHoc.addAll(mh);
		tr.commit();
		session.close();
		return listMonHoc;
	}
	
	public List<SinhVien> locSvByGV(String maGV, String maLop, String maHK, String maMH){
		SessionFactory factory = HibernateUtil.getSessionFactory();
		List<SinhVien> listSV = new ArrayList<>();
		Session session = factory.getCurrentSession();
		Transaction tr = session.beginTransaction();
		String hql = "SELECT sv FROM SinhVien sv "
				+ "INNER JOIN sv.dsSVHocLopTC svLTC "
				+ "INNER JOIN svLTC.lopTinChi ltc "
				+ "WHERE ltc.giangVien.maGV = :maGV "
				+ "AND ltc.lop.maLop = :maLop "
				+ "AND ltc.hocKi.maHK = :maHK "
				+ "AND ltc.monHoc.maMH = :maMH";
		Query query = session.createQuery(hql);
		query.setParameter("maGV", maGV);
		query.setParameter("maLop", maLop);
		query.setParameter("maHK", maHK);
		query.setParameter("maMH", maMH);
		listSV = query.getResultList();
		return listSV;
	}
	
	public List<Object[]> diemSVByGV(String maGV, String maLop, String maHK, String maMH){
		List<Object[]> listDSV = new ArrayList<>();
		Session session = factory.getCurrentSession();
		Transaction tr = session.beginTransaction();
		Query query = session.createNativeQuery("{call SP_LKDiemSVByGV(?, ?, ?, ?)}");
		query.setParameter(1, maGV);
		query.setParameter(2, maLop);
		query.setParameter(3, maHK);
		query.setParameter(4, maMH);
		listDSV	= query.getResultList();
		return listDSV;
	}
	
	public List<Object[]> thongKeByGV(String maGV, String maLop, String maHK, String maMH){
		List<Object[]> ob = new ArrayList<>();
		Session session = factory.getCurrentSession();
		Transaction tr = session.beginTransaction();
		Query query = session.createNativeQuery("{call SP_ThongKeDiemByGV(?, ?, ?, ?)}");
		query.setParameter(1, maGV);
		query.setParameter(2, maLop);
		query.setParameter(3, maHK);
		query.setParameter(4, maMH);
		ob	= query.getResultList();
		return ob;
	}
}
