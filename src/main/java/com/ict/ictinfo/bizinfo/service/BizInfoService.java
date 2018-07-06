package com.ict.ictinfo.bizinfo.service;

import org.springframework.ui.Model;

import com.ict.ictinfo.bizinfo.dto.GetBizDto;

public interface BizInfoService {

	public String getBizInfo(GetBizDto getbiz, Model model);

}
