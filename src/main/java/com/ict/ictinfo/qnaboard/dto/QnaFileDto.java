package com.ict.ictinfo.qnaboard.dto;

public class QnaFileDto {
	
	private int fileNum;
	private String storedFname;
	private int articleNum;
	
	public int getFileNum() {
		return fileNum;
	}
	public void setFileNum(int fileNum) {
		this.fileNum = fileNum;
	}
	public String getStoredFname() {
		return storedFname;
	}
	public void setStoredFname(String storedFname) {
		this.storedFname = storedFname;
	}
	public int getArticleNum() {
		return articleNum;
	}
	public void setArticleNum(int articleNum) {
		this.articleNum = articleNum;
	}
	
	@Override
	public String toString() {
		return "QnaFileDto [fileNum=" + fileNum + ", storedFname=" + storedFname + ", articleNum=" + articleNum + "]";
	}
	
}
