package com.ict.ictinfo.faqboard.comment.dao;

import java.util.HashMap;
import java.util.List;

import com.ict.ictinfo.faqboard.comment.dto.CommentDto;

public interface CommentDao {
	public void insertComment(CommentDto comment);
	public List<CommentDto> getComments(HashMap<String, Integer> commentMap);
}
