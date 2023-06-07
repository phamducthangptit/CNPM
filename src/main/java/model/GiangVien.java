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
public class GiangVien {
	@Id
	@Column(name = "MaGV")
	private String maGV;
	
	@Column(name = "HoTen")
	private String hoTen;
	
	@Column(name = "GioiTinh")
	private String gioiTinh;
	
	@Column(name = "NgaySinh")
	private Date ngaySinh;
	
	@Column(name = "HocHam")
	private String hocHam;
	
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
	
	@OneToOne(mappedBy = "giangVien")
	private TaiKhoan taiKhoan;
	
	@OneToMany(mappedBy = "giangVien", fetch = FetchType.LAZY)
	private List<CT_LopTinChi> dsLopTinChi;
	
	
	public GiangVien() {
	}
	

	public GiangVien(String maGV, String hoTen, String gioiTinh, Date ngaySinh, String hocHam, String email1,
			String email2, String sDT1, String sDT2, String queQuan) {
		this.maGV = maGV;
		this.hoTen = hoTen;
		this.gioiTinh = gioiTinh;
		this.ngaySinh = ngaySinh;
		this.hocHam = hocHam;
		Email1 = email1;
		Email2 = email2;
		SDT1 = sDT1;
		SDT2 = sDT2;
		this.queQuan = queQuan;
	}


	public String getMaGV() {
		return maGV;
	}
	
	public TaiKhoan getTaiKhoan() {
		return taiKhoan;
	}
	public void setTaiKhoan(TaiKhoan taiKhoan) {
		this.taiKhoan = taiKhoan;
	}
	
	public List<CT_LopTinChi> getDsLopTinChi() {
		return dsLopTinChi;
	}

	public void setDsLopTinChi(List<CT_LopTinChi> dsLopTinChi) {
		this.dsLopTinChi = dsLopTinChi;
	}

	public void setMaGV(String maGV) {
		this.maGV = maGV;
	}
	public String getHoTen() {
		return hoTen;
	}
	
	public void setHoTen(String hoTen) {
		this.hoTen = hoTen;
	}
	public String getHocHam() {
		return hocHam;
	}
	
	public void setHocHam(String hocHam) {
		this.hocHam = hocHam;
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
	
	
	public String getQueQuan() {
		return queQuan;
	}


	public void setQueQuan(String queQuan) {
		this.queQuan = queQuan;
	}


	public GiangVien getGVById(String id, List<GiangVien> list) {
		for (GiangVien giangVien : list) {
			if(giangVien.getMaGV().equals(id)) return giangVien;
		}
		return null;
	}
}
