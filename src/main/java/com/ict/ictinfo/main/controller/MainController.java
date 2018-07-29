package com.ict.ictinfo.main.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.List;
import java.util.Locale;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.XML;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ict.ictinfo.main.dto.MainDto;
import com.ict.ictinfo.main.dto.MainNbDto;
import com.ict.ictinfo.main.service.MainService;

@Controller
public class MainController {
	
	
	@Autowired
	private MainService mainService;
	
	
	@RequestMapping(value = "/")
	public String main(Locale locale, Model model, HttpSession session) {
		
		session.invalidate();        
        return "redirect:/main.ict";
	}
	
	
	
/*	
	@RequestMapping(value = "/")
	public String main(Locale locale, Model model, HttpSession session) {
		session.invalidate();
		return "main";		
	}		
*/	

	@RequestMapping(value="/main.ict", method=RequestMethod.GET)
	public String main_ict(Locale locale, Model model) {
		
        List<MainDto> bizInfoList = mainService.selectBizInfo();        
        model.addAttribute("bizInfoList", bizInfoList);
        
        List<MainNbDto> noticeboardList = mainService.selectNoticeBoard();
        model.addAttribute("nbList", noticeboardList);
        
		return "main";
	}	
	
	
	@RequestMapping(value="/mainLoginOk.ict", method=RequestMethod.GET)
	public String loinok(@RequestParam("id") String id, Model model, 
							HttpServletRequest request, HttpSession session,
							@RequestParam("backPageUrl") String backPageUrl) {
		
		model.addAttribute("id", id);
		session.setAttribute("id", id);	
		
        List<MainDto> bizInfoList = mainService.selectBizInfo();        
        model.addAttribute("bizInfoList", bizInfoList);
        
        
        if(backPageUrl.contains("nbContent.ict")) {
            return "redirect:/nbList.ict?pageNum=1";
           }else if(backPageUrl.contains("faqcontent.ict")) {
            return "redirect:/faqlist.ict?pageNum=1";
           }else if(backPageUrl.contains("qnaContent.ict")) {
            return "redirect:/qnaBoard.ict?pageNum=1";
           }else {        
            return "redirect:"+ backPageUrl;
           } 	
	}	
		
	
	@RequestMapping(value = "/fpAnnouncement.ict")
	public String fpAnnouncement(Locale locale, Model model, HttpSession session) {      
        return "login/fpAnnouncement";
	}	
	
	@RequestMapping(value = "/sitemap.ict")
	 public String sitemap() {      
	        return "/login/sitemap";
	 }
	
	

	@ResponseBody
	@RequestMapping(value="/empRate.ict", method=RequestMethod.POST, produces = "application/json; charset=utf8")
	protected String doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException,
	  IOException{
		
		req.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html; charset=UTF-8");
		
		String queryUrl = "http://api.saramin.co.kr/job-search?loc_cd=103000&ind_cd=301&job_category=404";
				
        HttpURLConnection conn = (HttpURLConnection) new URL(queryUrl).openConnection();
        conn.connect();

        BufferedReader reader = new BufferedReader(new InputStreamReader(conn.getInputStream(),"utf-8"));
        StringBuffer st = new StringBuffer();
        String line;        
        while ((line = reader.readLine()) != null) {
            st.append(line);
        }
 
        org.json.JSONObject xmlJSONObj = XML.toJSONObject(st.toString());
        String jsonPrettyPrintString = xmlJSONObj.toString(4);     
     
        //System.out.println(jsonPrettyPrintString);
        return jsonPrettyPrintString;      
	}	
	

}	
	
	
	
	
