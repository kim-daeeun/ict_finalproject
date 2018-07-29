package com.ict.ictinfo.noticeboard.dao;

import java.util.List;

import com.ict.ictinfo.bizinfo.dto.BizInfoDto;
import com.ict.ictinfo.bizinfo.dto.GetBizDto;
import com.ict.ictinfo.main.dto.MainDto;

public interface NoticeBoardDao_old {

	public List<BizInfoDto> getBizInfo(GetBizDto getbiz);

    public List<MainDto> selectBizInfo();


	
	
}
