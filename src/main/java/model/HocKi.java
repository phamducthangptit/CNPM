package model;

import java.sql.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class HocKi {
	@Id
	@Column(name = "MaHK")
	private String maHK;
	
	@Column(name = "NgayBD")
	private Date ngayBD;
	
	@Column(name = "NgayKT")
	private Date ngayKT;
		
	@OneToMany(mappedBy = "hocKi", fetch = FetchType.LAZY)
	private List<CT_LopTinChi> dsLopTinChi;
	
	public HocKi() {
	}

	public HocKi(String maHK, Date ngayBD, Date ngayKT) {
		this.maHK = maHK;
		this.ngayBD = ngayBD;
		this.ngayKT = ngayKT;
	}
	
	public HocKi(String maHK, Date ngayBD, Date ngayKT, NguoiQT nguoiQT,
			List<CT_LopTinChi> dsLopTinChi) {
		this.maHK = maHK;
		this.ngayBD = ngayBD;
		this.ngayKT = ngayKT;
		this.dsLopTinChi = dsLopTinChi;
	}

	public String getMaHK() {
		return maHK;
	}

	public void setMaHK(String maHK) {
		this.maHK = maHK;
	}

	public Date getNgayBD() {
		return ngayBD;
	}

	public void setNgayBD(Date ngayBD) {
		this.ngayBD = ngayBD;
	}

	public Date getNgayKT() {
		return ngayKT;
	}

	public void setNgayKT(Date ngayKT) {
		this.ngayKT = ngayKT;
	}

	public List<CT_LopTinChi> getDsLopTinChi() {
		return dsLopTinChi;
	}

	public void setDsLopTinChi(List<CT_LopTinChi> dsLopTinChi) {
		this.dsLopTinChi = dsLopTinChi;
	}
	public HocKi getHocKiById(String id, List<HocKi> list) {
		for (HocKi hocKi : list) {
			if(hocKi.getMaHK().equals(id)) return hocKi;
		}
		return null;
	}
}
