package controller;

import java.security.NoSuchAlgorithmException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List; 
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import Util.HibernateUtil;
import encrypt.PasswordEncoder;
import model.CT_LopTinChi;
import model.GiangVien;
import model.HocKi;
import model.KhoaHoc;
import model.Lop;
import model.MonHoc;
import model.NguoiQT;
import model.Role;
import model.SinhVien;
import model.TaiKhoan;

@Transactional
@Controller

public class AdminController {
	SessionFactory factory = HibernateUtil.getSessionFactory();
	@RequestMapping("/index_admin")
	public String indexAdmin() {
		return "admin/index_admin";
	}

	@RequestMapping(value = "/themtaikhoan")
	public String themTaiKhoan(HttpSession session) {
		session.setAttribute("mgs_addTk", "");
		return "admin/themtaikhoan";
	}

	@RequestMapping(value = "/themtaikhoan", method = RequestMethod.POST)
	public String themTaiKhoan(HttpServletRequest request) {
		TaiKhoan taiKhoan = new TaiKhoan();
		taiKhoan.setTenDN(request.getParameter("tenDN"));
		taiKhoan.setTrangThai(1);
		try {
			taiKhoan.setPassword(PasswordEncoder.encodePassword(taiKhoan.getTenDN()));
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Role role = new Role();
		role = role.getRoleById(Integer.parseInt(request.getParameter("Role")), getRoles());
		request.setAttribute("maNguoiDung", taiKhoan.getTenDN());
		taiKhoan.setRole(role);
		int check = 0;
		Session session = factory.getCurrentSession();
		Transaction tr = session.beginTransaction();
		if(session.find(TaiKhoan.class, taiKhoan.getTenDN()) == null) {
			session.save(taiKhoan);
			check = 1;
		} else {
			request.setAttribute("mgs_addTk", "Tài khoản đã có trong hệ thống!");
		}
		tr.commit();
		session.close();
		if(check == 1) { // Nếu thêm được thì sẽ chuyển về trang điền thông tin
			if(role.getMaRole() == 1) {
				request.setAttribute("email1", taiKhoan.getTenDN().toLowerCase() + "@ptithcm.edu.vn");
				return "admin/themnguoiqt";
			} else if(role.getMaRole() == 2) {
				request.setAttribute("email1", taiKhoan.getTenDN().toLowerCase() + "@ptithcm.edu.vn");
				return "admin/themgiangvien";
			} else if(role.getMaRole() == 3) {
				request.setAttribute("email1", taiKhoan.getTenDN().toLowerCase() + "@student.ptithcm.edu.vn");
				return "admin/themsinhvien";
			}
		}
		return "admin/themtaikhoan";
	}

	@RequestMapping(value = "/danhsachtaikhoan")
	public String dsTaiKhoan() {
		return "admin/danhsachtaikhoan";
	}

	@RequestMapping(value = "/danhsachtaikhoan", method = RequestMethod.POST)
	public String dsTaiKhoan(HttpServletRequest request, Model model) {
		String[] s = request.getParameterValues("checkDis");
		List<TaiKhoan> account = getListAccount();
		List<TaiKhoan> tmp = new ArrayList<>();
		if (s != null) {
			for (int i = 0; i < s.length; i++) {
				// xóa các đối tượng không disable ra khỏi danh sách
				tmp.add(account.get(Integer.parseInt(s[i])));
			}
		}
		account.removeAll(tmp);
		if (account != null) {
			Session session = factory.getCurrentSession();
			Transaction tr = session.beginTransaction();
			for (int i = 0; i < account.size(); i++) {
				// cập nhật trạng thái disable
				String hql = "update TaiKhoan set TrangThai = :trangThai where TenDN = :tenDN";
				Query query = session.createQuery(hql);
				query.setParameter("trangThai", 0);
				query.setParameter("tenDN", account.get(i).getTenDN());
				int x = query.executeUpdate();
			}
			for (int i = 0; i < tmp.size(); i++) {
				// bỏ trạng thái disable
				String hql = "update TaiKhoan set TrangThai = :trangThai where TenDN = :tenDN";
				Query query = session.createQuery(hql);
				query.setParameter("trangThai", 1);
				query.setParameter("tenDN", tmp.get(i).getTenDN());
				int x = query.executeUpdate();
			}
			tr.commit();
			session.close();
		}
		model.addAttribute("listAccount", getListAccount());
		return "admin/danhsachtaikhoan";
	}

	@RequestMapping("/themgiangvien")
	public String themGiangVien() {
		return "admin/themgiangvien";
	}

	@RequestMapping("/themsinhvien")
	public String themSinhVien() {
		return "admin/themsinhvien";
	}
	
	@RequestMapping("/themnguoiqt")
	public String themNguoiQT() {
		return "admin/themnguoiqt";
	}
	
	@RequestMapping("/themkhoahoc")
	public String themKhoaHoc() {
		return "admin/themkhoahoc";
	}
	
	@RequestMapping("/themhocki")
	public String themHocKi() {
		return "admin/themhocki";
	}
	
	@RequestMapping("/themlop")
	public String themLop() {
		return "admin/themlop";
	}
	
	@RequestMapping("/themmonhoc")
	public String themMonHoc() {
		return "admin/themmonhoc";
	}
	@RequestMapping("/themloptinchi")
	public String themLopTC() {
		return "admin/themloptc";
	}
	
	@RequestMapping(value = "/locdssvbyad", method = RequestMethod.GET)
	public String locDsSV(HttpServletRequest request, Model model, HttpSession session) {
		
		String maHK = request.getParameter("maHK");
		String maLop = request.getParameter("maLop");
		String maMH = request.getParameter("maMH");
		
		request.setAttribute("maHK", maHK);
		request.setAttribute("maLop", maLop);
		request.setAttribute("maMH", maMH);

		
		model.addAttribute("listHocKi", getListHocKi());
		model.addAttribute("listLop", getListLop());
		model.addAttribute("listMonHoc", getListMonHoc());
		
		model.addAttribute("listSV", getSVByAd(maHK, maMH, maLop));
		return "admin/nhapdiem";
	}
	
	@RequestMapping(value = "/luudiemcsdl", method = RequestMethod.POST)
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
		String[] diemThi = request.getParameterValues("diemThi");
		MonHoc monHoc = new MonHoc();
		monHoc = monHoc.getMonHocById(maMH, getListMonHoc());
		int rs = idLTC.length;
		Session session = factory.getCurrentSession();
		Transaction tr = session.beginTransaction();
		Query query = session.createNativeQuery("{call SP_UpdateDiem(?, ?, ?, ?, ?, ?, ?, ?, ?)}");
		for(int i = 0; i < rs; i++) {
			query.setParameter(1, idLTC[i]);
			query.setParameter(2, idSV[i]);
			query.setParameter(3, Double.parseDouble(diemCC[i]));
			query.setParameter(4, Double.parseDouble(diemKT[i]));
			query.setParameter(5, Double.parseDouble(diemTH[i]));
			query.setParameter(6, Double.parseDouble(diemSE[i]));
			query.setParameter(7, Double.parseDouble(diemThi[i]));
			double CC = Double.parseDouble(diemCC[i]) * monHoc.getphanTramDiemCC() / 100;
			double KT = Double.parseDouble(diemKT[i]) * monHoc.getphanTramDiemKT() / 100;
			double TH = Double.parseDouble(diemTH[i]) * monHoc.getphanTramDiemTH() / 100;
			double SE = Double.parseDouble(diemSE[i]) * monHoc.getphanTramDiemSe() / 100;
			double Thi = Double.parseDouble(diemThi[i]) * monHoc.getphanTramDiemThi() / 100;
			double tongKet = ((CC + KT + TH + SE + Thi)* 10)/ 10;
			query.setParameter(8, tongKet);
			query.setParameter(9, tk.getTenDN());
			query.executeUpdate();
		}
		tr.commit();
		session.close();
		request.setAttribute("maHK", maHK);
		request.setAttribute("maLop", maLop);
		request.setAttribute("maMH", maMH);
		
		model.addAttribute("listHocKi", getListHocKi());
		model.addAttribute("listLop", getListLop());
		model.addAttribute("listMonHoc", getListMonHoc());
		model.addAttribute("listSV", getSVByAd(maHK, maMH, maLop));
		
		return "admin/nhapdiem";
	}
	
	
	@RequestMapping("/xemdiembyad")
	public String xemDiem(Model model) {
		model.addAttribute("listHK", getListHocKi());
		model.addAttribute("listLop", getListLop());
		model.addAttribute("listMH", getListMonHoc());
		return "admin/diemsinhvienltc";
	}
	@RequestMapping(value = "/locdiemsvbyad", method = RequestMethod.POST)
	public String locDiemSVByAd(HttpServletRequest request, Model model, HttpSession session) {
		String maHK = request.getParameter("maHK");
		String maLop = request.getParameter("maLop");
		String maMH = request.getParameter("maMH");
		
		request.setAttribute("maHK", maHK);
		request.setAttribute("maLop", maLop);
		request.setAttribute("maMH", maMH);
		model.addAttribute("listHK", getListHocKi());
		model.addAttribute("listLop", getListLop());
		model.addAttribute("listMH", getListMonHoc());
		model.addAttribute("listDSV", diemSVByAd(maLop, maHK, maMH));
		return "admin/diemsinhvienltc";
	}
	@RequestMapping("/thongkebyad")
	public String thongKeDiem(Model model) {
		model.addAttribute("listHK", getListHocKi());
		model.addAttribute("listLop", getListLop());
		model.addAttribute("listMH", getListMonHoc());
		return "admin/thongkediem";
	}
	@RequestMapping(value = "/thongkebyad", method = RequestMethod.POST)
	public String thongKeDiemSVByAd(HttpServletRequest request, Model model, HttpSession session) {
		String maHK = request.getParameter("maHK");
		String maLop = request.getParameter("maLop");
		String maMH = request.getParameter("maMH");
		
		request.setAttribute("maHK", maHK);
		request.setAttribute("maLop", maLop);
		request.setAttribute("maMH", maMH);
		
		model.addAttribute("listHK", getListHocKi());
		model.addAttribute("listLop", getListLop());
		model.addAttribute("listMH", getListMonHoc());
		model.addAttribute("data1", thongKeSLByAd(maLop, maHK, maMH));
		System.out.println(thongKeSLByAd(maLop, maHK, maMH).size());
		model.addAttribute("data2", thongKeSvDatByAd(maLop, maHK, maMH));
		return "admin/thongkediem";
	}
	
