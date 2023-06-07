package model;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

@Entity
public class CT_LopTinChi {
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ID")
    private int id;
 
    @ManyToOne()
    @JoinColumn(name = "MaHK")
    private HocKi hocKi;
 
    @ManyToOne()
    @JoinColumn(name = "MaLop")
    private Lop lop;
 
    @ManyToOne()
    @JoinColumn(name = "MaMH")
    private MonHoc monHoc;
 
    @Column(name = "MaNhom")
    private int maNhom;
	
	@Column(name = "NgayBDHoc")
	private Date ngayBD;
	
	@Column(name = "NgayKTHoc")
	private Date ngayKT;
	
	@Column(name = "SLToiDa")
	private int slToiDa;
	
	@Column(name = "SLThucTeDK")
	private int slThucTeDK;
	
	@Column(name = "TrangThai")
	private int trangThai;
	
	@ManyToOne
	@JoinColumn(name = "MaGV")
	private GiangVien giangVien;
	
	@OneToMany(mappedBy = "lopTinChi")
    private List<SV_HocLopTinChi> dsLopTinChiSinhVien = new ArrayList<>();

	public CT_LopTinChi() {
	}
	
	public CT_LopTinChi(int maNhom, Lop lop, MonHoc monHoc, HocKi hocKi, Date ngayBD, Date ngayKT, int slToiDa,
			int slThucTeDK, int trangThai, GiangVien giangVien) {
		this.hocKi = hocKi;
		this.lop = lop;
		this.monHoc = monHoc;
		this.maNhom = maNhom;
		this.ngayBD = ngayBD;
		this.ngayKT = ngayKT;
		this.slToiDa = slToiDa;
		this.slThucTeDK = slThucTeDK;
		this.giangVien = giangVien;
		this.trangThai = trangThai;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getMaNhom() {
		return maNhom;
	}

	public void setMaNhom(int maNhom) {
		this.maNhom = maNhom;
	}

	public HocKi getHocKi() {
		return hocKi;
	}

	public void setHocKi(HocKi hocKi) {
		this.hocKi = hocKi;
	}

	public Lop getLop() {
		return lop;
	}

	public void setLop(Lop lop) {
		this.lop = lop;
	}

	public MonHoc getMonHoc() {
		return monHoc;
	}

	public void setMonHoc(MonHoc monHoc) {
		this.monHoc = monHoc;
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

	public int getSlToiDa() {
		return slToiDa;
	}

	public void setSlToiDa(int slToiDa) {
		this.slToiDa = slToiDa;
	}

	public int getSlThucTeDK() {
		return slThucTeDK;
	}

	public void setSlThucTeDK(int slThucTeDK) {
		this.slThucTeDK = slThucTeDK;
	}

	public GiangVien getGiangVien() {
		return giangVien;
	}

	public void setGiangVien(GiangVien giangVien) {
		this.giangVien = giangVien;
	}

	public int getTrangThai() {
		return trangThai;
	}

	public void setTrangThai(int trangThai) {
		this.trangThai = trangThai;
	}

	public List<SV_HocLopTinChi> getDsLopTinChiSinhVien() {
		return dsLopTinChiSinhVien;
	}

	public void setDsLopTinChiSinhVien(List<SV_HocLopTinChi> dsLopTinChiSinhVien) {
		this.dsLopTinChiSinhVien = dsLopTinChiSinhVien;
	}
	
}