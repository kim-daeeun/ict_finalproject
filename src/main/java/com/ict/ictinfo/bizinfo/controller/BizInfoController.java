package com.ict.ictinfo.bizinfo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.RequestMapping;

import com.ict.ictinfo.bizinfo.dto.GetBizDto;
import com.ict.ictinfo.bizinfo.service.BizInfoService;

@Controller
public class BizInfoController {
	
	@Autowired
	private BizInfoService bizinfoService;
	
	
	@RequestMapping(value="/donggu.ict")
	public String donggu(GetBizDto getbiz, Model model){
		
		getbiz.setBizcategory("광주지역");
		getbiz.setAddr01("광주광역시");
		getbiz.setAddr02("동구");
		model.addAttribute("chkIndex", "1");
		
		return bizinfoService.getBizInfo(getbiz,model);
	}

	@RequestMapping(value="/seogu.ict")
	public String seogu(GetBizDto getbiz, Model model){
		
		getbiz.setBizcategory("광주지역");
		getbiz.setAddr01("광주광역시");
		getbiz.setAddr02("서구");
		model.addAttribute("chkIndex", "2");
		
		return bizinfoService.getBizInfo(getbiz,model);
	}
	
	@RequestMapping(value="/namgu.ict")
	public String namgu(GetBizDto getbiz, Model model){
		
		getbiz.setBizcategory("광주지역");
		getbiz.setAddr01("광주광역시");
		getbiz.setAddr02("남구");
		model.addAttribute("chkIndex", "3");
		
		return bizinfoService.getBizInfo(getbiz,model);
	}
	
	@RequestMapping(value="/bukgu.ict")
	public String bukgu(GetBizDto getbiz, Model model){
		
		getbiz.setBizcategory("광주지역");
		getbiz.setAddr01("광주광역시");
		getbiz.setAddr02("북구");
		model.addAttribute("chkIndex", "4");
		
		return bizinfoService.getBizInfo(getbiz,model);
	}
	
	@RequestMapping(value="/gsgu.ict")
	public String gsgu(GetBizDto getbiz, Model model){
		
		getbiz.setBizcategory("광주지역");
		getbiz.setAddr01("광주광역시");
		getbiz.setAddr02("광산구");
		model.addAttribute("chkIndex", "5");
		
		return bizinfoService.getBizInfo(getbiz,model);
	}
	
	@RequestMapping(value="/gycity.ict")
	public String gycity(GetBizDto getbiz, Model model){
		
		getbiz.setBizcategory("전남지역");
		getbiz.setAddr01("전라남도");
		getbiz.setAddr02("광양시");
		model.addAttribute("chkIndex", "1");
		
		return bizinfoService.getBizInfo(getbiz,model);
	}
	
	@RequestMapping(value="/njcity.ict")
	public String njcity(GetBizDto getbiz, Model model){
		
		getbiz.setBizcategory("전남지역");
		getbiz.setAddr01("전라남도");
		getbiz.setAddr02("나주시");
		model.addAttribute("chkIndex", "2");
		
		return bizinfoService.getBizInfo(getbiz,model);
	}
	
	@RequestMapping(value="/mpcity.ict")
	public String mpcity(GetBizDto getbiz, Model model){
		
		getbiz.setBizcategory("전남지역");
		getbiz.setAddr01("전라남도");
		getbiz.setAddr02("목포시");
		model.addAttribute("chkIndex", "3");
		
		return bizinfoService.getBizInfo(getbiz,model);
	}
		
	@RequestMapping(value="/gjofficial.ict")

	public String gjofficial(GetBizDto getbiz, Model model){
		
		getbiz.setBizcategory("공공기관");
		getbiz.setAddr01("광주광역시");
		getbiz.setAddr02("남구");
		model.addAttribute("chkIndex", "1");
		
		return bizinfoService.getBizInfo(getbiz,model);
	}

	@RequestMapping(value="/njofficial.ict")
	public String njofficial(GetBizDto getbiz, Model model){
		
		getbiz.setBizcategory("공공기관");
		getbiz.setAddr01("전라남도");
		getbiz.setAddr02("나주시");	
		model.addAttribute("chkIndex", "2");
		
		return bizinfoService.getBizInfo(getbiz,model);
	}
	
}
