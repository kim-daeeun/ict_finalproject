package com.ict.ictinfo.main.dto;

public class MainDto {
	
	private String bizcategory;
	private String company_name;
	private String biz_contents;
	private String phone_number;
	private int employee_cnt;
	private String addr01;
	private String addr02;
	private String company_addr;
	private String homepage;
	private String establish_date;
	
	public String getBizcategory() {
		return bizcategory;
	}
	public void setBizcategory(String bizcategory) {
		this.bizcategory = bizcategory;
	}
	public String getCompany_name() {
		return company_name;
	}
	public void setCompany_name(String company_name) {
		this.company_name = company_name;
	}
	public String getBiz_contents() {
		return biz_contents;
	}
	public void setBiz_contents(String biz_contents) {
		this.biz_contents = biz_contents;
	}
	public String getPhone_number() {
		return phone_number;
	}
	public void setPhone_number(String phone_number) {
		this.phone_number = phone_number;
	}
	public int getEmployee_cnt() {
		return employee_cnt;
	}
	public void setEmployee_cnt(int employee_cnt) {
		this.employee_cnt = employee_cnt;
	}
	public String getAddr01() {
		return addr01;
	}
	public void setAddr01(String addr01) {
		this.addr01 = addr01;
	}
	public String getAddr02() {
		return addr02;
	}
	public void setAddr02(String addr02) {
		this.addr02 = addr02;
	}
	public String getCompany_addr() {
		return company_addr;
	}
	public void setCompany_addr(String company_addr) {
		this.company_addr = company_addr;
	}
	public String getHomepage() {
		return homepage;
	}
	public void setHomepage(String homepage) {
		this.homepage = homepage;
	}
	public String getEstablish_date() {
		return establish_date;
	}
	public void setEstablish_date(String establish_date) {
		this.establish_date = establish_date;
	}
	
	@Override
	public String toString() {
		return "BizInfoDto [bizcategory=" + bizcategory + ", company_name=" + company_name + ", biz_contents="
				+ biz_contents + ", phone_number=" + phone_number + ", employee_cnt=" + employee_cnt + ", addr01="
				+ addr01 + ", addr02=" + addr02 + ", company_addr=" + company_addr + ", homepage=" + homepage
				+ ", establish_date=" + establish_date + "]";
	}
	
}