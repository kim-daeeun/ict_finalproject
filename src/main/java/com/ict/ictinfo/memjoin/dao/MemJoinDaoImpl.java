package com.ict.ictinfo.memjoin.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ict.ictinfo.memjoin.dto.MemJoinDto;

@Repository
public class MemJoinDaoImpl implements MemJoinDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	private String nameSpace="com.ict.ictinfo.memjoin.dao.MemJoinDao";
	
	@Override
	public String joinIdCheck(String id) {
		return sqlSession.selectOne(nameSpace+".joinIdCheck", id);
	}

	@Override
	public void joinConfirm(MemJoinDto memjoin) {
		
		sqlSession.insert(nameSpace+".joinConfirm", memjoin);
		
	}

	@Override
	public String login(String id) {
		return sqlSession.selectOne(nameSpace+".login", id);		
	}

	@Override
	public void joinUpdate(MemJoinDto memjoin) {
		
		sqlSession.update(nameSpace+".joinUpdate",memjoin);
	}

	@Override
	public MemJoinDto getJoinUpdate(String id) {
		
		return sqlSession.selectOne(nameSpace+".getJoinUpdate",id);
	}

	@Override
	public void joinDelete(MemJoinDto memjoin) {
		sqlSession.delete(nameSpace+".joinDelete",memjoin);
		
	}
	
}
