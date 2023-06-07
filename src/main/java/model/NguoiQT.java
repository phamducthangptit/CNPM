package model;

import java.sql.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

@Entity
public class NguoiQT {
	@Id
	@Column(name = "MaNguoiQT")
	private String maNguoiQT;
	
	@Column(name = "HoTen")
	private String hoTen;
	
	@Column(name = "NgaySinh")
	private Date ngaySinh;
	
	@Column(name = "GioiTinh")
	private String gioiTinh;
	
	@Column(name = "Email1")
	private String Email1;
	
	@Column(name = "Email2")
	private String Email2;
	
	@Column(name = "SDT1")
	private String SDT1;
	
	@Column(name = "SDT2")
	private String SDT2;
	
	@Column(name = "QueQuan")
	private String queQuan;
	
	@OneToOne(mappedBy = "nguoiQT")
	private TaiKhoan taiKhoan;
	
	
	@OneToMany(mappedBy = "nguoiQT", fetch = FetchType.LAZY)
	private List<SV_HocLopTinChi> dsSVHocLopTC;
	

	public NguoiQT() {
	}
	

	public NguoiQT(String maNguoiQT, String hoTen, Date ngaySinh, String gioiTinh, String email1, String email2,
			String sDT1, String sDT2, String queQuan) {
		this.maNguoiQT = maNguoiQT;
		this.hoTen = hoTen;
		this.ngaySinh = ngaySinh;
		this.gioiTinh = gioiTinh;
		Email1 = email1;
		Email2 = email2;
		SDT1 = sDT1;
		SDT2 = sDT2;
		this.queQuan = queQuan;
	}

	
	public NguoiQT(String maNguoiQT, String hoTen, Date ngaySinh, String gioiTinh, String email1, String email2,
			String sDT1, String sDT2, String queQuan, List<SV_HocLopTinChi> dsSVHocLopTC) {
		this.maNguoiQT = maNguoiQT;
		this.hoTen = hoTen;
		this.ngaySinh = ngaySinh;
		this.gioiTinh = gioiTinh;
		Email1 = email1;
		Email2 = email2;
		SDT1 = sDT1;
		SDT2 = sDT2;
		this.queQuan = queQuan;
		this.dsSVHocLopTC = dsSVHocLopTC;
	}


	public String getMaNguoiQT() {
		return maNguoiQT;
	}

	public void setMaNguoiQT(String maNguoiQT) {
		this.maNguoiQT = maNguoiQT;
	}

	public String getHoTen() {
		return hoTen;
	}

	public void setHoTen(String hoTen) {
		this.hoTen = hoTen;
	}

	public Date getNgaySinh() {
		return ngaySinh;
	}

	public void setNgaySinh(Date ngaySinh) {
		this.ngaySinh = ngaySinh;
	}

	public String getEmail1() {
		return Email1;
	}

	public void setEmail1(String email1) {
		Email1 = email1;
	}

	public String getEmail2() {
		return Email2;
	}

	public void setEmail2(String email2) {
		Email2 = email2;
	}

	public String getSDT1() {
		return SDT1;
	}

	public void setSDT1(String sDT1) {
		SDT1 = sDT1;
	}

	public String getSDT2() {
		return SDT2;
	}

	public void setSDT2(String sDT2) {
		SDT2 = sDT2;
	}

	
	public String getQueQuan() {
		return queQuan;
	}


	public void setQueQuan(String queQuan) {
		this.queQuan = queQuan;
	}


	public List<SV_HocLopTinChi> getDsSVHocLopTC() {
		return dsSVHocLopTC;
	}


	public void setDsSVHocLopTC(List<SV_HocLopTinChi> dsSVHocLopTC) {
		this.dsSVHocLopTC = dsSVHocLopTC;
	}


	public String getGioiTinh() {
		return gioiTinh;
	}

	public void setGioiTinh(String gioiTinh) {
		this.gioiTinh = gioiTinh;
	}

	public NguoiQT getNguoiQTById(String id, List<NguoiQT> list) {
		for (NguoiQT nguoiQT : list) {
			if(nguoiQT.getMaNguoiQT().equals(id)) return nguoiQT;
		}
		return null;
	}
}