	@RequestMapping(value = "/themloptinchi", method = RequestMethod.POST)
	public String themLopTC(HttpServletRequest request, Model model) {
		
		int soLuongNhom = Integer.parseInt(request.getParameter("slNhom"));
		
		HocKi hocKi = new HocKi();
		hocKi = hocKi.getHocKiById(request.getParameter("maHK"), getListHocKi());
		
		Lop lop = new Lop();
		lop = lop.getLopById(request.getParameter("maLop"), getListLop());
		
		MonHoc monHoc = new MonHoc();
		monHoc = monHoc.getMonHocById(request.getParameter("maMH"), getListMonHoc());
		
		GiangVien giangVien = new GiangVien();
		giangVien = giangVien.getGVById(request.getParameter("maGV"), getListTeacher());
		
		String ngayBD = request.getParameter("ngayBDHoc");
		Date ngayBDHoc = Date.valueOf(ngayBD);
		
		String ngayKT = request.getParameter("ngayKTHoc");
		int slToiDa = Integer.parseInt(request.getParameter("slToiDa"));
		Date ngayKTHoc = Date.valueOf(ngayKT);
		Session session = factory.getCurrentSession();
		Transaction tr = session.beginTransaction();
		String hql = "from CT_LopTinChi CT where CT.hocKi.maHK = :maHK and CT.lop.maLop = :maLop and CT.monHoc.maMH = :maMH";
		Query query = session.createQuery(hql);
		query.setParameter("maHK", hocKi.getMaHK());
		query.setParameter("maLop", lop.getMaLop());
		query.setParameter("maMH", monHoc.getMaMH());
		if(query.getResultList().size() == 0) {
			for (int i = 1; i <= soLuongNhom; i++) {
				CT_LopTinChi ctLopTC = new CT_LopTinChi(i, lop, monHoc, hocKi, ngayBDHoc, ngayKTHoc, slToiDa / soLuongNhom, 0, 0, giangVien);
				session.save(ctLopTC);
			}
		}
		tr.commit();
		session.close();
		model.addAttribute("listLopTinChi", getListLopTC());
		return "admin/danhsachloptc";
	}
	
	@RequestMapping(value = "/themnguoiqt", method = RequestMethod.POST)
	public String themNguoiQT(HttpServletRequest request, Model model) {
		String maNQT = request.getParameter("maNQT");
		String tenNQT = request.getParameter("tenNQT");
		String ngaySinh = request.getParameter("ngaySinh");
		Date NS = Date.valueOf(ngaySinh);
		String gioiTinh = request.getParameter("gioiTinh");
		String email1 = request.getParameter("email1");
		String email2 = request.getParameter("email2");
		String sdt1 = request.getParameter("sdt1");
		String sdt2 = request.getParameter("sdt2");
		String queQuan = request.getParameter("queQuan");
		Session session = factory.getCurrentSession();
		Transaction tr = session.beginTransaction();
		NguoiQT nguoiQT = new NguoiQT(maNQT, tenNQT, NS, gioiTinh, email1, email2, sdt1, sdt2, queQuan);
		session.save(nguoiQT);
		tr.commit();
		session.close();
		model.addAttribute("listNguoiQT", getNguoiQT());
		return "admin/danhsachnguoiqt";
	}
	
	@RequestMapping(value = "/themgiangvien", method = RequestMethod.POST)
	public String themGiangVien(HttpServletRequest request, Model model) {
		String maGV = request.getParameter("maGV");
		String tenGV = request.getParameter("tenGV");
		String ngaySinh = request.getParameter("ngaySinh");
		Date NS = Date.valueOf(ngaySinh);
		String gioiTinh = request.getParameter("gioiTinh");
		String hocHam = request.getParameter("hocHam");
		String email1 = request.getParameter("email1");
		String email2 = request.getParameter("email2");
		String sdt1 = request.getParameter("sdt1");
		String sdt2 = request.getParameter("sdt2");
		String queQuan = request.getParameter("queQuan");
		Session session = factory.getCurrentSession();
		Transaction tr = session.beginTransaction();
		GiangVien gv = new GiangVien(maGV, tenGV, gioiTinh, NS, hocHam, email1, email2, sdt1, sdt2, queQuan);
		session.save(gv);
		tr.commit();
		session.close();
		model.addAttribute("listTeacher", getListTeacher());
		return "admin/danhsachgiangvien";
	}
	
	
	@RequestMapping(value = "/themsinhvien", method = RequestMethod.POST)
	public String themSinhVien(HttpServletRequest request, Model model) {
		String maSV = request.getParameter("maSV");
		String tenSV = request.getParameter("tenSV");
		String ngaySinh = request.getParameter("ngaySinh");
		Date NS = Date.valueOf(ngaySinh);
		String gioiTinh = request.getParameter("gioiTinh");
		
		String queQuan = request.getParameter("queQuan");
		
		String maLop = request.getParameter("maLop");
		Lop lop = new Lop();
		lop = lop.getLopById(maLop, getListLop());
		
		String email1 = request.getParameter("email1");
		String email2 = request.getParameter("email2");
		String sdt1 = request.getParameter("sdt1");
		String sdt2 = request.getParameter("sdt2");
		Session session = factory.getCurrentSession();
		Transaction tr = session.beginTransaction();
		
		SinhVien sinhVien = new SinhVien(maSV, tenSV, gioiTinh, NS, email1, email2, sdt1, sdt2, queQuan, lop);
		session.save(sinhVien);
		tr.commit();
		session.close();
		model.addAttribute("listSinhVien", getSinhVien());
		return "admin/danhsachsinhvien";
	}
	
