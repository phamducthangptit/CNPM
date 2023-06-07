package controller;

import java.security.NoSuchAlgorithmException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import Util.HibernateUtil;
import encrypt.PasswordEncoder;
import model.TaiKhoan;
@Transactional
@Controller
public class UserController {
	SessionFactory factory = HibernateUtil.getSessionFactory();
	@RequestMapping("/index")
	public String index() {
		return "user/index";
	}

	@RequestMapping(value = "/index", method = RequestMethod.POST)
	public String login(HttpServletRequest request, ModelMap model) throws NoSuchAlgorithmException {
		String tenDN = request.getParameter("TenDN");
		String password = request.getParameter("Password");
		TaiKhoan taiKhoan = queryLogin(tenDN, PasswordEncoder.encodePassword(password));
		if (taiKhoan != null) {
			if (taiKhoan.getTrangThai() == 1) {
				HttpSession session = request.getSession();
				session.setAttribute("taiKhoan", taiKhoan);
				if (taiKhoan.getRole().getMaRole() == 1) {
					return "admin/index_admin";
				} else if (taiKhoan.getRole().getMaRole() == 2) {
					return "teacher/index_teacher";
				} else if (taiKhoan.getRole().getMaRole() == 3) {
					return "student/index_student";
				}
			} else {
				model.addAttribute("message", "Tài khoản không được phép đăng nhập");
				return "user/index";
			}
		}
		model.addAttribute("message", "Tên đăng nhập hoặc mật khẩu không đúng");
		return "user/index";
	}

	@RequestMapping(value = "/thaydoimk", method = RequestMethod.POST)
	public String changePass(HttpServletRequest request, HttpSession session) throws NoSuchAlgorithmException {
		Object ob = session.getAttribute("taiKhoan");
		TaiKhoan tk = new TaiKhoan();
		if (ob != null) {
			tk = (TaiKhoan) ob;
		}
		if (tk != null) {
			String currentPass = PasswordEncoder.encodePassword(request.getParameter("pass")) ;
			String newPass = PasswordEncoder.encodePassword(request.getParameter("newpass")) ;
			if(tk.getPassword().equals(currentPass)) {
				tk.setPassword(newPass);
				
				Session session1 = factory.getCurrentSession();
				Transaction tr = session1.beginTransaction();
				session1.merge(tk);
				tr.commit();
				session1.close();
				request.setAttribute("mgs_updatepass", "Thay đổi mật khẩu thành công!");
			} else {
				request.setAttribute("mgs_pass", "Mật khẩu hiện tại không đúng!");
				return "user/changepass";
			}
		}
		request.setAttribute("mgs_pass", "");
		return "user/changepass";
	}
		
	@RequestMapping(value = "/changepass")
	public String changePass() {
		return "user/changepass";
	}
	@RequestMapping(value = "/logout", method = RequestMethod.POST)
	public String logOut(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate(); // ngat phien session
		return "user/index";
	}
	@RequestMapping("/quenmatkhau")
	public String quenMK() {
		return "user/quenmk";
	}
	
	@RequestMapping(value = "/resetpass", method = RequestMethod.POST)
	public String resetPass(HttpServletRequest request) throws NoSuchAlgorithmException {
		String tenDN = request.getParameter("tenDN");
		String SDT = request.getParameter("SDT");
		Session session = factory.getCurrentSession();
		Transaction tr = session.beginTransaction();
		String hql = "from TaiKhoan TK where TK.tenDN = :tenDN";
		Query query = session.createQuery(hql);
		query.setParameter("tenDN", tenDN);
		List<TaiKhoan> listTK = query.getResultList();
		if(listTK.size() != 0) {
			TaiKhoan taiKhoan = listTK.get(0);
			if(taiKhoan.getSinhVien() != null) {
				if(taiKhoan.getSinhVien().getSDT1().equals(SDT)) {
					taiKhoan.setPassword(PasswordEncoder.encodePassword(taiKhoan.getTenDN()));
					session.merge(taiKhoan);
					tr.commit();
					session.close();
					return "user/index";
				} else request.setAttribute("mgs_sdtResetPass", "Số điện thoại không đúng");
			}
			if(taiKhoan.getNguoiQT() != null) {
				if(taiKhoan.getNguoiQT().getSDT1().equals(SDT)) {
					taiKhoan.setPassword(PasswordEncoder.encodePassword(taiKhoan.getTenDN()));
					session.merge(taiKhoan);
					tr.commit();
					session.close();
					return "user/index";
				} else request.setAttribute("mgs_sdtResetPass", "Số điện thoại không đúng");
			}
			if(taiKhoan.getGiangVien() != null) {
				if(taiKhoan.getGiangVien().getSDT1().equals(SDT)) {
					taiKhoan.setPassword(PasswordEncoder.encodePassword(taiKhoan.getTenDN()));
					session.merge(taiKhoan);
					tr.commit();
					session.close();
					return "user/index";
				} else request.setAttribute("mgs_sdtResetPass", "Số điện thoại không đúng");
			}
		} else {
			request.setAttribute("mgs_tenResetPass", "Tên đăng nhập không đúng");
		}
		tr.commit();
		session.close();
		return "user/quenmk";
	}
	
	
	public TaiKhoan queryLogin(String tenDN, String password) {
		Session session = factory.getCurrentSession();
		Transaction tr = session.beginTransaction();
		String hql = "FROM TaiKhoan WHERE TenDN = :tenDN AND Password = :password";
		Query query = session.createQuery(hql);
		query.setParameter("tenDN", tenDN);
		query.setParameter("password", password);
		List<TaiKhoan> tk = query.list();
		tr.commit();
		session.close();
		if (tk.size() == 0) {
			return null;
		}
		return tk.get(0);
	}
	
	
}
