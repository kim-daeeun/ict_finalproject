package com.ict.ictinfo.qnaboard.service;

import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.core.io.FileSystemResource;
import org.springframework.ui.Model;

import com.ict.ictinfo.qnaboard.dto.QnaBoardDto;

public interface QnaBoardService {
	
	public void qnaWrite(QnaBoardDto qnaArticle);

	public void qnaList(String pageNum, Model model);

	public void qnaContent(String articleNum, int fileStatus, Model model);
	
	public void commonFileUpload(int articleNum, List<String> fileNames);

	public void qnaReply(QnaBoardDto qnaArticle);

	public void qnaUpdate(String articleNum, int fileStatus, Model model);

	public void qnaUpdates(QnaBoardDto qnaArticle, String[] deleteFileName, Model model, int fileCount);

	public void qnaDelete(String articleNum);

	public FileSystemResource qnaDownload(HttpServletResponse resp,String fileNum);

}