	@RequestMapping(value = "/themkhoahoc", method = RequestMethod.POST)
	public String themKhoaHoc(HttpServletRequest request, Model model) {
		String maKhoaHoc = request.getParameter("maKhoaHoc");
		String namBD = request.getParameter("namBD");
		String namKT = request.getParameter("namKT");
		Session session = factory.getCurrentSession();
		Transaction tr = session.beginTransaction();
		KhoaHoc khoaHoc = new KhoaHoc(maKhoaHoc, Integer.parseInt(namBD), Integer.parseInt(namKT));
		String hql = "from KhoaHoc where maKH = :maKH";
		Query query = session.createQuery(hql);
		query.setParameter("maKH", maKhoaHoc);
		if(query.list().size() == 0) {
			session.save(khoaHoc);
			tr.commit();
			session.close();
			model.addAttribute("listKhoaHoc", getListKhoaHoc());
			request.setAttribute("mgs_InsertKH", "Thêm khóa học thành công!");
			return "admin/danhsachkhoahoc";
		}
		request.setAttribute("mgs_InsertKH", "Mã khóa học đã tồn tại!");
		request.setAttribute("namBD", namBD);
		request.setAttribute("namKT", namKT);
		tr.commit();
		session.close();
		return "admin/themkhoahoc";
	}
	
	@RequestMapping(value = "/themhocki", method = RequestMethod.POST)
	public String themHocKi(HttpServletRequest request, Model model) {
		String maHocKi = request.getParameter("maHK");
		String ngayBD = request.getParameter("ngayBD");
		String ngayKT = request.getParameter("ngayKT");
	
		
		Session session = factory.getCurrentSession();
		Transaction tr = session.beginTransaction();
		HocKi hocKi = new HocKi(maHocKi, Date.valueOf(ngayBD), Date.valueOf(ngayKT));
		String hql = "from HocKi where maHK = :maHK";
		Query query = session.createQuery(hql);
		query.setParameter("maHK", maHocKi);
		if(query.list().size() == 0) {
			session.save(hocKi);
			tr.commit();
			session.close();
			model.addAttribute("listHocKi", getListHocKi());
			request.setAttribute("mgs_InsertHK", "Thêm học kì thành công!");
			return "admin/danhsachhocki";
		}
		tr.commit();
		session.close();
		request.setAttribute("mgs_InsertHK", "Mã học kì đã tồn tại!");
		return "admin/themhocki";
	}
	

	@RequestMapping(value = "/themlop", method = RequestMethod.POST)
	public String themLop(HttpServletRequest request, Model model) {
		
		String maLop = request.getParameter("maLop");
		String tenLop = request.getParameter("tenLop");
		KhoaHoc khoaHoc = new KhoaHoc();
		khoaHoc = khoaHoc.getKhoaHocById(request.getParameter("maKhoaHoc"), getListKhoaHoc());
		
		Lop lop = new Lop(maLop, tenLop, khoaHoc);
		
		Session session = factory.getCurrentSession();
		Transaction tr = session.beginTransaction();
		
		String hql = "from Lop L where L.maLop = :maLop";
		Query query = session.createQuery(hql);
		
		query.setParameter("maLop", maLop);
		
		if(query.getResultList().size() == 0) {
			session.save(lop);
			tr.commit();
			session.close();
			model.addAttribute("listLop", getListLop());
			request.setAttribute("mgs_InsertLop", "Thêm lớp thành công!");
			return "admin/danhsachlop";
		}
		request.setAttribute("mgs_InsertLop", "Mã lớp đã tồn tại!");
		tr.commit();
		session.close();
		return "admin/themlop";
	}
	
	@RequestMapping(value = "/themmonhoc", method = RequestMethod.POST)
	public String themMonHoc(HttpServletRequest request, Model model) {
		
		String maMonHoc = request.getParameter("idMh");
		String tenMonHoc = request.getParameter("tenMh");
		int stc = Integer.parseInt(request.getParameter("stc"));
		int stchp = Integer.parseInt(request.getParameter("stchp"));
		int phanTramDiemCC = Integer.parseInt(request.getParameter("%dcc"));
		int phanTramDiemSe = Integer.parseInt(request.getParameter("%dse"));
		int phanTramDiemKT = Integer.parseInt(request.getParameter("%dkt"));
		int phanTramDiemTH = Integer.parseInt(request.getParameter("%dth"));
		int phanTramDiemThi = Integer.parseInt(request.getParameter("%dt"));
		
		Session session = factory.getCurrentSession();
		Transaction tr = session.beginTransaction();
		
		String hql = "from MonHoc MH where MH.maMH = :maMH";
		Query query = session.createQuery(hql);
		
		query.setParameter("maMH", maMonHoc);
		
		if(query.getResultList().size() == 0) {
			MonHoc monHoc = new MonHoc(maMonHoc, tenMonHoc, stc, stchp, phanTramDiemCC, phanTramDiemKT, phanTramDiemTH, phanTramDiemSe, phanTramDiemThi);
			session.save(monHoc);
			tr.commit();
			session.close();
			model.addAttribute("listMonHoc", getListMonHoc());
			request.setAttribute("mgs_InsertLop", "Thêm môn thành công!");
			return "admin/danhsachmonhoc";
		}
		request.setAttribute("mgs_InsertLop", "Mã môn học đã tồn tại!");
		tr.commit();
		session.close();
		return "admin/themmonhoc";
	}
	
	@RequestMapping("/danhsachgiangvien")
	public String dsGiangVien() {
		return "admin/danhsachgiangvien";
	}
	
	@RequestMapping("/danhsachsinhvien")
	public String dsSinhVien() {
		return "admin/danhsachsinhvien";
	}
	
	@RequestMapping("/danhsachnguoiqt")
	public String dsNguoiQT() {
		return "admin/danhsachnguoiqt";
	}

	@RequestMapping("/danhsachkhoahoc")
	public String dsKhoaHoc() {
		return "admin/danhsachkhoahoc";
	}
	
	@RequestMapping("/danhsachhocki")
	public String dsHocKi() {
		return "admin/danhsachhocki";
	}
	
	@RequestMapping("/danhsachlop")
	public String dsLop() {
		return "admin/danhsachlop";
	}
	
	@RequestMapping("/danhsachmonhoc")
	public String dsMonHoc() {
		return "admin/danhsachmonhoc";
	}
	
