package com.ict.ictinfo.noticeboard.service;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.core.io.FileSystemResource;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.ict.ictinfo.noticeboard.dto.NbDto;

public interface NbService {

	public void list(String pageNum, Model model);  
	public void write(NbDto article);
	public void content(String articleNum, int fileStatus, Model model);
	public void delete(String articleNum);
	
	public void reply(NbDto article);
	public FileSystemResource download(HttpServletResponse resp, @RequestParam String storedFname);
	public void getUpdateArticle(String articleNum,Model model,int fileStatus);
	public void updateArticle(NbDto article,String[]deleteFileName,Model model,int fileCount);
	
	public void nbSearch(String searchOption, String keyword, String pageNum, Model model);



}
