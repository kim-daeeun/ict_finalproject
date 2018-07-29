package com.ict.ictinfo.addinfo.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ict.ictinfo.addinfo.service.AddInfoService;

@Controller
public class addinfoController {
	
	@Autowired
	private AddInfoService addinfoservice;
	
	@RequestMapping(value="/interview.ict")
	public String addinfo1(){	
			return "interview/interview";	
	}
	
	@RequestMapping(value="/selfintrocate.ict")
	public String selfintrocate(){	
			return addinfoservice.getintro("selfintrocate");	
	}
	
	@RequestMapping(value="/selfintromethod.ict")
	public String selfintromethod(){	
			return addinfoservice.getintro("selfintromethod");	
	}
	
	
}
