package com.ict.ictinfo.noticeboard.dto;

public class NbFileDto {
	private int fileNum;
	private String originFname;
	private String storedFname;
	private long fileLength;
	private String articleNum;
	
	
	
	
	public int getFileNum() {
		return fileNum;
	}
	public void setFileNum(int fileNum) {
		this.fileNum = fileNum;
	}
	public String getOriginFname() {
		return originFname;
	}
	public void setOriginFname(String originFname) {
		this.originFname = originFname;
	}
	public String getStoredFname() {
		return storedFname;
	}
	public void setStoredFname(String storedFname) {
		this.storedFname = storedFname;
	}
	public long getFileLength() {
		return fileLength;
	}
	public void setFileLength(long fileLength) {
		this.fileLength = fileLength;
	}
	public String getArticleNum() {
		return articleNum;
	}
	public void setArticleNum(String articleNum) {
		this.articleNum = articleNum;
	}
	@Override
	public String toString() {
		return "FileDto [fileNum=" + fileNum + ", originFname=" + originFname + ", storedFname=" + storedFname
				+ ", fileLength=" + fileLength + ", articleNum=" + articleNum + "]";
	}
	

	
	

	
	
	
}