	@RequestMapping("/danhsachloptinchi")
	public String dsLopTC() {
		return "admin/danhsachloptc";
	}

	@RequestMapping("/ctkhoahoc")
	public String chiTietKhoaHoc(HttpServletRequest request) {
		String idKhoaHoc = request.getParameter("id");
		request.setAttribute("idKhoaHoc", idKhoaHoc);
		return "admin/ctkhoahoc";
	}
	
	@RequestMapping("/cthocki")
	public String chiTietHocKi(HttpServletRequest request) {
		String idHocKi = request.getParameter("id");
		request.setAttribute("idHocKi", idHocKi);
		return "admin/cthocki";
	}
	
	@RequestMapping("/ctlop")
	public String chiTietLop(HttpServletRequest request) {
		String idLop = request.getParameter("id");
		request.setAttribute("idLop", idLop);
		return "admin/ctlop";
	}
	
	
	@RequestMapping("/ctmonhoc")
	public String chiMonHoc(HttpServletRequest request) {
		String idMH = request.getParameter("id");
		request.setAttribute("idMH", idMH);
		return "admin/ctmonhoc";
	}
	@RequestMapping("/thongtincanhan")
	public String thongTinCaNhan(HttpSession session, Model model) {
		Object ob = session.getAttribute("taiKhoan");
		TaiKhoan tk = (TaiKhoan) ob;
		NguoiQT nguoiQT = new NguoiQT();
		nguoiQT = nguoiQT.getNguoiQTById(tk.getTenDN(), getNguoiQT());
		model.addAttribute("admin", nguoiQT);
		return "admin/thongtincanhan";
	}
	@RequestMapping("/nhapdiem")
	public String nhapDiem() {
		return "admin/nhapdiem";
	}
	@RequestMapping("/ctnguoiqt")
	public String thongTinAdmin(Model model, HttpServletRequest request) {
		String adminId = request.getParameter("id");
		NguoiQT nguoiQT = new NguoiQT();
		nguoiQT = nguoiQT.getNguoiQTById(adminId, getNguoiQT());
		model.addAttribute("admin", nguoiQT);
		return "admin/ctnguoiqt";
	}
	
	@RequestMapping("/ctgiangvien")
	public String chiTietGiangVien(Model model, HttpServletRequest request) {
		String teacherId = request.getParameter("id");
		GiangVien teacher = new GiangVien();
		teacher = teacher.getGVById(teacherId, getListTeacher());
		model.addAttribute("teacher", teacher);
		return "admin/ctgiangvien";
	}
	
	@RequestMapping("/ctsinhvien")
	public String chiTietSinhVien(Model model, HttpServletRequest request) {
		String studentID = request.getParameter("id");
		SinhVien sinhVien = new SinhVien();
		sinhVien = sinhVien.getSVById(studentID, getSinhVien());
		model.addAttribute("student", sinhVien);
		return "admin/ctsinhvien";
	}
	
	@RequestMapping("/ctloptc")
	public String chiTietLopTC(HttpServletRequest request, Model model) {
		String idMH = request.getParameter("idMH");
		String idLop = request.getParameter("idLop");
		String idHK = request.getParameter("idHK");
		int x = 0;
		List<Object[]> listLopTC = getListLopTC();
		for (int i = 0; i < listLopTC.size(); i++) {
			if(idMH.equals(listLopTC.get(i)[0]) && idLop.equals(listLopTC.get(i)[1]) && idHK.equals(listLopTC.get(i)[2])) {
				x = i;
				break;
			}
		}
		model.addAttribute("ltc", listLopTC.get(x));
		return "admin/ctloptc";
	}
	
	@RequestMapping(value = "/chinhsuanguoiqt", method = RequestMethod.POST)
	public String chinhNguoiQT(HttpServletRequest request, Model model,
			@RequestParam(value = "saveInfAdmin", required = false) String saveInfAdmin,
			@RequestParam(value = "deleteAdmin", required = false) String deleteAdmin) {
		String maNQT = request.getParameter("maNQT");
		Session session = factory.getCurrentSession();
		Transaction tr = session.beginTransaction();
		NguoiQT nguoiQT = session.get(NguoiQT.class, maNQT);
		if(saveInfAdmin != null) {
			String tenNQT = request.getParameter("tenNQT");
			String ngaySinh = request.getParameter("ngaySinh");
			Date NS = Date.valueOf(ngaySinh);
			String gioiTinh = request.getParameter("gioiTinh");
			String queQuan = request.getParameter("queQuan");
			String email1 = request.getParameter("email1");
			String email2 = request.getParameter("email2");
			String sdt1 = request.getParameter("sdt1");
			String sdt2 = request.getParameter("sdt2");
			nguoiQT.setHoTen(tenNQT);
			nguoiQT.setGioiTinh(gioiTinh);
			nguoiQT.setNgaySinh(NS);
			nguoiQT.setEmail1(email1);
			nguoiQT.setEmail2(email2);
			nguoiQT.setQueQuan(queQuan);
			nguoiQT.setSDT1(sdt1);
			nguoiQT.setSDT2(sdt2);
			session.merge(nguoiQT);
			request.setAttribute("mgs_updateAdmin", "Thay đổi thông tin thành công");
			tr.commit();
			session.close();
			model.addAttribute("listNguoiQT", getNguoiQT());
			return "admin/danhsachnguoiqt";
		} 
		else if(deleteAdmin != null) {
			String hql = "from NguoiQT QT where QT.maNguoiQT = :maQT and QT.maNguoiQT "
					+ "not in (select SVH.nguoiQT. maNguoiQT from SV_HocLopTinChi SVH where SVH.nguoiQT.maNguoiQT <> NULL)";
			Query query = session.createQuery(hql);
			query.setParameter("maQT", maNQT);
			System.out.println(maNQT);
			System.out.println(query.getResultList().size());
			if(query.getResultList().size() != 0) {
				session.delete(nguoiQT);
				String hql1 = "delete from TaiKhoan TK where TK.tenDN = :tenDN";
				Query q = session.createQuery(hql1);
				q.setParameter("tenDN", maNQT);
				q.executeUpdate();
				tr.commit();
				session.close();
				model.addAttribute("listNguoiQT", getNguoiQT());
				request.setAttribute("mgs_updateAdmin", "Xóa thành công người quản trị!");
				return "admin/danhsachnguoiqt";
			} else {
				tr.commit();
				session.close();
				model.addAttribute("admin", nguoiQT);
				request.setAttribute("mgs_updateAdmin", "Không thể xóa người quản trị này!");
				return "admin/ctnguoiqt";
			}
		}
		tr.commit();
		session.close();
		return "admin/danhsachnguoiqt";
	}
	
