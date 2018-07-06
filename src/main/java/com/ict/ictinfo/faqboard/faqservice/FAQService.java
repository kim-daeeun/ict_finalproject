package com.ict.ictinfo.faqboard.faqservice;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.core.io.FileSystemResource;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;


import com.ict.ictinfo.faqboard.faqdto.FAQDto;

public interface FAQService {
	public void list(String pageNum, Model model);
	public void write(FAQDto article);
	public void content(String articleNum,int fileStatus,Model model);
	public void reply(FAQDto article,List<MultipartFile> mFile);
	public void delete(String articleNum);
	public void getUpdateArticle(String articleNum,int fileStatus,Model model);
	public void updateArticle(FAQDto article,String[] deleteFileName, Model model, int fileCount);
	public FileSystemResource download(HttpServletResponse resp,String storedFname);
	
}
