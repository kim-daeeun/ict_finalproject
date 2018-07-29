package com.ict.ictinfo.nbcomment.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ict.ictinfo.nbcomment.dto.NbCommentDto;
import com.ict.ictinfo.nbcomment.service.NbCommentService;

@Controller
public class NbCommentController {

	
	@Autowired
	private NbCommentService commentService;
	
	@RequestMapping(value="/nbCommentWrite.comment")
	@ResponseBody
	public  HashMap<String, Object> commentWrite(NbCommentDto comment, HttpSession session){
		comment.setId((String)session.getAttribute("id"));
		commentService.insertComment(comment);
		
		List<NbCommentDto> commentList=
				commentService.getComments(comment.getArticleNum(),10);
		
		HashMap<String, Object> hm = new HashMap<String, Object>();
		hm.put("result", 1);
		hm.put("commentList", commentList);
		return hm;				
	}	
	
	/*아래 방법보다는 이 방법으로 하는게 훨씬 쉽다. 이방법으로 하라.*/
	@RequestMapping(value="/nbCommentRead.comment")
	@ResponseBody
	public List<NbCommentDto> commentRead(@RequestParam("articleNum") int articleNum, 
										@RequestParam("commentRow") int commentRow){							
		return commentService.getComments(articleNum, commentRow);		
	}		
	

	
	
	/*JackSon 방식을 이용한 코딩*/
/*	
	@RequestMapping(value="/commentRead.comment")
	public String commentRead(@RequestParam("articleNum") int articleNum, 
										@RequestParam("commentRow") int commentRow,	Model model){							
		model.addAttribute("commentList",commentService.getComments(articleNum, commentRow));
		return "JSON";	// JSON 은 맘대로 써라. 
	}	
	bean에 JSON 을선언해서 JSON 형태로 바꾸어 준다. 	
	
*/}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
