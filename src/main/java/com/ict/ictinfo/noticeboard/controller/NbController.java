package com.ict.ictinfo.noticeboard.controller;

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

import com.ict.ictinfo.noticeboard.dto.NbDto;
import com.ict.ictinfo.noticeboard.service.NbService;

@Controller
public class NbController {
	
	
	@Autowired
	private NbService nbService;
	

	@RequestMapping(value="/nbList.ict")
	public String nbList(@ModelAttribute("pageNum") String pageNum, Model model) {	
		nbService.list(pageNum, model);
		
		return "/noticeboard/nbList";
	}		
	

	
	
	// ■ ■ ■ 글쓰기 화면
	@RequestMapping(value="/nbWrite.ict", method=RequestMethod.GET)
	//public String writeForm(HttpSession session, HttpServletResponse resp) {
		public String writeForm(HttpSession session) {
							// AOP 실습을 위해 HttpServletResponse를 받음
		
		if((String)session.getAttribute("id")==null) {   // 로그인 유무 체크하는 코드
			return "/login/login";
		}
		return "/noticeboard/nbWriteForm";
	}
	
	// ■ ■ ■ 글쓰기 & 파일 업로드 후 저장 버튼 클릭했을 때 
	// List가 인터페이스이므로 인스턴스화 할수 없음
	//public String write(BBSDto article, List<String> fileNames, HttpSession session) {
	// 문법적으로 문제는 없지만 ArrayList에 값이 안들어옴


	@RequestMapping(value="/nbWrite.ict", method=RequestMethod.POST)
	public String write(NbDto article, HttpSession session) {
		
		article.setId((String)session.getAttribute("id"));
		nbService.write(article);

		return "redirect:/nbList.ict?pageNum=1";	
	}	
	
	
	
	
	
	
	
	@RequestMapping(value="/nbContent.ict", method=RequestMethod.GET)
	public String content(@RequestParam("articleNum") String articleNum,
							@ModelAttribute("pageNum") String pageNum, 
							@RequestParam("fileStatus") int fileStatus, Model model,
							HttpSession session, HttpServletResponse resp) {
							// AOP 실습을 위해 HttpSession, HttpServletResponse를 받음
		
		

		// 해당글의 커맨트 갯수를 가져오는 쿼리를 한번더 실행
		nbService.content(articleNum, fileStatus, model);
		// model.addAttribute("pageNum", pageNum);
		return "/noticeboard/nbContent";
	}
	
	@ResponseBody
	@RequestMapping(value="/nbDownload.ict")
	public FileSystemResource download(HttpServletResponse resp, @RequestParam String storedFname) {
		return nbService.download(resp, storedFname);
	}	
	
	
	
	
	
	
	
	@RequestMapping(value="/nbDelete.ict")
	public String delete(@RequestParam("pageNum") String pageNum,
					     @RequestParam("articleNum") String articleNum, 
					     Model model) {
		
		
		// articleNum 글번호
		nbService.delete(articleNum);
		// model.addAttribute("pageNum", pageNum);

		return "redirect:/nbList.ict?pageNum="+pageNum;
	}	

	
	

	
	
	
	

	@RequestMapping(value="/nbUpdate.ict", method=RequestMethod.GET)
	public String getUpdateArticle(@ModelAttribute("articleNum") String articleNum,
			   @ModelAttribute("pageNum") String pageNum, Model model, 
			   @ModelAttribute("fileStatus")int fileStatus) {

		nbService.getUpdateArticle(articleNum, model, fileStatus);
		return "/noticeboard/nbUpdateForm";
	}
	
	
	

	@RequestMapping(value="/nbUpdate.ict", method=RequestMethod.POST)
	public String updateArticle(@RequestParam String pageNum, NbDto article,
							String[]deleteFileName,Model model,int fileCount) {
		
		// bbsService.updateArticle(article);
		nbService.updateArticle(article, deleteFileName, model, fileCount);
		return "redirect:/nbContent.ict?articleNum="+article.getArticleNum()+"&pageNum="+pageNum;
	}	
	
	
	
	
	@RequestMapping(value="/nbReplyForm.ict")
	public String replyForm(@ModelAttribute("pageNum") String pageNum,
							@ModelAttribute("depth") String depth,
							@ModelAttribute("groupId") String groupId) {	

		return "/noticeboard/nbReplyForm";
	}	
	
	
	@RequestMapping(value="/nbReply.ict", method=RequestMethod.POST)
	 public String reply(@RequestParam("pageNum") String pageNum,
				NbDto article, HttpSession session){		
							// BBSDto항목을 다 받아 오는 방법
		
		  article.setId((String)session.getAttribute("id"));		  
		  nbService.reply(article);		  
		  return "redirect:/nbList.ict?pageNum="+pageNum;
	}		
	
	// 검색할때
	@RequestMapping(value="/nbSearch.ict", method=RequestMethod.POST)
	public String nbSearch(@ModelAttribute("searchOption") String searchOption,
							@ModelAttribute("keyword") String keyword, 
							@RequestParam("pageNum") String pageNum, 
							Model model) {
		

		if(keyword.equals("")) {		/* 게시판 검색란에 아무것도 입력 안했을 경우 보고 있는 화면 그대로 보여줌 */
			model.addAttribute("pageNum", pageNum);
			return "redirect:/nbList.ict?pageNum="+pageNum; 
			
		}else {							/* 게시판 검색란에 무언가를 입력 했을 경우 */
			pageNum ="1";
			model.addAttribute("pageNum", pageNum);
			nbService.nbSearch(searchOption, keyword, pageNum, model);		
			return "/noticeboard/nbList";
		}
		

	}	
	

}	






























