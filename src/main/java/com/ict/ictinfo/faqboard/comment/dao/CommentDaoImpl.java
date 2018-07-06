package com.ict.ictinfo.faqboard.comment.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ict.ictinfo.faqboard.comment.dto.CommentDto;



@Repository
public class CommentDaoImpl implements CommentDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	private String nameSpace="com.ict.ictinfo.faqboard.comment.dao.CommentDao";
	
	@Override
	public void insertComment(CommentDto comment) {
		sqlSession.insert(nameSpace+".insertComment",comment);
		
	}

	@Override
	public List<CommentDto> getComments(HashMap<String, Integer> commentMap) {
		return sqlSession.selectList(nameSpace+".getComments",commentMap);
		
	}
	
	
	
}