	@RequestMapping(value = "/chinhsuagiangvien", method = RequestMethod.POST)
	public String chinhSuaGiangVien(HttpServletRequest request,
			@RequestParam(value = "saveInfTeacher", required = false) String saveInfTeacher,
			@RequestParam(value = "deleteTeacher", required = false) String deleteTeacher, Model model) {
		Session session = factory.getCurrentSession();
		Transaction tr = session.beginTransaction();
		String maGV = request.getParameter("maGV");
		GiangVien giangVien = session.get(GiangVien.class, maGV);
		// sửa thông tin giảng viên
		if (saveInfTeacher != null) {
			String tenGV = request.getParameter("tenGV");
			String ngaySinh = request.getParameter("ngaySinh");
			Date NS = Date.valueOf(ngaySinh);
			String gioiTinh = request.getParameter("gioiTinh");
			String hocHam = request.getParameter("hocHam");
			String queQuan = request.getParameter("queQuan");
			String email1 = request.getParameter("email1");
			String email2 = request.getParameter("email2");
			String sdt1 = request.getParameter("sdt1");
			String sdt2 = request.getParameter("sdt2");
			giangVien.setHoTen(tenGV);
			giangVien.setNgaySinh(NS);
			giangVien.setGioiTinh(gioiTinh);
			giangVien.setHocHam(hocHam);
			giangVien.setQueQuan(queQuan);
			giangVien.setEmail1(email1);
			giangVien.setEmail2(email2);
			giangVien.setSDT1(sdt1);
			giangVien.setSDT2(sdt2);
			session.merge(giangVien);
			request.setAttribute("mgs_updateGV", "Thay đổi thông tin giảng viên thành công!");
			tr.commit();
			session.close();
			model.addAttribute("listTeacher", getListTeacher());
			return "admin/danhsachgiangvien";
		} else if (deleteTeacher != null) { // xóa giảng viên
			//nếu giảng viên chưa làm gì thì mới được xóa
			String hql = "from GiangVien GV where GV.maGV = :maGV and GV.maGV not in (Select CT.giangVien.maGV from CT_LopTinChi CT)";
			Query query = session.createQuery(hql);
			query.setParameter("maGV", maGV);
			if (query.getResultList().size() != 0) { // nếu xóa được
				session.delete(giangVien);
				request.setAttribute("mgs_updateGV", "Xóa giảng viên thành công!");
				String hql1 = "delete from TaiKhoan TK where TK.tenDN = :tenDN";
				Query q = session.createQuery(hql1);
				q.setParameter("tenDN", giangVien.getMaGV());
				q.executeUpdate();
				tr.commit();
				session.close();
				model.addAttribute("listTeacher", getListTeacher());
				return "admin/danhsachgiangvien";
			} else {// nếu không xóa được
				request.setAttribute("mgs_updateGV", "Giảng viên đã tham gia hoạt động giảng dạy nên không thể xóa!");
				tr.commit();
				session.close();
				model.addAttribute("teacher", giangVien);
				return "admin/ctgiangvien";
			}
		}
		tr.commit();
		session.close();
		return "admin/danhsachgiangvien";
	}
	
	@RequestMapping(value = "/chinhsuasinhvien", method = RequestMethod.POST)
	public String chinhSuaSinhVien(HttpServletRequest request,
			@RequestParam(value = "saveSV", required = false) String saveSV,
			@RequestParam(value = "deleteSV", required = false) String deleteSV, Model model) {
		Session session = factory.getCurrentSession();
		Transaction tr = session.beginTransaction();
		String maSV = request.getParameter("maSV");
		SinhVien sinhVien = session.get(SinhVien.class, maSV);
		tr.commit();
		session.close();
		// sửa thông tin sinh viên
		if (saveSV != null) {
			String tenSV = request.getParameter("tenSV");
			String ngaySinh = request.getParameter("ngaySinh");
			Date NS = Date.valueOf(ngaySinh);
			String gioiTinh = request.getParameter("gioiTinh");
			String queQuan = request.getParameter("queQuan");
			String email1 = request.getParameter("email1");
			String email2 = request.getParameter("email2");
			String sdt1 = request.getParameter("sdt1");
			String sdt2 = request.getParameter("sdt2");
			String maLop = request.getParameter("maLop");
			Lop lop = new Lop();
			lop = lop.getLopById(maLop, getListLop());
			sinhVien.setHoTen(tenSV);
			sinhVien.setNgaySinh(NS);
			sinhVien.setGioiTinh(gioiTinh);
			sinhVien.setQueQuan(queQuan);
			sinhVien.setEmail1(email1);
			sinhVien.setEmail2(email2);
			sinhVien.setLop(lop);
			sinhVien.setSDT1(sdt1);
			sinhVien.setSDT2(sdt2);
			
			session = factory.getCurrentSession();
			tr = session.beginTransaction();
			
			session.merge(sinhVien);
			request.setAttribute("mgs_updateSV", "Thay đổi thông tin sinh viên thành công!");
			tr.commit();
			session.close();
			model.addAttribute("listSinhVien", getSinhVien());
			return "admin/danhsachsinhvien";
		} else if (deleteSV != null) { // xóa giảng viên
			//nếu giảng viên chưa làm gì thì mới được xóa
			session = factory.getCurrentSession();
			tr = session.beginTransaction();
			String hql = "from SinhVien SV where SV.maSV = :maSV and SV.maSV not in (Select SVHLTC.sinhVien.maSV from SV_HocLopTinChi SVHLTC)";
			Query query = session.createQuery(hql);
			query.setParameter("maSV", maSV);
			List<SinhVien> checkDelSV = query.getResultList();
			if (checkDelSV.size() != 0) { // nếu xóa được
				sinhVien = session.get(SinhVien.class, maSV);
				session.delete(sinhVien);
				request.setAttribute("mgs_updateSV", "Xóa sinh viên thành công!");
				String hql1 = "delete from TaiKhoan TK where TK.tenDN = :tenDN";
				Query q = session.createQuery(hql1);
				q.setParameter("tenDN", sinhVien.getMaSV());
				q.executeUpdate();
				tr.commit();
				session.close();
				model.addAttribute("listSinhVien", getSinhVien());
				return "admin/danhsachsinhvien";
			} else {// nếu không xóa được
				request.setAttribute("mgs_updateSV", "Sinh viên đã tham gia học nên không thể xóa!");
				tr.commit();
				session.close();
				model.addAttribute("student", sinhVien);
				return "admin/ctsinhvien";
			}
		}
		tr.commit();
		session.close();
		return "admin/danhsachsinhvien";
	}

	@RequestMapping(value = "/chinhsuakhoahoc", method = RequestMethod.POST)
	public String chinhSuaKhoaHoc(HttpServletRequest request,
			@RequestParam(value = "saveKH", required = false) String saveKH,
			@RequestParam(value = "deleteKH", required = false) String deleteKH, Model model) {
			//nếu khóa học chưa có lớp hoặc học kì nào thì mới được chỉnh sửa hoặc xóa
		String maKH = request.getParameter("maKH");
		Session session = factory.getCurrentSession();
		Transaction tr = session.beginTransaction();
		String hql = "from KhoaHoc KH where KH.maKH = :maKH and KH.maKH not in (select L.khoaHoc.maKH From Lop L)";
		Query query = session.createQuery(hql);
		query.setParameter("maKH", maKH);
		if(query.getResultList().size() != 0) {//nếu tồn tại khóa học chưa có lớp hoặc học kì nào thì mới được chỉnh sửa hoặc xóa
			KhoaHoc khoaHoc = session.get(KhoaHoc.class, maKH);
			if(saveKH != null) {
				String namBD = request.getParameter("namBD");
				String namKT = request.getParameter("namKT");
				khoaHoc.setNamBD(Integer.parseInt(namBD));
				khoaHoc.setNamKT(Integer.parseInt(namKT));
				session.merge(khoaHoc);
				request.setAttribute("mgs_updateKH", "Thay đổi thông tin khóa học thành công!");
			} else if(deleteKH != null){
				session.delete(khoaHoc);
				request.setAttribute("mgs_updateKH", "Xóa khóa học thành công!");
			}
			tr.commit();
			session.close();
			model.addAttribute("listKhoaHoc", getListKhoaHoc());
			return "admin/danhsachkhoahoc";
		}
		tr.commit();
		session.close();
		request.setAttribute("mgs_updateKH", "Không thể chỉnh sửa hoặc xóa khóa học!");
		return "admin/danhsachkhoahoc";
	}
	
