package com.ict.ictinfo.main.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ict.ictinfo.bizinfo.dto.BizInfoDto;
import com.ict.ictinfo.bizinfo.dto.GetBizDto;
import com.ict.ictinfo.main.dto.MainDto;

@Repository
public class MainDaoImpl implements MainDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	private String nameSpace="com.ict.ictinfo.main.dao.MainDao";
	
	@Override
	public List<BizInfoDto> getBizInfo(GetBizDto getbiz) {
		return sqlSession.selectList(nameSpace+".getBizInfo", getbiz);
	}
    
    @Override
    public List<MainDto> selectBizInfo() { 
        return sqlSession.selectList(nameSpace+".selectBizInfo");
    }




}
