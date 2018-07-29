package com.ict.ictinfo.memjoin.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


import com.ict.ictinfo.memjoin.dto.MemJoinDto;
import com.ict.ictinfo.memjoin.service.MemJoinService;

@Controller
public class MemJoinController {
	
	@Autowired
	private MemJoinService memjoinService;

	
	@RequestMapping(value="/login.ict", method=RequestMethod.GET)
	public String login(HttpSession session){	

			return "/login/login";	

	}

	@ResponseBody
	@RequestMapping(value="/login.ict", method=RequestMethod.POST)
	public String login(@RequestParam("id") String id, @RequestParam("password") String password, 
																				HttpSession session){	
		
		return memjoinService.login(id, password, session);
	}
	
	
	
	
	
	
	
	@RequestMapping(value="/logout.ict")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/main.ict";
	}
	
	@RequestMapping(value="/joinForm.ict")
	public String joinForm() {
		return "/join/joinForm";
	}
	
	@RequestMapping(value="/joinInfo.ict")
	public String joinInfo(HttpSession session, Model model) {
		
		String id = (String) session.getAttribute("id");
		model.addAttribute("memjoin", memjoinService.joinInfo(id));
		return "/join/joinInfo";
	}
	

	@RequestMapping(value="/joinIdCheck.ict")
	@ResponseBody
	public int joinIdCheck(@RequestParam("id") String id) {
		
		return memjoinService.joinIdCheck(id);
	}
	
	@RequestMapping(value="/joinConfirm.ict")
	public String joinConfirm(MemJoinDto memjoin) {
		memjoinService.joinConfirm(memjoin);
		return "join/joinConfirm";
	}
	
	@RequestMapping(value="/joinUpdate.ict", method=RequestMethod.GET)
	public String getJoinUpdate( HttpSession session, Model model) {
		String id = (String) session.getAttribute("id");
		if(id == null) {
            return "redirect:/main.ict";
		}
		model.addAttribute("memjoin", memjoinService.getJoinUpdate(id));
		return "join/joinUpdateForm";
	}
	
	@RequestMapping(value="/joinUpdate.ict", method=RequestMethod.POST)
	public String joinUpdate(MemJoinDto memjoin) {

		memjoinService.joinUpdate(memjoin);
		
		return "redirect:/main.ict";
	}
	
	@RequestMapping(value="/joinDeleteForm.ict")
	public String joinDelete() {
		return "join/joinDeleteForm";
	}
	
	@ResponseBody
	@RequestMapping(value="/joinPassChk.ict", method=RequestMethod.POST)
	public String joinPassChk(@RequestParam("password") String password, HttpSession session) {
		
		return memjoinService.joinPassChk(password, session);
	}
	
	@RequestMapping(value="/joinDelete.ict")
	public String joinDelete(MemJoinDto memjoin, HttpSession session) {
		memjoin.setId((String)session.getAttribute("id"));
		String id = memjoin.getId();
		memjoinService.joinDelete(id);
		session.invalidate();
		
		return "redirect:/main.ict";
	}

}
