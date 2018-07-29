package com.ict.ictinfo.qnaboard.service;

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

import com.ict.ictinfo.qnaboard.common.MediaUtils;
import com.ict.ictinfo.qnaboard.common.Page;
import com.ict.ictinfo.qnaboard.dao.QnaBoardDao;
import com.ict.ictinfo.qnaboard.dto.QnaBoardDto;
import com.ict.ictinfo.qnaboard.dto.QnaFileDto;

@Service
public class QnaBoardServiceImpl implements QnaBoardService {
	
	@Autowired
	private QnaBoardDao qnaboarddao;
	
	@Resource(name="saveDir")
	String saveDir;
	
	@Autowired
	private Page page;
	
	@Resource(name="pageSize")
	private int pageSize;
	
	@Resource(name="pageBlock")
	private int pageBlock;

	@Override
	public void qnaWrite(QnaBoardDto qnaArticle) {

		if(qnaArticle.getFileNames()==null) {
			qnaArticle.setFileStatus((byte)0);
			qnaboarddao.qnaWrite(qnaArticle);
		}
		else {
			qnaArticle.setFileStatus((byte)1);
			qnaboarddao.qnaWrite(qnaArticle);
			commonFileUpload(qnaArticle.getArticleNum(),qnaArticle.getFileNames());
		}

	}

	@Override
	public void qnaList(String pageNum, Model model) {

			int totalCount=qnaboarddao.getTotalCount();
			
			HashMap<String, String> pagingMap= 
			page.paging(pageNum, totalCount, pageSize, pageBlock);
			model.addAttribute("pageCode", pagingMap.get("pageCode"));
			model.addAttribute("articleList", qnaboarddao.qnaList(pagingMap));
			model.addAttribute("totalCount", totalCount);		
		
	}

	@Override
	public void qnaContent(String articleNum, int fileStatus, Model model) {
		
		qnaboarddao.updateHit(articleNum);
		QnaBoardDto qnaArticle = qnaboarddao.qnaContent(articleNum);
			qnaArticle.setCommentCount(qnaboarddao.getQnacommentCount(articleNum));
			model.addAttribute("qnaArticle",qnaArticle);
			if(fileStatus==1)
				model.addAttribute("fileList",qnaboarddao.getQnacontentFiles(articleNum));
		
		
	}
	
	@Override
	public void qnaReply(QnaBoardDto qnaArticle) {

		if(qnaArticle.getFileNames()==null) {
			qnaArticle.setFileStatus((byte)0);
			qnaboarddao.qnaReply(qnaArticle);
		}
		else {
			qnaArticle.setFileStatus((byte)1);
			qnaboarddao.qnaReply(qnaArticle);
			commonFileUpload(qnaArticle.getArticleNum(),qnaArticle.getFileNames());
		}	
		
	}
	
	@Override
	public void qnaUpdate(String articleNum, int fileStatus, Model model) {
		
			model.addAttribute("qnaArticle", qnaboarddao.qnaUpdate(articleNum));
			if(fileStatus==1) {
				List<String> fileList = qnaboarddao.getFiles(articleNum);
				model.addAttribute("fileList", fileList);
				model.addAttribute("fileCount", fileList.size());
			}

			else {
				model.addAttribute("fileCount", 0);
			
			}
			
	}

	@Override
	public void qnaUpdates(QnaBoardDto qnaArticle, String[] deleteFileName, Model model,
			int fileCount) {
		
		if(qnaArticle.getFileNames()!=null) {
			if(fileCount==0) {
				qnaArticle.setFileStatus((byte)1);
			}
			
			else {
				if(deleteFileName !=null) {
					//Mybatis 매퍼 파일이 List를 받을수 있음(배열도 가능함)
					//List를 이용할수 있다는걸 보여주기 위해서 만든 코드임
					ArrayList<String> delFileList = new ArrayList<String>();
					for(String delFileName : deleteFileName) {
						
						delFileList.add(delFileName);
					}
					qnaboarddao.dbDelFileList(delFileList);
					for(String storedFname : deleteFileName) {
						storageDelFileName(storedFname,saveDir);
					}
				}
			}
			qnaboarddao.qnaUpdates(qnaArticle);
			commonFileUpload(qnaArticle.getArticleNum(),qnaArticle.getFileNames());
		}
		
		else {
			if(fileCount!=0) {
				if(deleteFileName !=null) {
					if(fileCount==deleteFileName.length) {
						qnaArticle.setFileStatus((byte)0);
					}
					qnaboarddao.dbDelFileName(deleteFileName);
					for(String storedFname : deleteFileName) {
						storageDelFileName(storedFname,saveDir);
					}
				}
			}
			qnaboarddao.qnaUpdates(qnaArticle);
			
		}
		model.addAttribute("fileStatus",qnaArticle.getFileStatus());
	
	}
	
	@Override
	public void qnaDelete(String articleNum) {
		
		List<String> deleteList=qnaboarddao.getDeleteList(articleNum);
		  for(String storedFname : deleteList) {
			  String formatName=storedFname.substring(storedFname.lastIndexOf(".")+1);      
				MediaType mType = MediaUtils.getMediaType(formatName);      
				if(mType != null){        
					String front =storedFname.substring(0,12);
					String end = storedFname.substring(14);
					new File(saveDir + (front+end).replace('/', File.separatorChar)).delete();
				}
		      File deleteFname = new File(saveDir+storedFname);
		      if(deleteFname.exists()) {
		       deleteFname.delete();
		      }
		  }
		
		qnaboarddao.qnaDelete(articleNum);
		
	}
	
	@Override
	public FileSystemResource qnaDownload(HttpServletResponse resp, String fileNum) {
		
		resp.setContentType("application/download");
		String storedFname = qnaboarddao.getStoredFname(fileNum);
		String originFname= storedFname.substring(storedFname.indexOf("_")+1);
		try{
			originFname = URLEncoder.encode(originFname,"UTF-8").replace("+","%20").replace("%28", "(").replace("%29", ")");
		}catch(Exception e){
		
		}

		resp.setHeader("Content-Disposition", "attachment;" +" filename=\""+originFname+ "\";");
		FileSystemResource fsr= new FileSystemResource(saveDir+storedFname);
		return fsr;
	}
	
	public void commonFileUpload(int articleNum, List<String> fileNames) {
		QnaFileDto qnaFile=null;
		
		for(String storedFname:fileNames) {
			qnaFile = new QnaFileDto();
			qnaFile.setStoredFname(storedFname);
			qnaFile.setArticleNum(articleNum);
			qnaboarddao.insertQnaFile(qnaFile);
		}
	}
	
	public void storageDelFileName(String storedFname, String saveDir) {
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

}
