package model;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

@Entity
public class Lop {
	@Id
	@Column(name = "MaLop")
	private String maLop;
	
	@Column(name = "TenLop")
	private String tenLop;
	
	@ManyToOne
	@JoinColumn(name = "MaKH")
	private KhoaHoc khoaHoc;
	
	@OneToMany(mappedBy = "lop", fetch = FetchType.LAZY)
	private List<SinhVien> sinhVien;
	
	@OneToMany(mappedBy = "lop", fetch = FetchType.LAZY)
	private List<CT_LopTinChi> ctMonHoc;
	
	
	public Lop() {
	}

	public Lop(String maLop, String tenLop, KhoaHoc khoaHoc) {
		this.maLop = maLop;
		this.tenLop = tenLop;
		this.khoaHoc = khoaHoc;
	}

	
	public Lop(String maLop, String tenLop, KhoaHoc khoaHoc, NguoiQT nguoiQT, List<SinhVien> sinhVien) {
		this.maLop = maLop;
		this.tenLop = tenLop;
		this.khoaHoc = khoaHoc;
		this.sinhVien = sinhVien;
	}


	public String getMaLop() {
		return maLop;
	}

	public void setMaLop(String maLop) {
		this.maLop = maLop;
	}

	public String getTenLop() {
		return tenLop;
	}

	public void setTenLop(String tenLop) {
		this.tenLop = tenLop;
	}

	public KhoaHoc getKhoaHoc() {
		return khoaHoc;
	}

	public void setKhoaHoc(KhoaHoc khoaHoc) {
		this.khoaHoc = khoaHoc;
	}

	public List<SinhVien> getSinhVien() {
		return sinhVien;
	}

	public void setSinhVien(List<SinhVien> sinhVien) {
		this.sinhVien = sinhVien;
	}

	public List<CT_LopTinChi> getCtMonHoc() {
		return ctMonHoc;
	}

	public void setCtMonHoc(List<CT_LopTinChi> ctMonHoc) {
		this.ctMonHoc = ctMonHoc;
	}
	
	public Lop getLopById(String id, List<Lop> listLop) {
		for (Lop lop : listLop) {
			if(id.equals(lop.maLop)) return lop;
		}
		return null;
	}
}