	@RequestMapping(value = "/chinhsuahocki", method = RequestMethod.POST)
	public String chinhSuaHocKi(HttpServletRequest request,
			@RequestParam(value = "saveHK", required = false) String saveHK,
			@RequestParam(value = "deleteHK", required = false) String deleteHK, Model model) {
		String maHK = request.getParameter("maHK");
		Session session = factory.getCurrentSession();
		Transaction tr = session.beginTransaction();
		String hql = "from HocKi HK where HK.maHK = :maHK and HK.maHK not in (select CT.hocKi.maHK from CT_LopTinChi CT)";
		Query query = session.createQuery(hql);
		query.setParameter("maHK", maHK);
		if(query.getResultList().size() != 0) { // nếu học kì đó chưa có lớp tín chỉ thì mới xóa
			HocKi hocKi = session.get(HocKi.class, maHK);
			if(saveHK != null) {
				Date ngayBD = Date.valueOf(request.getParameter("ngayBD"));
				Date ngayKT = Date.valueOf(request.getParameter("ngayKT"));
				hocKi.setNgayBD(ngayBD);
				hocKi.setNgayKT(ngayKT);
				session.merge(hocKi);
				request.setAttribute("mgs_updateHK", "Thay đổi thông tin học kì thành công!");
			} else if(deleteHK != null) {
				session.delete(hocKi);
				request.setAttribute("mgs_updateHK", "Xóa học kì thành công!");
			}
			tr.commit();
			session.close();
			model.addAttribute("listHocKi", getListHocKi());
			return "admin/danhsachhocki";
		}
		tr.commit();
		session.close();
		request.setAttribute("mgs_updateHK", "Không thể chỉnh sửa hoặc xóa học kì!");
		return "admin/danhsachhocki";
	}
	
	@RequestMapping(value = "/chinhsualop", method = RequestMethod.POST)
	public String chinhSuaLop(HttpServletRequest request,
			@RequestParam(value = "saveLop", required = false) String saveLop,
			@RequestParam(value = "deleteLop", required = false) String deleteLop, Model model) {
		String maLop = request.getParameter("maLop");
		Session session = factory.getCurrentSession();
		Transaction tr = session.beginTransaction();
		String hql = "from Lop L where L.maLop = :maLop and L.maLop not in (select CT.lop.maLop from CT_LopTinChi CT) "
				+ "and L.maLop not in (select SV.lop.maLop from SinhVien SV)";
		Query query = session.createQuery(hql);
		query.setParameter("maLop", maLop);
		if(query.getResultList().size() != 0) { // nếu lớp đó chưa có lớp tín chỉ, sinh viên nào thì mới xóa
			Lop lop = session.get(Lop.class, maLop);
			if(saveLop != null) {
				String maKH = request.getParameter("maKhoaHoc");
				String tenLop = request.getParameter("tenLop");
				tr.commit();
				session.close();
				KhoaHoc kh = new KhoaHoc();
				kh = kh.getKhoaHocById(maKH, getListKhoaHoc());
				lop.setTenLop(tenLop);
				lop.setKhoaHoc(kh);
				session = factory.getCurrentSession();
				tr = session.beginTransaction();
				session.merge(lop);
				request.setAttribute("mgs_updateLop", "Thay đổi thông tin lớp thành công!");
			} else if(deleteLop != null) {
				session.delete(lop);
				request.setAttribute("mgs_updateLop", "Xóa lớp thành công!");
			}
			tr.commit();
			session.close();
			model.addAttribute("listLop", getListLop());
			return "admin/danhsachlop";
		}
		tr.commit();
		session.close();
		request.setAttribute("mgs_updateLop", "Không thể chỉnh sửa hoặc xóa lớp!");
		return "admin/danhsachlop";
	}
	
	@RequestMapping(value = "/chinhsuamonhoc", method = RequestMethod.POST)
	public String chinhMonHoc(HttpServletRequest request,
			@RequestParam(value = "saveMH", required = false) String saveMH,
			@RequestParam(value = "deleteMH", required = false) String deleteMH, Model model) {
		String maMH = request.getParameter("idMh");
		Session session = factory.getCurrentSession();
		Transaction tr = session.beginTransaction();
		String hql = "from MonHoc MH where MH.maMH = :maMH and MH.maMH not in (select CT.monHoc.maMH from CT_LopTinChi CT)";
		Query query = session.createQuery(hql);
		query.setParameter("maMH", maMH);
		if(query.getResultList().size() != 0) {
			MonHoc monHoc = session.get(MonHoc.class, maMH);
			if(saveMH != null) {
				String tenMonHoc = request.getParameter("tenMh");
				int stc = Integer.parseInt(request.getParameter("stc"));
				int stchp = Integer.parseInt(request.getParameter("stchp"));
				int phanTramDiemCC = Integer.parseInt(request.getParameter("%dcc"));
				int phanTramDiemSe = Integer.parseInt(request.getParameter("%dse"));
				int phanTramDiemKT = Integer.parseInt(request.getParameter("%dkt"));
				int phanTramDiemTH = Integer.parseInt(request.getParameter("%dth"));
				int phanTramDiemThi = Integer.parseInt(request.getParameter("%dt"));
				monHoc.setTenMH(tenMonHoc);
				monHoc.setSTC(stc);
				monHoc.setSTCHP(stchp);
				monHoc.setphanTramDiemCC(phanTramDiemCC);
				monHoc.setphanTramDiemSe(phanTramDiemSe);
				monHoc.setphanTramDiemKT(phanTramDiemKT);
				monHoc.setphanTramDiemTH(phanTramDiemTH);
				monHoc.setphanTramDiemThi(phanTramDiemThi);
				session.merge(monHoc);
				request.setAttribute("mgs_updateMH", "Thay đổi thông tin môn học thành công!");
			} else if(deleteMH != null) {
				session.delete(monHoc);
				request.setAttribute("mgs_updateMH", "Xóa môn học thành công!");
			}
			tr.commit();
			session.close();
			model.addAttribute("listMonHoc", getListMonHoc());
			return "admin/danhsachmonhoc";
		}
		tr.commit();
		session.close();
		request.setAttribute("mgs_updateMH", "Không thể sửa hoặc xóa môn học!");
		return "admin/danhsachmonhoc";
	}
	
