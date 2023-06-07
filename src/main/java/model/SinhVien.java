package model;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

@Entity
public class SinhVien {
	@Id
	@Column(name = "MaSV")
	private String maSV;

	@Column(name = "HoTen")
	private String hoTen;

	@Column(name = "GioiTinh")
	private String gioiTinh;

	@Column(name = "NgaySinh")
	private Date ngaySinh;

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
	
	@OneToOne(mappedBy = "sinhVien")
	private TaiKhoan taiKhoan;

	@ManyToOne
	@JoinColumn(name = "MaLop")
	private Lop lop;

	@OneToMany(mappedBy = "sinhVien")
	private List<SV_HocLopTinChi> dsSVHocLopTC = new ArrayList<>();


	public SinhVien() {
	}
	

	public SinhVien(String maSV, String hoTen, String gioiTinh, Date ngaySinh, String email1, String email2,
			String sDT1, String sDT2, String queQuan, Lop lop) {
		this.maSV = maSV;
		this.hoTen = hoTen;
		this.gioiTinh = gioiTinh;
		this.ngaySinh = ngaySinh;
		Email1 = email1;
		Email2 = email2;
		SDT1 = sDT1;
		SDT2 = sDT2;
		this.queQuan = queQuan;
		this.lop = lop;
	}


	public String getMaSV() {
		return maSV;
	}

	public void setMaSV(String maSV) {
		this.maSV = maSV;
	}

	public String getHoTen() {
		return hoTen;
	}

	public void setHoTen(String hoTen) {
		this.hoTen = hoTen;
	}

	public String getGioiTinh() {
		return gioiTinh;
	}

	public void setGioiTinh(String gioiTinh) {
		this.gioiTinh = gioiTinh;
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

	public TaiKhoan getTaiKhoan() {
		return taiKhoan;
	}

	public void setTaiKhoan(TaiKhoan taiKhoan) {
		this.taiKhoan = taiKhoan;
	}

	public Lop getLop() {
		return lop;
	}

	public void setLop(Lop lop) {
		this.lop = lop;
	}


	public List<SV_HocLopTinChi> getDsSVHocLopTC() {
		return dsSVHocLopTC;
	}


	public void setDsSVHocLopTC(List<SV_HocLopTinChi> dsSVHocLopTC) {
		this.dsSVHocLopTC = dsSVHocLopTC;
	}

	public SinhVien getSVById(String id, List<SinhVien> list) {
		for (SinhVien sinhVien : list) {
			if(sinhVien.getMaSV().equals(id)) return sinhVien;
		}
		return null;
	}


	@Override
	public String toString() {
		return "SinhVien [maSV=" + maSV + ", hoTen=" + hoTen + ", gioiTinh=" + gioiTinh + ", ngaySinh=" + ngaySinh
				+ ", Email1=" + Email1 + ", SDT1=" + SDT1 + ", lop=" + lop + "]";
	}
	
}
