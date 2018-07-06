package com.ict.ictinfo.faqboard.faqservice;

import java.io.File;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import com.ict.ictinfo.faqboard.faqdao.FAQDao;
import com.ict.ictinfo.faqboard.faqdto.FAQDto;
import com.ict.ictinfo.faqboard.faqdto.FileDto;
import com.ict.ictinfo.faqboard.page.MediaUtils;
import com.ict.ictinfo.faqboard.page.Page;

@Service
public class FAQServiceImpl implements FAQService {
	
	@Autowired
	private FAQDao faqdao;
	
	@Resource(name="saveDir")
	private String saveDir;
	
	@Autowired
	private Page page;
	
	@Resource(name="pageSize")
	private int pageSize;
	@Resource(name="pageBlock")
	private int pageBlock;
	
	
	@Override
	public void list(String pageNum, Model model) {
		int totalCount=faqdao.getTotalCount();
		HashMap<String, String> pagingMap=page.paging(Integer.parseInt(pageNum),totalCount,pageSize,pageBlock);
		model.addAttribute("pageCode", pagingMap.get("pageCode"));
		model.addAttribute("articleList", faqdao.list(pagingMap));
		model.addAttribute("totalCount", totalCount);
		
	}
	
	@Override
	 public void delete(String articleNum) {
	  List<String> deleteList=faqdao.getDeleteList(articleNum);
	  for(String storedFname : deleteList) {
	      File deleteFname = new File(saveDir+storedFname);
	      if(deleteFname.exists()) {
	       deleteFname.delete();
	      }
	  }
	  faqdao.delete(articleNum);
	 }
	
	@Override
	public void getUpdateArticle(String articleNum,int fileStatus,Model model) {
		model.addAttribute("article", faqdao.getUpdateArticle(articleNum));
		if(fileStatus==1) {
			List<String> fileList = faqdao.getFiles(articleNum);
			model.addAttribute("fileList", fileList);
			model.addAttribute("fileCount", fileList.size());
		}
		
		else {
			//기존의 글이 파일 업로드가 없는 글이었을 경우는 updateForm.jsp의 fileCount에 공백값이 들어가므로 update.bbs요청시 400에러가 남 그래서 0줬음
			model.addAttribute("fileCount", 0);
		}
		
	}

	
	@Override
	public void updateArticle(FAQDto article,String[] deleteFileName, Model model, int fileCount) {
		if(article.getFileNames()!=null) {
			if(fileCount==0) {
				article.setFileStatus((byte)1);
			}
			
			else {
				if(deleteFileName !=null) {
					//Mybatis 매퍼 파일이 List를 받을 수 있음 List를 이용할 수 있다는 것을 보여주기 위한 코드
					ArrayList<String> delFileList = new ArrayList<String>();
					for(String delFileName : deleteFileName) {
						
						delFileList.add(delFileName);
					}
					faqdao.dbDelFileName(delFileList);
					for(String storedFname : deleteFileName) {
						storageDelFileName(storedFname);
					}
				}
			}
			faqdao.updateArticle(article);
			commonFileUpload(article.getArticleNum(),article.getFileNames());
		}
		
		else {
			if(fileCount!=0) {
				if(deleteFileName !=null) {
					if(fileCount==deleteFileName.length) {
						article.setFileStatus((byte)0);
					}
					faqdao.dbDelFileName1(deleteFileName);
					for(String storedFname : deleteFileName) {
						storageDelFileName(storedFname);
					}
				}
			}
			faqdao.updateArticle(article);
			
		}
		model.addAttribute("fileStatus",article.getFileStatus());
	}

	public void storageDelFileName(String storedFname) {
		if(storedFname !=null) {
			String formatName = storedFname.substring(storedFname.lastIndexOf(".")+1);
			MediaType mType = MediaUtils.getMediaType(formatName);
			if(mType !=null) {
				String front = storedFname.substring(0,12);
				String end = storedFname.substring(12);
				File file = new File(saveDir+(front+"s_"+end).replace('/', File.separatorChar));
				if(file.exists()) {
					file.delete();
				}
			}
			File file = new File(saveDir+storedFname);
			if(file.exists()) {
				file.delete();
			}
		}
	}
	
	@Override
	public void reply(FAQDto article,List<MultipartFile> mFile) {
		if(article.getFileNames()==null) {
			faqdao.reply(article);
		}
		
		else {
			article.setFileStatus((byte)1);
			faqdao.reply(article);
			commonFileUpload(article.getArticleNum(),article.getFileNames());
			//commonFileUpload(article.getArticleNum(),article.getFileNames());
		}
	}

	@Override
	public void content(String articleNum,int fileStatus, Model model) {
		FAQDto article=faqdao.content(articleNum);
		article.setCommentCount(faqdao.getCommentCount(articleNum));
		model.addAttribute("article",article);
		if(fileStatus==1)
			model.addAttribute("fileList",faqdao.getFiles(articleNum));
	}

	@Override
	public void write(FAQDto article) {
		// mRequest.getFiles("fname")가 업로드 된 파일이 없어도
		// 리턴되는 값인 List<MultipartFile>는 CommonsMultipartFile을 리턴함
		// 그래서 isEmpry()(List에 있는 isEmpty()메소드임)로 물어보면 List값이
		// 비어있는 것이 아님
		// MultipartFile에 있는 isEmpty()를 사용해야함
		
		if(article.getFileNames()==null) {
			faqdao.write(article);
		}
		else {
			article.setFileStatus((byte)1);
			faqdao.write(article);
			commonFileUpload(article.getArticleNum(),article.getFileNames());
		}
	}
	
	public void commonFileUpload(int articleNum, List<String> fileNames) {
		FileDto fileDto=null;
		
		for(String storedFname:fileNames) {
				fileDto = new FileDto();
				fileDto.setStoredFname(storedFname);
				fileDto.setArticleNum(articleNum);
				faqdao.insertFile(fileDto);
			}
		}
	

	@Override
	public FileSystemResource download(HttpServletResponse resp, String storedFname) {
		resp.setContentType("application/download");
		String originFname = storedFname.substring(storedFname.indexOf("_")+1);
		try {
			originFname = URLEncoder.encode(originFname,"utf-8").replace("+","%20").replace("%28", "(").replace("%29",")");
		}catch(Exception e) {
		}
		
		resp.setHeader("Content-Disposition", "attachment;" +" filename=\""+originFname+ "\";");
		FileSystemResource fsr= new FileSystemResource(saveDir+storedFname);
		return fsr;
	}
	
	
}