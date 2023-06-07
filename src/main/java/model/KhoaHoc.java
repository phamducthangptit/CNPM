package model;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class KhoaHoc {
	@Id
	@Column(name = "MaKH")
	private String maKH;
	
	@Column(name = "NamBD")
	private int namBD;
	
	@Column(name = "NamKT")
	private int namKT;
	
	@OneToMany(mappedBy = "khoaHoc", fetch = FetchType.LAZY)
	private List<Lop> lop;
	
	public KhoaHoc() {
	}

	public KhoaHoc(String maKH, int namBD, int namKT) {
		this.maKH = maKH;
		this.namBD = namBD;
		this.namKT = namKT;
	}

	public String getMaKH() {
		return maKH;
	}

	public void setMaKH(String maKH) {
		this.maKH = maKH;
	}

	public int getNamBD() {
		return namBD;
	}

	public void setNamBD(int namBD) {
		this.namBD = namBD;
	}

	public int getNamKT() {
		return namKT;
	}

	public void setNamKT(int namKT) {
		this.namKT = namKT;
	}

	public KhoaHoc getKhoaHocById(String id, List<KhoaHoc> khoaHoc) {
		for (KhoaHoc kh : khoaHoc) {
			if(id.equals(kh.maKH)) return kh;
		}
		return null;
	}
}
