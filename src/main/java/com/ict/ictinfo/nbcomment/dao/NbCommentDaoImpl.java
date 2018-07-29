package com.ict.ictinfo.nbcomment.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ict.ictinfo.nbcomment.dto.NbCommentDto;

@Repository
public class NbCommentDaoImpl implements NbCommentDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	private final String nameSpace="com.ict.ictinfo.nbcomment.dao.NbCommentDao";
	
	@Override
	public void insertComment(NbCommentDto comment) {		
		sqlSession.insert(nameSpace + ".insertComment", comment);
	}

	@Override
	public List<NbCommentDto> getComments (HashMap<String, Integer> map) {		
		return sqlSession.selectList(nameSpace+".getComments", map);
	}

	
	
	
}
