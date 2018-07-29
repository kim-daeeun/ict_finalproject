package com.ict.ictinfo.admin.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ict.ictinfo.noticeboard.dto.NbFileDto;
import com.ict.ictinfo.noticeboard.dto.NbDto;

@Repository
public class AdminDaoImpl implements AdminDao {
	
	// root-context.xml에 생성해 놓았으므로 가능
	@Autowired
	// ★private JdbcTemplate jdbcTemplate;
	private SqlSessionTemplate sqlSession;
	private StringBuffer query;					//질문. ????????????????????
	
	//bbs.xml 파일을 호출하기 위해 bbs.xml에 있는 namespace를 선언해 준다
	private final String nameSpace="com.ict.ictinfo.admin.dao.AdminDao";
	
	
	public void dbDelArticleNum(String[] checkboxValues) {
		sqlSession.delete(nameSpace+".dbDelArticleNum", checkboxValues);		
	}	
	
	

}



























