package model;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;

@Entity
public class TaiKhoan {
	@Id
	@Column(name = "TenDN")
	private String tenDN;
	
	@Column(name = "Password")
	private String password;
	
	@Column(name = "TrangThai")
	private int trangThai;
	
	
	@OneToOne
	@JoinColumn(name = "TenDN")
	private GiangVien giangVien;

	@OneToOne
	@JoinColumn(name = "TenDN")
	private NguoiQT nguoiQT;
	
	@OneToOne()
	@JoinColumn(name = "TenDN")
	private SinhVien sinhVien;
	
	@ManyToOne
	@JoinColumn(name = "MaRole")
	private Role role;
	
	public TaiKhoan() {
	}

	public TaiKhoan(String tenDN, String password, int trangThai, Role role) {
		this.tenDN = tenDN;
		this.password = password;
		this.trangThai = trangThai;
		this.role = role;
	}

	public String getTenDN() {
		return tenDN;
	}

	public void setTenDN(String tenDN) {
		this.tenDN = tenDN;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public int getTrangThai() {
		return trangThai;
	}

	public void setTrangThai(int trangThai) {
		this.trangThai = trangThai;
	}

	public Role getRole() {
		return role;
	}

	public void setRole(Role role) {
		this.role = role;
	}
	
	public TaiKhoan getTKById(String id, List<TaiKhoan> list) {
		for (TaiKhoan taiKhoan : list) {
			if(taiKhoan.getTenDN().equals(id)) return taiKhoan;
		}
		return null;
	}

	public GiangVien getGiangVien() {
		return giangVien;
	}

	public void setGiangVien(GiangVien giangVien) {
		this.giangVien = giangVien;
	}

	public NguoiQT getNguoiQT() {
		return nguoiQT;
	}

	public void setNguoiQT(NguoiQT nguoiQT) {
		this.nguoiQT = nguoiQT;
	}

	public SinhVien getSinhVien() {
		return sinhVien;
	}

	public void setSinhVien(SinhVien sinhVien) {
		this.sinhVien = sinhVien;
	}
	
}
