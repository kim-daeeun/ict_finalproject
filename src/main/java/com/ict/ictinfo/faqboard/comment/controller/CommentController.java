package com.ict.ictinfo.faqboard.comment.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ict.ictinfo.faqboard.comment.dto.CommentDto;
import com.ict.ictinfo.faqboard.comment.service.CommentService;



@Controller
public class CommentController {

	@Autowired
	private CommentService commentService;
 
	@RequestMapping(value="/faqcommentWrite.comment")
	@ResponseBody
	public  HashMap<String, Object> commentWrite(CommentDto comment, 
                  HttpSession session){
		comment.setId((String)session.getAttribute("id"));
		commentService.insertComment(comment);
		List<CommentDto> commentList=
		commentService.getComments(comment.getArticleNum(),10);
		HashMap<String, Object> hm = new HashMap<String, Object>();
		hm.put("result", 1);
		hm.put("commentList", commentList);
		return hm;
	}
	
	@RequestMapping(value="/faqcommentRead.comment")
	@ResponseBody
	public List<CommentDto> commentRead(@RequestParam("articleNum") int articleNum,
										@RequestParam("commentRow") int commentRow){
		return commentService.getComments(articleNum,commentRow);
	}
	 
}
