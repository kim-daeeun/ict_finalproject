package com.ict.ictinfo.main.dto;

public class GetMainDto {
	private String bizcategory;
	private String addr01;
	private String addr02;
	
	public String getBizcategory() {
		return bizcategory;
	}
	public void setBizcategory(String bizcategory) {
		this.bizcategory = bizcategory;
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
	
	@Override
	public String toString() {
		return "GetBizDto [bizcategory=" + bizcategory + ", addr01=" + addr01 + ", addr02=" + addr02 + "]";
	}

}
