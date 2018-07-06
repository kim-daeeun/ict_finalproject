package com.ict.ictinfo.faqboard.faqdto;

import java.util.List;

public class FAQDto {
	private int articleNum;
	private String id;
	private String title;
	private String content;
	private int depth;
	private int hit;
	private int groupId;
	private String writeDate;
	private byte fileStatus;
	private int CommentCount;
	private List<String> fileNames;
	public int getArticleNum() {
		return articleNum;
	}
	public void setArticleNum(int articleNum) {
		this.articleNum = articleNum;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getDepth() {
		return depth;
	}
	public void setDepth(int depth) {
		this.depth = depth;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public int getGroupId() {
		return groupId;
	}
	public void setGroupId(int groupId) {
		this.groupId = groupId;
	}
	public String getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(String writeDate) {
		this.writeDate = writeDate;
	}
	public byte getFileStatus() {
		return fileStatus;
	}
	public void setFileStatus(byte fileStatus) {
		this.fileStatus = fileStatus;
	}
	public int getCommentCount() {
		return CommentCount;
	}
	public void setCommentCount(int commentCount) {
		CommentCount = commentCount;
	}
	public List<String> getFileNames() {
		return fileNames;
	}
	public void setFileNames(List<String> fileNames) {
		this.fileNames = fileNames;
	}
	
	@Override
	public String toString() {
		return "FAQDto [articleNum=" + articleNum + ", id=" + id + ", title=" + title + ", content=" + content
				+ ", depth=" + depth + ", hit=" + hit + ", groupId=" + groupId + ", writeDate=" + writeDate
				+ ", fileStatus=" + fileStatus + ", CommentCount=" + CommentCount + ", fileNames=" + fileNames + "]";
	}
	
	
	
	
	
	
}
