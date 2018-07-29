package com.ict.ictinfo.test.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ict.ictinfo.main.service.MainService;

@Controller
public class TestController {
	
	
	@Autowired
	private MainService mainService;
	
	@RequestMapping(value = "/test.ict")
	public String test() {		
        return "/test/test";
	}	
	
	@RequestMapping(value = "/_example.ict")
	public String _example() {		
        return "/jstl_el/_example";
	}	

	@RequestMapping(value = "/list_set_msp.ict")
	public String list_set_map() {		
        return "/collection/list_set_map";
	}	
	

	@RequestMapping(value = {"/el0.ict", "/el02.ict", "/jstl_ex1.ict",
							 "/jstl_ex2.ict", "/jstl_ex3.ict", "/jstl_ex4.ict", 
							 "/jstl_ex6.ict", "/jstl_ex7.ict", "/jstl_ex8.ict"}, 
											method = RequestMethod.GET)
	public String testGet(@RequestParam("pageName") String pageName) {
		
		System.out.println(pageName);
		
		String jspPage = "";
		
		if(pageName.equals("el0")) {
			jspPage = "/jstl_el/el0";
			
		}else if(pageName.equals("el02")){
			jspPage = "/jstl_el/el02";
			
		}else if(pageName.equals("jstl_ex1")){
			jspPage = "/jstl_el/jstl_ex1";
			
		}else if(pageName.equals("jstl_ex2")){
			jspPage = "/jstl_el/jstl_ex2";
			
		}else if(pageName.equals("jstl_ex3")){
			jspPage = "/jstl_el/jstl_ex3";
			
		}else if(pageName.equals("jstl_ex4")){
			jspPage = "/jstl_el/jstl_ex4";
			
		}else if(pageName.equals("jstl_ex6")){
			jspPage = "/jstl_el/jstl_ex6";
			
		}else if(pageName.equals("jstl_ex7")){
			jspPage = "/jstl_el/jstl_ex7";
			
		}else if(pageName.equals("jstl_ex8")){
			jspPage = "/jstl_el/jstl_ex8";
			
		}
		
		return jspPage;
	}	
	
 	
	@RequestMapping(value = {"/el0.ict", "/el02.ict", "/jstl_ex1.ict"}, 
			method = RequestMethod.POST)
	public String testPost(@RequestParam("pageName") String pageName,
							@RequestParam("user") String user,
							Model model) {
		
		model.addAttribute("user", user);
		String jspPage = "";		
		
		if(pageName.equals("el1")) {
			jspPage = "/jstl_el/el1";
			
		}else if(pageName.equals("el2_op")){
			jspPage = "/jstl_el/el2_op";
			
		}
		
		return jspPage;
	}	

	

}	
	
	
	
	
