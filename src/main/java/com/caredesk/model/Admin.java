package com.caredesk.model;

public class Admin {
	private int adminId;
    private String fullName;
    private String email;
    private String password;
    private String role;
    
	public int getAdminId() {
		return adminId;
	}
	public String getFullName() {
		return fullName;
	}
	public String getEmail() {
		return email;
	}
	public String getPassword() {
		return password;
	}
	public String getRole() {
		return role;
	}
	public void setAdminId(int adminId) {
		this.adminId = adminId;
	}
	public void setFullName(String fullName) {
		this.fullName = fullName;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public void setRole(String role) {
		this.role = role;
	}
}