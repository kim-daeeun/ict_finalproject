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

	
/*	
	@RequestMapping(value="/loginok.ict", method=RequestMethod.GET)
	public String loinok(@RequestParam("id") String id, Model model, HttpSession session) {
		
		System.out.println("controller..loginok >>>>>>>>>>>>> : " + id);
		
		model.addAttribute("id", id);
		session.setAttribute("id", id);	
		
		�씠遺�遺꾩씠 �뿉�윭媛� �뼚�꽌 MainController �뿉 mainlogin.ict瑜� �떖�쓬
		login.jsp �쓽 紐⑤떖李쎌뿉�꽌 �씠遺�遺꾩쓣 �젒洹쇳븿
        //List<MainDto> bizInfoList = mainService.selectBizInfo();        
        //model.addAttribute("bizInfoList", bizInfoList);
		
		return "main";
	}	
*/	



	
	@RequestMapping(value="/login.ict", method=RequestMethod.GET)
	public String login(HttpSession session){	

			return "/login/login";	

	}

	@ResponseBody
	@RequestMapping(value="/login.ict", method=RequestMethod.POST)
	public String login(@RequestParam("id") String id, @RequestParam("password") String password, 
																				HttpSession session){	
		
		System.out.println("controller >>>>>>>>>>>>>id : " + id);
		System.out.println("controller >>>>>>>>>>>>>password : " + password);
		
		String result = memjoinService.login(id, password, session);
		
		System.out.println("controller003 >>>>>>>>>>>>>result : " + result);		
	
		return result;
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
	

	@RequestMapping(value="/joinIdCheck.ict")
	@ResponseBody
	public int joinIdCheck(@RequestParam("id") String id) {
		
		return memjoinService.joinIdCheck(id);
	}
	
	@RequestMapping(value="/joinConfirm.ict")
	public void joinConfirm(MemJoinDto memjoin) {
		memjoinService.joinConfirm(memjoin);
	}
	
	@RequestMapping(value="/joinUpdate.ict", method=RequestMethod.GET)
	public String getJoinUpdate( HttpSession session, Model model) {
		String id = (String) session.getAttribute("id");
		if(id == null) {
            return "redirect:/main.ict";
		}
		model.addAttribute("memjoin", memjoinService.getJoinUpdate(id));
		return "joinUpdateForm";
	}
	
	@RequestMapping(value="/joinUpdate.ict", method=RequestMethod.POST)
	public String joinUpdate(MemJoinDto memjoin) {

		memjoinService.joinUpdate(memjoin);
		
		return "redirect:/main.ict";
	}
	
	@RequestMapping(value="/joinDelete.ict")
	public void joinDelete(MemJoinDto memjoin, HttpSession session) {
		memjoin.setId((String)session.getAttribute("id"));
		memjoinService.joinDelete(memjoin);
	}
	
	@RequestMapping(value="/joinDeleteForm.ict")
	public void joinDeleteForm() {
		
	}

}
