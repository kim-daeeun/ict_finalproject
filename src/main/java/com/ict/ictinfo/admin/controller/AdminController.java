package com.ict.ictinfo.admin.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ict.ictinfo.admin.service.AdminService;
import com.ict.ictinfo.noticeboard.service.NbService;

@Controller
public class AdminController {
	
	
	@Autowired
	private NbService nbService;
	
	@Autowired
	private AdminService adminService;
	

	@RequestMapping(value="/test.admin")
	public String test(@ModelAttribute("pageNum") String pageNum, Model model) {	
		return "/admin/admin_main";
	}		

	/*메인 페이지*/
	@RequestMapping(value="/admin_main.admin")
	public String admin_main(@ModelAttribute("pageNum") String pageNum, Model model) {	
		return "/admin/admin_main";
	}	
	
	
	/*공지사항 페이지로 연결됨 */
	@RequestMapping(value="/admin_nbList.admin")
	public String admin_nbList(@ModelAttribute("pageNum") String pageNum, Model model) {	
		nbService.list(pageNum, model);
		
		return "/admin/noticeboard/admin_nbList";
	}
	

	/*글 및 파일 삭제하기*/
	@ResponseBody
	@RequestMapping(value="/articleListDelete.ict", method=RequestMethod.POST)
	public String articleListDelete(String[] checkboxValues) {
		
		adminService.articleListDelete(checkboxValues);
		
		String temp = "1";		
		return temp;
	}	
	
	/*색상표 페이지로 연결됨 */
	@RequestMapping(value="/admin_color.admin")
	public String admin_color() {	
		return "/admin/admin_color";
	}	

}	






