	@RequestMapping(value = "/chinhsualoptc", method = RequestMethod.POST)
	public String chinhLopTC(HttpServletRequest request,
			@RequestParam(value = "saveLTC", required = false) String saveLTC,
			@RequestParam(value = "deleteLTC", required = false) String deleteLTC, Model model) {
		String idMH = request.getParameter("maMH");
		String idLop = request.getParameter("maLop");
		String idHK = request.getParameter("maHK");
		int x = -1;
		List<Object[]> listLTC = getListLopTC();
		Session session = factory.getCurrentSession();
		Transaction tr = session.beginTransaction();
		for (int i = 0; i < listLTC.size(); i++) {
			if(idMH.equals(listLTC.get(i)[0]) && idLop.equals(listLTC.get(i)[1]) && idHK.equals(listLTC.get(i)[2]) && ((int)listLTC.get(i)[7] == 0)) {
				x = i;
				break;
			}
		}
		if(x != -1) {
			String hql = "from CT_LopTinChi CT where CT.monHoc.maMH = :maMH and CT.lop.maLop = :maLop and CT.hocKi.maHK = :maHK";
			Query query = session.createQuery(hql);
			query.setParameter("maMH", idMH);
			query.setParameter("maLop", idLop);
			query.setParameter("maHK", idHK);
			List<CT_LopTinChi> dsLTC = query.getResultList();
			// xoa cac lop tin chi
			for (int i = 0; i < dsLTC.size(); i++) {
				session.delete(dsLTC.get(i));
			}
			if(saveLTC != null) {
				tr.commit();
				session.close();
				request.setAttribute("mgs_updateLTC", "Thay đổi LTC thành công!");
				themLopTC(request, model);
				return "admin/danhsachloptc";
			} 
			else if(deleteLTC != null) {
				tr.commit();
				session.close();
				model.addAttribute("listLopTinChi", getListLopTC());
				request.setAttribute("mgs_updateMH", "Xóa LTC thành công!");
				return "admin/danhsachloptc";
			}
		}
		tr.commit();
		session.close();
		request.setAttribute("mgs_updateLTC", "Không thể sửa hoặc xóa LTC!");
		return "admin/danhsachloptc";
	}
	
	@RequestMapping(value = "/thaydoitt")
	public String thayDoiTT(HttpServletRequest request, Model model) {
		String idMH = request.getParameter("idMH");
		String idLop = request.getParameter("idLop");
		String idHK = request.getParameter("idHK");
		int trangThai = Integer.parseInt(request.getParameter("tt")) == 0 ? 1 : 0;
		
		Session session = factory.getCurrentSession();
		Transaction tr = session.beginTransaction();
		String hql = "UPDATE CT_LopTinChi CT SET CT.trangThai = :TT  WHERE CT.hocKi.maHK = :maHK and CT.lop.maLop = :maLop and CT.monHoc.maMH = :maMH";
		Query query = session.createQuery(hql);
		query.setParameter("TT", trangThai);
		query.setParameter("maHK", idHK);
		query.setParameter("maLop", idLop);
		query.setParameter("maMH", idMH);
		query.executeUpdate();
		tr.commit();
		session.close();
		model.addAttribute("listLopTinChi", getListLopTC());
		return "admin/danhsachloptc";
	}
	
	@RequestMapping(value = "/locSV", method = RequestMethod.POST)
	public String locSinhVienByLop(HttpServletRequest request, Model model) {
		String maLop = request.getParameter("maLop");
		model.addAttribute("maLop", maLop);
		model.addAttribute("listSinhVien", getSinhVienByLop(maLop));
		return "admin/danhsachsinhvien";
	}
	@ModelAttribute("roles")
	public List<Role> getRoles() {
		SessionFactory factory = HibernateUtil.getSessionFactory();
		List<Role> role = new ArrayList<>();
		Session session = factory.getCurrentSession();
		Transaction tr = session.beginTransaction();
		String hql = "from Role";
		Query query = session.createQuery(hql);
		role = query.list();
		tr.commit();
		session.close();
		return role;
	}

	@ModelAttribute("listAccount")
	public List<TaiKhoan> getListAccount() {
		SessionFactory factory = HibernateUtil.getSessionFactory();
		List<TaiKhoan> listAccount = new ArrayList<>();
		Session session = factory.getCurrentSession();
		Transaction tr = session.beginTransaction();
		String hql = "from TaiKhoan";
		Query query = session.createQuery(hql);
		listAccount = query.list();
		tr.commit();
		session.close();
		return listAccount;
	}

	@ModelAttribute("listTeacher")
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

	@ModelAttribute("listNguoiQT")
	public List<NguoiQT> getNguoiQT() {
		SessionFactory factory = HibernateUtil.getSessionFactory();
		List<NguoiQT> listNguoiQT = new ArrayList<>();
		Session session = factory.getCurrentSession();
		Transaction tr = session.beginTransaction();
		String hql = "from NguoiQT";
		Query query = session.createQuery(hql);
		listNguoiQT = query.list();
		tr.commit();
		session.close();
		return listNguoiQT;
	}
	
	@ModelAttribute("listSinhVien")
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
	
	public List<SinhVien> getSinhVienByLop(String maLop) {
		SessionFactory factory = HibernateUtil.getSessionFactory();
		List<SinhVien> listSinhVien = new ArrayList<>();
		Session session = factory.getCurrentSession();
		Transaction tr = session.beginTransaction();
		String hql = "from SinhVien SV where SV.lop.maLop = :maLop";
		Query query = session.createQuery(hql);
		query.setParameter("maLop", maLop);
		listSinhVien = query.list();
		tr.commit();
		session.close();
		return listSinhVien;
	}
	
	@ModelAttribute("listKhoaHoc")
	public List<KhoaHoc> getListKhoaHoc(){
		SessionFactory factory = HibernateUtil.getSessionFactory();
		List<KhoaHoc> listKhoaHoc = new ArrayList<>();
		Session session = factory.getCurrentSession();
		Transaction tr = session.beginTransaction();
		String hql = "from KhoaHoc";
		Query query = session.createQuery(hql);
		listKhoaHoc = query.list();
		tr.commit();
		session.close();
		return listKhoaHoc;
	}
	
	@ModelAttribute("listHocKi")
	public List<HocKi> getListHocKi(){
		SessionFactory factory = HibernateUtil.getSessionFactory();
		List<HocKi> listHocKi = new ArrayList<>();
		Session session = factory.getCurrentSession();
		Transaction tr = session.beginTransaction();
		String hql = "from HocKi";
		Query query = session.createQuery(hql);
		listHocKi = query.list();
		tr.commit();
		session.close();
		return listHocKi;
	}
	
	@ModelAttribute("listLop")
	public List<Lop> getListLop(){
		List<Lop> listLop = new ArrayList<>();
		SessionFactory factory = HibernateUtil.getSessionFactory();
		Session session = factory.getCurrentSession();
		Transaction tr = session.beginTransaction();
		String hql = "from Lop";
		Query query = session.createQuery(hql);
		listLop = query.list();
		tr.commit();
		session.close();
		return listLop;
	}
	
	@ModelAttribute("listMonHoc")
	public List<MonHoc> getListMonHoc(){
		SessionFactory factory = HibernateUtil.getSessionFactory();
		List<MonHoc> listMonHoc = new ArrayList<>();
		Session session = factory.getCurrentSession();
		Transaction tr = session.beginTransaction();
		String hql = "from MonHoc";
		Query query = session.createQuery(hql);
		listMonHoc = query.list();
		tr.commit();
		session.close();
		return listMonHoc;
	}
	
	@ModelAttribute("listLopTinChi")
	public List<Object[]> getListLopTC(){
		SessionFactory factory = HibernateUtil.getSessionFactory();
		List<Object[]> listLopTC = new ArrayList<>();
		Session session = factory.getCurrentSession();
		Transaction tr = session.beginTransaction();
		Query query = session.createNativeQuery("{call SP_LopTC()}");
		listLopTC = query.getResultList();
		tr.commit();
		session.close();
		return listLopTC;
	}
	
