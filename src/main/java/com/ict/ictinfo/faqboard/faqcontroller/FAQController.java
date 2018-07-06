package com.ict.ictinfo.faqboard.faqcontroller;

import java.util.List;
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
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import com.ict.ictinfo.faqboard.faqdto.FAQDto;
import com.ict.ictinfo.faqboard.faqservice.FAQService;

@Controller
public class FAQController {
	@Autowired 
	private FAQService faqservice;
	
	@RequestMapping("/faqlist.ict") 
	public String list(@ModelAttribute("pageNum") String pageNum, Model model) {
	// public String test(@RequestParam String pageNum, Model model)
		faqservice.list(pageNum, model);
		return "faqboard/list";
	}
	
	@RequestMapping(value="/faqwrite.ict", method=RequestMethod.GET) 	
	public String writeForm(HttpSession session) {
		if((String)session.getAttribute("id")==null) {
			return "/login/login";
		}
		return "/faqboard/writeForm";
	}
	
	@RequestMapping(value="/faqwrite.ict", method=RequestMethod.POST) 
	public String write(FAQDto article, HttpSession session) {
		article.setId((String)session.getAttribute("id"));	
		faqservice.write(article);
		return "redirect:/faqlist.ict?pageNum=1";
	}
	
	@RequestMapping(value="/faqcontent.ict", method=RequestMethod.GET)
	public String  content(@RequestParam("articleNum") String articleNum, @ModelAttribute("pageNum") String pageNum,
		@RequestParam("fileStatus") int fileStatus, Model model){
		faqservice.content(articleNum,fileStatus,model);
		return "faqboard/content";
	}
	
	@RequestMapping(value="/faqreplyForm.ict")
	public String  replyForm(@ModelAttribute("pageNum") String pageNum,
			 @ModelAttribute("depth") String depth,
			 @ModelAttribute("groupId") String groupId){
		return "faqboard/replyForm";
	}
	
	@RequestMapping(value="/faqreply.ict")
	public String  reply(@RequestParam("pageNum") String pageNum,
		FAQDto article,@RequestPart("fname") List<MultipartFile> mFile,HttpSession session){
		article.setId((String)session.getAttribute("id"));
		faqservice.reply(article, mFile);
		return "redirect:/faqlist.ict?pageNum="+pageNum;
	}
	
	@RequestMapping(value="/faqdelete.ict")
	public String delete(@RequestParam("pageNum") String pageNum,
							 @RequestParam("articleNum") String articleNum){
		faqservice.delete(articleNum);
		return "redirect:/faqlist.ict?pageNum="+pageNum;
	}
	
	@RequestMapping(value="/faqupdate.ict", method=RequestMethod.GET)
	public String  updateGetArticle(@ModelAttribute("articleNum") String articleNum,
		@ModelAttribute("pageNum") String pageNum, @ModelAttribute("fileStatus") int fileStatus,Model model){
		
		faqservice.getUpdateArticle(articleNum,fileStatus,model);

		return "/faqboard/updateForm";
	}
	
	@RequestMapping(value="/faqupdate.ict", method=RequestMethod.POST)
	public String  updateGetArticle(FAQDto article,String[] deleteFileName,String pageNum,Model model, int fileCount){
		
		faqservice.updateArticle(article,deleteFileName,model,fileCount);
		return "redirect:/faqcontent.ict?articleNum="+article.getArticleNum()+"&pageNum="+pageNum;
	}
	
	@RequestMapping(value="/faqdownload.ict")
	@ResponseBody
	public FileSystemResource download(HttpServletResponse resp, @RequestParam String storedFname) {
		return faqservice.download(resp, storedFname);
	}
	
}
