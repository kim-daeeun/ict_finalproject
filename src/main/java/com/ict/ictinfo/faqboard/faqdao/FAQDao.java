package com.ict.ictinfo.faqboard.faqdao;

import java.util.HashMap;
import java.util.List;


import com.ict.ictinfo.faqboard.faqdto.FAQDto;
import com.ict.ictinfo.faqboard.faqdto.FileDto;

public interface FAQDao {
	public List<FAQDto> list(HashMap<String, String> pagingMap);
	public void write(FAQDto article);
	public int getTotalCount();
	public FAQDto content(String articleNum);
	public void reply(FAQDto article);
	public void delete(String articleNum);
	public FAQDto getUpdateArticle(String articleNum);
	public void updateArticle(FAQDto article);
	public int getCommentCount(String articleNum);
	public void insertFile(FileDto fileDto);
	public List<String> getFiles(String articleNum);
	public List<String> getDeleteList(String articleNum);
	public void dbDelFileName(List<String> delFileList);
	public void dbDelFileName1(String[] deleteFileName);
	
	
	
}