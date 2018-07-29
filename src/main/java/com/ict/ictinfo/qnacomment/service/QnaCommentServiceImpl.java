package com.ict.ictinfo.qnacomment.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ict.ictinfo.qnacomment.dao.QnaCommentDao;
import com.ict.ictinfo.qnacomment.dto.QnaCommentDto;

@Service
public class QnaCommentServiceImpl implements QnaCommentService {

	@Autowired
	private QnaCommentDao commentDao;
	
	@Override
	public void insertQnaComment(QnaCommentDto qnaComment) {
		commentDao.insertQnaComment(qnaComment);
	}

	@Override
	public List<QnaCommentDto> getQnaComments(int articleNum, int commentRow) {
		HashMap<String, Integer> commentMap = new HashMap<String, Integer>();
		commentMap.put("articleNum",articleNum);
		commentMap.put("commentRow",commentRow);
		return commentDao.getQnaComments(commentMap);
		
	}

	
	
	
	
}
