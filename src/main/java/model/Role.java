package model;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "Role")

public class Role {
	@Id
	@Column(name = "MaRole")
	private int maRole;
	
	@Column(name = "TenRole")
	private String tenRole;
	
	@OneToMany(mappedBy = "role", fetch = FetchType.LAZY)
	private List<TaiKhoan> taiKhoan;
	
	public Role() {
	}
	public Role(int maRole, String tenRole) {
		this.maRole = maRole;
		this.tenRole = tenRole;
	}
	public int getMaRole() {
		return maRole;
	}
	public void setMaRole(int maRole) {
		this.maRole = maRole;
	}
	public String getTenRole() {
		return tenRole;
	}
	public void setTenRole(String tenRole) {
		this.tenRole = tenRole;
	}
	
	public Role getRoleById(int id, List<Role> list) {
		for (Role role : list) {
			if(role.maRole == id) return role;
		}
		return null;
	}
}
