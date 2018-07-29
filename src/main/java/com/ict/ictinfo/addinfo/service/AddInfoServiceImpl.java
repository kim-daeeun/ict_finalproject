package com.ict.ictinfo.addinfo.service;

import org.springframework.stereotype.Service;

@Service
public class AddInfoServiceImpl implements AddInfoService{

	@Override
	public String getintro(String temp) {
		if(temp.equals("selfintrocate")) {
			return 	"/addinfo/selfintrocate";
		}
		else if(temp.equals("selfintromethod")) {
			return "/addinfo/selfintromethod";
		}
		else 
			return null;
	}
	
}
