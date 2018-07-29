package com.ict.ictinfo.qnacomment.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ict.ictinfo.qnacomment.dto.QnaCommentDto;
import com.ict.ictinfo.qnacomment.service.QnaCommentService;


@Controller
public class QnaCommentController {

	@Autowired
	private QnaCommentService commentService;
 
	@RequestMapping(value="/qnaCommentWrite.ict")
	@ResponseBody
	public  HashMap<String, Object> commentWrite(QnaCommentDto qnaComment, 
                  HttpSession session){
		qnaComment.setId((String)session.getAttribute("id"));
		commentService.insertQnaComment(qnaComment);
		List<QnaCommentDto> qnaCommentList=
		commentService.getQnaComments(qnaComment.getArticleNum(),10);
		HashMap<String, Object> hm = new HashMap<String, Object>();
		hm.put("result", 1);
		hm.put("commentList", qnaCommentList);
		return hm;
	}
	//MappingJacksonJSONview ���
	/*@RequestMapping(value="/commentRead.comment")
	public String commentRead(@RequestParam("articleNum") int articleNum,
										@RequestParam("commentRow") int commentRow,Model model){
		model.addAttribute("commentList", commentService.getComments(articleNum, commentRow) );
		return "JSON";
	}*/
	
	@RequestMapping(value="/qnaCommentRead.ict")
	@ResponseBody
	public List<QnaCommentDto> commentRead(@RequestParam("articleNum") int articleNum,
										@RequestParam("commentRow") int commentRow){
		return commentService.getQnaComments(articleNum,commentRow);
	}
	 
}