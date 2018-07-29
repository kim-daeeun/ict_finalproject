package com.ict.ictinfo.noticeboard.dao;

import java.util.HashMap;
import java.util.List;

import com.ict.ictinfo.bizinfo.dto.BizInfoDto;
import com.ict.ictinfo.bizinfo.dto.GetBizDto;
import com.ict.ictinfo.main.dto.MainDto;
import com.ict.ictinfo.noticeboard.dto.NbFileDto;
import com.ict.ictinfo.noticeboard.dto.NbDto;

public interface NbDao {

	public int getTotalCount();
	public int getCommentCount(String articleNum);
	public List<NbDto> list(HashMap<String, String> pagingMap);
	
	public void write(NbDto article);
	public void insertFile(NbFileDto fileDto);
	public String getNextArticleNum();
	
	public NbDto content(String articleNum);
	public void updateHit(String articleNum);
	public List<String> getFiles(String articleNum);
	
	public void delete(String articleNum);
	public List<String> getDeleteList(String articleNum);
	
	public NbDto getUpdateArticle(String articleNum);
	public void updateArticle(NbDto article);	
	public void dbDelFileName(List<String> delFileList);
	public void dbDelFileName1(String[] deleteFileName);
	
	
	public void reply(NbDto article);
	
	public List<NbDto> nbSearch(HashMap<String, String> pagingMap);
	public int getTotalCountNbSearch(HashMap<String, String> pagingMap);
	


	


	
	
}
