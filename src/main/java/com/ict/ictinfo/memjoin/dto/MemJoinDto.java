package com.ict.ictinfo.memjoin.dto;

public class MemJoinDto {
	private String name;
	private String id;
	private String password;
	private String email;
	private String phoneNumber;
	private String address1;
	private String address2;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	public String getAddress1() {
		return address1;
	}
	public void setAddress1(String address1) {
		this.address1 = address1;
	}
	public String getAddress2() {
		return address2;
	}
	public void setAddress2(String address2) {
		this.address2 = address2;
	}
	@Override
	public String toString() {
		return "MemJoinDto [name=" + name + ", id=" + id + ", password=" + password + ", email=" + email
				+ ", phoneNumber=" + phoneNumber + ", address1=" + address1 + ", address2=" + address2 + "]";
	}
	
}
