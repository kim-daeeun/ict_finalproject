package com.ict.ictinfo.addinfo.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class addinfoController {
	
	@RequestMapping(value="/presentation_interview.ict")
	public String addinfo1(){	
			return "presentation&interview/presentation&interview";	
	}
}
