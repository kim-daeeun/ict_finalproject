package com.ict.ictinfo.faqboard.comment.service;

import java.util.List;

import com.ict.ictinfo.faqboard.comment.dto.CommentDto;



public interface CommentService {
	public void insertComment(CommentDto comment);
	public List<CommentDto> getComments(int articleNum, int commentRow);
}
