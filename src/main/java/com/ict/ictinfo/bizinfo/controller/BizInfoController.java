package com.ict.ictinfo.bizinfo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ict.ictinfo.bizinfo.dto.GetBizDto;
import com.ict.ictinfo.bizinfo.service.BizInfoService;

@Controller
public class BizInfoController {
	
	@Autowired
	private BizInfoService bizinfoService;
	
	
	@RequestMapping(value="/donggu.ict", method=RequestMethod.GET)
	public String donggu(GetBizDto getbiz, Model model){
		getbiz.setBizcategory("광주지역");
		getbiz.setAddr01("광주광역시");
		getbiz.setAddr02("동구");
		return bizinfoService.getBizInfo(getbiz,model);
	}
	
	@ResponseBody
	@RequestMapping(value="/donggu.ict", method=RequestMethod.POST)
	public String getbizInfo(@RequestBody GetBizDto getbiz, Model model){
		getbiz.setBizcategory("광주지역");
		getbiz.setAddr01("광주광역시");
		getbiz.setAddr02("동구");
		
		return bizinfoService.getBizInfo(getbiz,model);
	}
	
	




	@RequestMapping(value="/seogu.ict")
	public String seogu(GetBizDto getbiz, Model model){
		getbiz.setBizcategory("광주지역");
		getbiz.setAddr01("광주광역시");
		getbiz.setAddr02("서구");
		
		
		
		return bizinfoService.getBizInfo(getbiz,model);
	}
	@RequestMapping(value="/namgu.ict")
	public String namgu(GetBizDto getbiz, Model model){
		
		getbiz.setBizcategory("광주지역");
		getbiz.setAddr01("광주광역시");
		getbiz.setAddr02("남구");
		return bizinfoService.getBizInfo(getbiz,model);
	}
	@RequestMapping(value="/bukgu.ict")
	public String bukgu(GetBizDto getbiz, Model model){
		getbiz.setBizcategory("광주지역");
		getbiz.setAddr01("광주광역시");
		getbiz.setAddr02("북구");
		return bizinfoService.getBizInfo(getbiz,model);
	}
	@RequestMapping(value="/gsgu.ict")
	public String gsgu(GetBizDto getbiz, Model model){
		getbiz.setBizcategory("광주지역");
		getbiz.setAddr01("광주광역시");
		getbiz.setAddr02("광산구");
		return bizinfoService.getBizInfo(getbiz,model);
	}
	@RequestMapping(value="/gycity.ict")
	public String gycity(GetBizDto getbiz, Model model){
		getbiz.setBizcategory("전남지역");
		getbiz.setAddr01("전라남도");
		getbiz.setAddr02("광양시");
		return bizinfoService.getBizInfo(getbiz,model);
	}
	
	@RequestMapping(value="/gycity.ict", method=RequestMethod.POST)
	@ResponseBody
	public String getGycity(@RequestBody GetBizDto getbiz, Model model){	
		System.out.println(bizinfoService.getBizInfo(getbiz,model));
		return bizinfoService.getBizInfo(getbiz,model);
	}
	
	@RequestMapping(value="/njcity.ict")
	public String njcity(GetBizDto getbiz, Model model){
		getbiz.setBizcategory("전남지역");
		getbiz.setAddr01("전라남도");
		getbiz.setAddr02("나주시");
		return bizinfoService.getBizInfo(getbiz,model);
	}
	@RequestMapping(value="/mpcity.ict")
	public String mpcity(GetBizDto getbiz, Model model){
		getbiz.setBizcategory("전남지역");
		getbiz.setAddr01("전라남도");
		getbiz.setAddr02("목포시");
		return bizinfoService.getBizInfo(getbiz,model);
	}
		
		@RequestMapping(value="/gjofficial.ict")
	public String gjofficial(GetBizDto getbiz, Model model){
		getbiz.setBizcategory("공공기관");
		getbiz.setAddr01("광주광역시");
		getbiz.setAddr02("남구");
		return bizinfoService.getBizInfo(getbiz,model);
	}
	
	/*@RequestMapping(value="/gjofficial.ict")
	public String gjofficial(@ModelAttribute("bizcategory") String bizcategory,
			 @ModelAttribute("addr01") String addr01,
			 @ModelAttribute("addr02") String addr02){

		return "officialloc";
	}*/
			
	@RequestMapping(value="/njofficial.ict")
	public String njofficial(GetBizDto getbiz, Model model){
		getbiz.setBizcategory("공공기관");
		getbiz.setAddr01("전라남도");
		getbiz.setAddr02("나주시");	
		return bizinfoService.getBizInfo(getbiz,model);
	}
	
}
