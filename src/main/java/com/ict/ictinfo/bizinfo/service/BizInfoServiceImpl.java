package com.ict.ictinfo.bizinfo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.ict.ictinfo.bizinfo.dao.BizInfoDao;
import com.ict.ictinfo.bizinfo.dto.BizInfoDto;
import com.ict.ictinfo.bizinfo.dto.GetBizDto;

@Service
public class BizInfoServiceImpl implements BizInfoService {
	
	@Autowired
	private BizInfoDao bizinfoDao;
	
	@Override
	public String getBizInfo(GetBizDto getbiz, Model model) {
		
		String view=null;
		List <BizInfoDto> bizinfo=bizinfoDao.getBizInfo(getbiz);
		model.addAttribute("bizList", bizinfo);
		
		if(getbiz.getBizcategory().equals("광주지역")) {
			view="/bizinfo/gjloc";

		}
		else if(getbiz.getBizcategory().equals("전남지역")) {
			view="/bizinfo/cnloc";


		}
		else if(getbiz.getBizcategory().equals("공공기관")) {
			view="/bizinfo/officialloc";

		}
		return view;
	}

}

