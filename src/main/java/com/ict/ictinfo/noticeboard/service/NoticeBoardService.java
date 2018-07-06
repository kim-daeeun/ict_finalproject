package com.ict.ictinfo.noticeboard.service;

import java.util.List;

import org.springframework.ui.Model;

import com.ict.ictinfo.bizinfo.dto.GetBizDto;
import com.ict.ictinfo.main.dto.MainDto;

public interface NoticeBoardService {

	public String getBizInfo(GetBizDto getbiz, Model model);
	
    public List<MainDto> selectBizInfo();
    



}
