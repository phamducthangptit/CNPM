package model;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class MonHoc {
	@Id
	@Column(name = "MaMH")
	private String maMH;
	
	@Column(name = "TenMH")
	private String tenMH;
	
	@Column(name = "STC")
	private int STC;
	
	@Column(name = "STCHP")
	private int STCHP;
	
	@Column(name = "PhanTramDiemCC")
	private int phanTramDiemCC;
	
	@Column(name = "PhanTramDiemKT")
	private int phanTramDiemKT;
	
	@Column(name = "PhanTramDiemTH")
	private int phanTramDiemTH;
	
	@Column(name = "PhanTramDiemSe")
	private int phanTramDiemSe;
	
	@Column(name = "PhanTramDiemThi")
	private int phanTramDiemThi;
	

	@OneToMany(mappedBy = "monHoc")
	private List<CT_LopTinChi> dsLopTinChi;
	
	
	public MonHoc(String maMH, String tenMH, int sTC, int sTCHP, int phanTramDiemCC, int phanTramDiemKT,
			int phanTramDiemTH, int phanTramDiemSe, int phanTramDiemThi) {
		this.maMH = maMH;
		this.tenMH = tenMH;
		STC = sTC;
		STCHP = sTCHP;
		this.phanTramDiemCC = phanTramDiemCC;
		this.phanTramDiemKT = phanTramDiemKT;
		this.phanTramDiemTH = phanTramDiemTH;
		this.phanTramDiemSe = phanTramDiemSe;
		this.phanTramDiemThi = phanTramDiemThi;
	}

	public MonHoc(String maMH, String tenMH, int sTC, int sTCHP, int phanTramDiemCC, int phanTramDiemKT,
			int phanTramDiemTH, int phanTramDiemSe, int phanTramDiemThi,
			List<CT_LopTinChi> dsLopTinChi) {
		this.maMH = maMH;
		this.tenMH = tenMH;
		STC = sTC;
		STCHP = sTCHP;
		this.phanTramDiemCC = phanTramDiemCC;
		this.phanTramDiemKT = phanTramDiemKT;
		this.phanTramDiemTH = phanTramDiemTH;
		this.phanTramDiemSe = phanTramDiemSe;
		this.phanTramDiemThi = phanTramDiemThi;
		this.dsLopTinChi = dsLopTinChi;
	}

	public MonHoc() {
	}

	public String getMaMH() {
		return maMH;
	}

	public void setMaMH(String maMH) {
		this.maMH = maMH;
	}

	public String getTenMH() {
		return tenMH;
	}

	public void setTenMH(String tenMH) {
		this.tenMH = tenMH;
	}

	public int getSTC() {
		return STC;
	}

	public void setSTC(int sTC) {
		STC = sTC;
	}

	public int getSTCHP() {
		return STCHP;
	}

	public void setSTCHP(int sTCHP) {
		STCHP = sTCHP;
	}

	public int getphanTramDiemCC() {
		return phanTramDiemCC;
	}

	public void setphanTramDiemCC(int phanTramDiemCC) {
		this.phanTramDiemCC = phanTramDiemCC;
	}

	public int getphanTramDiemKT() {
		return phanTramDiemKT;
	}

	public void setphanTramDiemKT(int phanTramDiemKT) {
		this.phanTramDiemKT = phanTramDiemKT;
	}

	public int getphanTramDiemTH() {
		return phanTramDiemTH;
	}

	public void setphanTramDiemTH(int phanTramDiemTH) {
		this.phanTramDiemTH = phanTramDiemTH;
	}

	public int getphanTramDiemSe() {
		return phanTramDiemSe;
	}

	public void setphanTramDiemSe(int phanTramDiemSe) {
		this.phanTramDiemSe = phanTramDiemSe;
	}

	public int getphanTramDiemThi() {
		return phanTramDiemThi;
	}

	public void setphanTramDiemThi(int phanTramDiemThi) {
		this.phanTramDiemThi = phanTramDiemThi;
	}


	public List<CT_LopTinChi> getDsLopTinChi() {
		return dsLopTinChi;
	}

	public void setDsLopTinChi(List<CT_LopTinChi> dsLopTinChi) {
		this.dsLopTinChi = dsLopTinChi;
	}
	
	public MonHoc getMonHocById(String id, List<MonHoc> list) {
		for (MonHoc monHoc : list) {
			if(monHoc.getMaMH().equals(id)) return monHoc;
		}
		return null;
	}
}
