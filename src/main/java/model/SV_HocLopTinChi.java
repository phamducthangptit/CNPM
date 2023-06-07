package model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class SV_HocLopTinChi {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int IDCT;
	
	@ManyToOne
	@JoinColumn(name = "ID")
	private CT_LopTinChi lopTinChi;
	
	@ManyToOne
	@JoinColumn(name = "MaSV")
	private SinhVien sinhVien;
	
	@Column(name = "DiemCC")
	private Double diemCC;
	
	@Column(name = "DiemKT")
	private Double diemKT;
	
	@Column(name = "DiemTH")
	private Double diemTH;
	
	@Column(name = "DiemSe")
	private Double diemSe;
	
	@Column(name = "DiemThi")
	private Double diemThi;
	
	@Column(name = "TongKet")
	private Double tongKet;
	
	@ManyToOne
	@JoinColumn(name = "MaNguoiQT")
	private NguoiQT nguoiQT;

	public SV_HocLopTinChi() {
	}

	public SV_HocLopTinChi(CT_LopTinChi lopTinChi, SinhVien sinhVien, Double diemCC, Double diemKT,
			Double diemTH, Double diemSe, Double diemThi, Double tongKet, NguoiQT nguoiQT) {
		this.lopTinChi = lopTinChi;
		this.sinhVien = sinhVien;
		this.diemCC = diemCC;
		this.diemKT = diemKT;
		this.diemTH = diemTH;
		this.diemSe = diemSe;
		this.diemThi = diemThi;
		this.tongKet = tongKet;
		this.nguoiQT = nguoiQT;
	}

	public int getIDCT() {
		return IDCT;
	}

	public void setIDCT(int iDCT) {
		IDCT = iDCT;
	}

	public CT_LopTinChi getLopTinChi() {
		return lopTinChi;
	}

	public void setLopTinChi(CT_LopTinChi lopTinChi) {
		this.lopTinChi = lopTinChi;
	}

	public SinhVien getSinhVien() {
		return sinhVien;
	}

	public void setSinhVien(SinhVien sinhVien) {
		this.sinhVien = sinhVien;
	}

	public Double getDiemCC() {
		return diemCC;
	}

	public void setDiemCC(Double diemCC) {
		this.diemCC = diemCC;
	}

	public Double getDiemKT() {
		return diemKT;
	}

	public void setDiemKT(Double diemKT) {
		this.diemKT = diemKT;
	}

	public Double getDiemTH() {
		return diemTH;
	}

	public void setDiemTH(Double diemTH) {
		this.diemTH = diemTH;
	}

	public Double getDiemSe() {
		return diemSe;
	}

	public void setDiemSe(Double diemSe) {
		this.diemSe = diemSe;
	}

	public Double getDiemThi() {
		return diemThi;
	}

	public void setDiemThi(Double diemThi) {
		this.diemThi = diemThi;
	}

	public Double getTongKet() {
		return tongKet;
	}

	public void setTongKet(Double tongKet) {
		this.tongKet = tongKet;
	}

	public NguoiQT getNguoiQT() {
		return nguoiQT;
	}

	public void setNguoiQT(NguoiQT nguoiQT) {
		this.nguoiQT = nguoiQT;
	}
	
	
}
