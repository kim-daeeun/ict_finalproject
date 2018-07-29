package com.ict.ictinfo.qnaboard.controller;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ict.ictinfo.qnaboard.dto.QnaBoardDto;
import com.ict.ictinfo.qnaboard.service.QnaBoardService;

@Controller
public class QnaBoardController {
	
	@Autowired
	private QnaBoardService qnaboardservice;
	
	@RequestMapping(value="/qnaBoard.ict")
	public String qnaBoard(@ModelAttribute("pageNum") String pageNum, Model model) {

		qnaboardservice.qnaList(pageNum, model);
		
		return "/qnaboard/qnaList";

	}
	
	@RequestMapping(value="/qnaWrite.ict", method=RequestMethod.GET)
	public String qnaWrite(HttpSession session) {	

		if(session.getAttribute("id")==null) {
			return "/login/login";
		}
		else {
		return "/qnaboard/qnaWriteForm";
		}
	}	
	
	@RequestMapping(value="/qnaWrite.ict", method=RequestMethod.POST)
	public String qnaWrite(QnaBoardDto qnaArticle,HttpSession session) {
		
		qnaArticle.setId((String)session.getAttribute("id"));
		qnaboardservice.qnaWrite(qnaArticle);

		return "redirect:/qnaBoard.ict?pageNum=1";	
	}	
	
	@RequestMapping(value="/qnaContent.ict", method=RequestMethod.GET)
	public String  qnaContent(@RequestParam("articleNum") String articleNum, @ModelAttribute("pageNum") String pageNum,
		@RequestParam("fileStatus") int fileStatus, Model model, HttpSession session){
		session.setAttribute("articleNum", articleNum);
		qnaboardservice.qnaContent(articleNum,fileStatus,model);
		return "/qnaboard/qnaContent";
	}
	
	@RequestMapping(value="/qnaReply.ict", method=RequestMethod.GET)
	public String qnaReply(	@ModelAttribute("pageNum") String pageNum,
							@ModelAttribute("depth") String depth,
							@ModelAttribute("groupId") String groupId,
							@ModelAttribute("title") String title){

		return "/qnaboard/qnaReplyForm";
	}
	
	@RequestMapping(value="/qnaReply.ict", method=RequestMethod.POST)
	public String qnaReply(@RequestParam("pageNum") String pageNum, QnaBoardDto qnaArticle, HttpSession session){

		qnaArticle.setId((String)session.getAttribute("id"));
		qnaboardservice.qnaReply(qnaArticle);
		
		
		return "redirect:/qnaBoard.ict?pageNum="+ pageNum;
	}	
	
	@RequestMapping(value="/qnaUpdate.ict", method=RequestMethod.GET)
	public String  qnaUpdate(@ModelAttribute("articleNum") String articleNum,
			@ModelAttribute("pageNum") String pageNum,@ModelAttribute("fileStatus") int fileStatus,
							 Model model){
		qnaboardservice.qnaUpdate(articleNum,fileStatus,model);

		return "/qnaboard/qnaUpdateForm";
	}
	
	@RequestMapping(value="qnaUpdate.ict", method=RequestMethod.POST)
	public String updateArticle(QnaBoardDto qnaArticle,String[] deleteFileName, String pageNum,Model model, int fileCount){
		qnaboardservice.qnaUpdates(qnaArticle,deleteFileName,model,fileCount);
		return "redirect:/qnaBoard.ict?articleNum="+qnaArticle.getArticleNum()+"&pageNum="+pageNum;
	}

	@RequestMapping(value="/qnaDelete.ict")
	public String  delete(@RequestParam("pageNum") String pageNum,
							 @RequestParam("articleNum") String articleNum){
		
		qnaboardservice.qnaDelete(articleNum);
		return "redirect:/qnaBoard.ict?pageNum="+pageNum;
	}
	
	@RequestMapping(value="/qnaDownload.ict")
	@ResponseBody
	public FileSystemResource download(HttpServletResponse resp, HttpSession session, @RequestParam("articleNum") String articleNum, @RequestParam("fileNum")String fileNum) throws Exception {
		if(((String)session.getAttribute("articleNum")).equals(articleNum)) {		
			return qnaboardservice.qnaDownload(resp, fileNum);
		}
		else {
			resp.sendRedirect("/ictinfo/illegalPath.ict");
			return null;
		}
	}
	
	@RequestMapping(value="/illegalPath.ict")
	public String illegalPath() {
		return "error/illegalPath";
	}
}