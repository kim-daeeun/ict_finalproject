package com.ict.ictinfo.noticeboard.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.ict.ictinfo.bizinfo.dao.BizInfoDao;
import com.ict.ictinfo.bizinfo.dto.BizInfoDto;
import com.ict.ictinfo.bizinfo.dto.GetBizDto;
import com.ict.ictinfo.main.dao.MainDao;
import com.ict.ictinfo.main.dto.MainDto;

@Service
public class NoticeBoardServiceImpl_oldImpl implements NoticeBoardService_old {
	
	@Autowired
	private MainDao mainDao;
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

	@Override
	public List<MainDto> selectBizInfo() {	

		return mainDao.selectBizInfo();
	}
	
	
	
	
	
}
