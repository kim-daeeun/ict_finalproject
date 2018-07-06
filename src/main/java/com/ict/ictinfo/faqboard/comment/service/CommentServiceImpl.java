package com.ict.ictinfo.faqboard.comment.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ict.ictinfo.faqboard.comment.dao.CommentDao;
import com.ict.ictinfo.faqboard.comment.dto.CommentDto;



@Service
public class CommentServiceImpl implements CommentService {

	@Autowired
	private CommentDao commentDao;
	
	@Override
	public void insertComment(CommentDto comment) {
		commentDao.insertComment(comment);
	}

	@Override
	public List<CommentDto> getComments(int articleNum, int commentRow) {
		HashMap<String, Integer> commentMap = new HashMap<String, Integer>();
		commentMap.put("articleNum",articleNum);
		commentMap.put("commentRow",commentRow);
		return commentDao.getComments(commentMap);
		
	}

	
	
	
	
}