	public List<Object[]> getSVByAd(String maHK, String maMH, String maLop){
		SessionFactory factory = HibernateUtil.getSessionFactory();
		List<Object[]> listSV = new ArrayList<>();
		Session session = factory.getCurrentSession();
		Transaction tr = session.beginTransaction();
		Query query = session.createNativeQuery("{call SP_LKSV(?, ?, ?)}");
		query.setParameter(1, maHK);
		query.setParameter(2, maMH);
		query.setParameter(3, maLop);
		listSV = query.getResultList();
		tr.commit();
		session.close();
		return listSV;
	}
	public List<Object[]> diemSVByAd(String maLop, String maHK, String maMH){
		SessionFactory factory = HibernateUtil.getSessionFactory();
		List<Object[]> listDSV = new ArrayList<>();
		Session session = factory.getCurrentSession();
		Transaction tr = session.beginTransaction();
		Query query = session.createNativeQuery("{call SP_LKDiemByAd(?, ?, ?)}");
		query.setParameter(1, maLop);
		query.setParameter(2, maHK);
		query.setParameter(3, maMH);
		listDSV	= query.getResultList();
		return listDSV;
	}
	public List<Object[]> thongKeSLByAd(String maLop, String maHK, String maMH){
		SessionFactory factory = HibernateUtil.getSessionFactory();
		List<Object[]> ob = new ArrayList<>();
		Session session = factory.getCurrentSession();
		Transaction tr = session.beginTransaction();
		Query query = session.createNativeQuery("{call SP_LKSoLuongByAD(?, ?, ?)}");
		query.setParameter(1, maLop);
		query.setParameter(2, maHK);
		query.setParameter(3, maMH);
		ob	= query.getResultList();
		return ob;
	}
	
	public List<Object[]> thongKeSvDatByAd(String maLop, String maHK, String maMH){
		SessionFactory factory = HibernateUtil.getSessionFactory();
		List<Object[]> ob = new ArrayList<>();
		Session session = factory.getCurrentSession();
		Transaction tr = session.beginTransaction();
		Query query = session.createNativeQuery("{call SP_LKSvDatByAD(?, ?, ?)}");
		query.setParameter(1, maLop);
		query.setParameter(2, maHK);
		query.setParameter(3, maMH);
		ob	= query.getResultList();
		return ob;
	}
	
	// thêm phần tìm kiếm
	
	@RequestMapping(value = "/timkiemGV", method = RequestMethod.POST)
	public String timKiemGV(HttpServletRequest request, Model model) {
		String maGV = request.getParameter("maGV");
		model.addAttribute("maGV", maGV);
		List<GiangVien> listTeacher = new ArrayList<>();
		SessionFactory factory = HibernateUtil.getSessionFactory();
		Session session = factory.getCurrentSession();
		Transaction tr = session.beginTransaction();
		String hql = "from GiangVien GV WHERE GV.maGV = :maGV";
		Query query = session.createQuery(hql);
		query.setParameter("maGV", maGV);
		listTeacher = query.list();
		tr.commit();
		session.close();
		model.addAttribute("listTeacher", listTeacher);
		return "admin/danhsachgiangvien";
	}
	
	
	@RequestMapping(value = "/timkiemNQT", method = RequestMethod.POST)
	public String timKiemNQT(HttpServletRequest request, Model model) {
		String maNQT = request.getParameter("maNQT");
		model.addAttribute("maNQT", maNQT);
		List<NguoiQT> listNguoiQT = new ArrayList<>();
		SessionFactory factory = HibernateUtil.getSessionFactory();
		Session session = factory.getCurrentSession();
		Transaction tr = session.beginTransaction();
		String hql = "from NguoiQT NQT WHERE NQT.maNguoiQT = :maNQT";
		Query query = session.createQuery(hql);
		query.setParameter("maNQT", maNQT);
		listNguoiQT = query.list();
		tr.commit();
		session.close();
		model.addAttribute("listNguoiQT", listNguoiQT);
		return "admin/danhsachnguoiqt";
	}
	
	@RequestMapping(value = "/timkiemSV", method = RequestMethod.POST)
	public String timKiemSV(HttpServletRequest request, Model model) {
		String maSV = request.getParameter("maSV");
		model.addAttribute("maSV", maSV);
		List<SinhVien> listSinhVien = new ArrayList<>();
		SessionFactory factory = HibernateUtil.getSessionFactory();
		Session session = factory.getCurrentSession();
		Transaction tr = session.beginTransaction();
		String hql = "from SinhVien SV WHERE SV.maSV = :maSV";
		Query query = session.createQuery(hql);
		query.setParameter("maSV", maSV);
		listSinhVien = query.list();
		tr.commit();
		session.close();
		model.addAttribute("listSinhVien", listSinhVien);
		return "admin/danhsachsinhvien";
	}
	
	@RequestMapping(value = "/timkiemKH", method = RequestMethod.POST)
	public String timKiemKH(HttpServletRequest request, Model model) {
		String maKH = request.getParameter("maKH");
		model.addAttribute("maKH", maKH);
		List<KhoaHoc> listKhoaHoc = new ArrayList<>();
		SessionFactory factory = HibernateUtil.getSessionFactory();
		Session session = factory.getCurrentSession();
		Transaction tr = session.beginTransaction();
		String hql = "from KhoaHoc KH WHERE KH.maKH = :maKH";
		Query query = session.createQuery(hql);
		query.setParameter("maKH", maKH);
		listKhoaHoc = query.list();
		tr.commit();
		session.close();
		model.addAttribute("listKhoaHoc", listKhoaHoc);
		return "admin/danhsachkhoahoc";
	}
	
	@RequestMapping(value = "/timkiemHK", method = RequestMethod.POST)
	public String timKiemHK(HttpServletRequest request, Model model) {
		String maHK = request.getParameter("maHK");
		model.addAttribute("maHK", maHK);
		List<HocKi> listHocKi = new ArrayList<>();
		SessionFactory factory = HibernateUtil.getSessionFactory();
		Session session = factory.getCurrentSession();
		Transaction tr = session.beginTransaction();
		String hql = "from HocKi HK WHERE HK.maHK = :maHK";
		Query query = session.createQuery(hql);
		query.setParameter("maHK", maHK);
		listHocKi = query.list();
		tr.commit();	
		session.close();
		model.addAttribute("listHocKi", listHocKi);
		return "admin/danhsachhocki";
	}
	
	
	@RequestMapping(value = "/timkiemLop", method = RequestMethod.POST)
	public String timKiemLop(HttpServletRequest request, Model model) {
		String maLop = request.getParameter("maLop");
		model.addAttribute("maLop", maLop);
		List<Lop> listLop = new ArrayList<>();
		SessionFactory factory = HibernateUtil.getSessionFactory();
		Session session = factory.getCurrentSession();
		Transaction tr = session.beginTransaction();
		String hql = "from Lop L WHERE L.maLop= :maLop";
		Query query = session.createQuery(hql);
		query.setParameter("maLop", maLop);
		listLop = query.list();
		tr.commit();	
		session.close();
		model.addAttribute("listLop", listLop);
		return "admin/danhsachlop";
	}
	
	@RequestMapping(value = "/timkiemMH", method = RequestMethod.POST)
	public String timKiemMH(HttpServletRequest request, Model model) {
		String maMH = request.getParameter("maMH");
		model.addAttribute("maMH", maMH);
		List<MonHoc> listMonHoc = new ArrayList<>();
		SessionFactory factory = HibernateUtil.getSessionFactory();
		Session session = factory.getCurrentSession();
		Transaction tr = session.beginTransaction();
		String hql = "from MonHoc MH WHERE MH.maMH = :maMH";
		Query query = session.createQuery(hql);
		query.setParameter("maMH", maMH);
		listMonHoc = query.list();
		tr.commit();	
		session.close();
		model.addAttribute("listMonHoc", listMonHoc);
		return "admin/danhsachmonhoc";
	}
}
