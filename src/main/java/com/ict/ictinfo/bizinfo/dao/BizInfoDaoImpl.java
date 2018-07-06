package com.ict.ictinfo.bizinfo.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ict.ictinfo.bizinfo.dto.BizInfoDto;
import com.ict.ictinfo.bizinfo.dto.GetBizDto;

@Repository
public class BizInfoDaoImpl implements BizInfoDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	private String nameSpace="com.ict.ictinfo.bizinfo.dao.BizInfoDao";
	
	@Override
	public List<BizInfoDto> getBizInfo(GetBizDto getbiz) {
		return sqlSession.selectList(nameSpace+".getBizInfo", getbiz);
	}



}
