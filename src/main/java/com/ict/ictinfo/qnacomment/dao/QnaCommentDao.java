package com.ict.ictinfo.qnacomment.dao;

import java.util.HashMap;
import java.util.List;

import com.ict.ictinfo.qnacomment.dto.QnaCommentDto;


public interface QnaCommentDao {
	public void insertQnaComment(QnaCommentDto qnaComment);
	public List<QnaCommentDto> getQnaComments(HashMap<String, Integer> commentMap); 
}
