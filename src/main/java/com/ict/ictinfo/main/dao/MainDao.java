package com.ict.ictinfo.main.dao;

import java.util.List;

import com.ict.ictinfo.bizinfo.dto.BizInfoDto;
import com.ict.ictinfo.bizinfo.dto.GetBizDto;
import com.ict.ictinfo.main.dto.MainDto;
import com.ict.ictinfo.main.dto.MainNbDto;

public interface MainDao {

	public List<BizInfoDto> getBizInfo(GetBizDto getbiz);

    public List<MainDto> selectBizInfo();
    public List<MainNbDto> selectNoticeBoard();

	
	
}
