package com.ict.ictinfo.bizinfo.dao;

import java.util.List;

import com.ict.ictinfo.bizinfo.dto.BizInfoDto;
import com.ict.ictinfo.bizinfo.dto.GetBizDto;

public interface BizInfoDao {

	public List<BizInfoDto> getBizInfo(GetBizDto getbiz);

}
