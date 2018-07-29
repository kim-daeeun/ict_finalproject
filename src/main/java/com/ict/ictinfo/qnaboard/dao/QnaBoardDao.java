package com.ict.ictinfo.qnaboard.dao;

import java.util.HashMap;
import java.util.List;

import com.ict.ictinfo.qnaboard.dto.QnaBoardDto;
import com.ict.ictinfo.qnaboard.dto.QnaFileDto;

public interface QnaBoardDao {

	public void qnaWrite(QnaBoardDto qnaArticle);

	public int getTotalCount();
	
	public List<QnaBoardDto> qnaList(HashMap<String, String> pagingMap);

	public QnaBoardDto qnaContent(String articleNum);
	
	public void updateHit(String articleNum);

	public int getQnacommentCount(String articleNum);

	public List<QnaFileDto> getQnacontentFiles(String articleNum);

	public void insertQnaFile(QnaFileDto qnaFile);

	public void qnaReply(QnaBoardDto qnaArticle);

	public QnaBoardDto qnaUpdate(String articleNum);

	public void qnaUpdates(QnaBoardDto qnaArticle);

	public void qnaDelete(String articleNum);
	
	public List<String> getFiles(String articleNum);
	
	public String getStoredFname(String fileNum);

	public List<String> getDeleteList(String articleNum);

	public void dbDelFileList(List<String> delFileList);

	public void dbDelFileName(String[] deleteFileName);





}
