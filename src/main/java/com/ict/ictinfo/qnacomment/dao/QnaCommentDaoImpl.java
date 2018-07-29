package com.ict.ictinfo.qnacomment.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ict.ictinfo.qnacomment.dto.QnaCommentDto;

@Repository
public class QnaCommentDaoImpl implements QnaCommentDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	private String nameSpace="com.ict.ictinfo.qnacomment.dao.QnaCommentDao";
	
	@Override
	public void insertQnaComment(QnaCommentDto qcomment) {
		sqlSession.insert(nameSpace+".insertQnaComment",qcomment);
		
	}

	@Override
	public List<QnaCommentDto> getQnaComments(HashMap<String, Integer> commentMap) {
		return sqlSession.selectList(nameSpace+".getQnaComments",commentMap);
		
	}
	
	
	
}
