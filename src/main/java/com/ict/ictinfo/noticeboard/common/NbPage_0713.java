package com.ict.ictinfo.noticeboard.common;



import java.util.HashMap;

import org.springframework.stereotype.Component;

@Component
public class NbPage_0713 {
	private int startRow, endRow;
	private StringBuffer sb;
	
	public synchronized HashMap<String,String> paging(int pageNum, int totalCount, int pageSize, int pageBlock){
		
		HashMap<String, String> pagingMap= new HashMap<String, String>();
		int totalPage = (int) Math.ceil((double)totalCount/pageSize);
		
		startRow = (pageNum - 1) * pageSize+1;
		endRow = pageNum * pageSize;
		
		pagingMap.put("startRow", String.valueOf(startRow));	// 문자로 변경
		pagingMap.put("endRow", String.valueOf(endRow));
		
		int startPage = (int)((pageNum-1)/pageBlock)*pageBlock + 1;
		int endPage = startPage + pageBlock - 1;
				
		if(endPage > totalPage) {	// endpage가 10개이고 totalpage가 8개 일때 
			endPage = totalPage;
		}			

		sb = new StringBuffer();
		if(startPage < pageBlock) {
			sb.append("<img src='img/img_noticeboard/hot.png' width='30' height='9'>");			
		} else {
			sb.append("<img src='img/img_noticeboard/hot.png' width='30' height='9'");
			sb.append(" onclick='location.href=\"nbList.ict?pageNum=");		// \" 개행문자.. "를 찍으라는 의미
			sb.append(startPage - pageBlock);
			sb.append("\"' style='cursor:pointer'> ");	// \" 를 찍으라는 의미
		}
		
		sb.append("&nbsp;&nbsp;|");
		for(int i = startPage; i <= endPage; i++) {		
			if(i == pageNum) {	// 자기 페이지 이면
				sb.append("&nbsp;&nbsp;<b><font color='#91B7EF'>");	// 컬러 변경
				sb.append(i);
				sb.append("</font></b>");
			} else {
				sb.append("&nbsp;&nbsp;<a href='nbList.ict?pageNum=");
				sb.append(i);
				sb.append("'>");
				sb.append(i);
				sb.append("</a>");
			}
		}
		
		sb.append("&nbsp;&nbsp;|");		
		if(endPage < totalPage) {
			sb.append("<img src='img/img_noticeboard/hot.png' width='30' height='9'");
			sb.append(" onclick='location.href=\"nbList.ict?pageNum=");
			sb.append(startPage + pageBlock);
			sb.append("\"' style='cursor:pointer'> ");						
		} else {
			sb.append("<img src='img/img_noticeboard/hot.png' width='30' height='9'>");			
		}	
		
		pagingMap.put("pageCode", sb.toString());
		return pagingMap;
	}	

}
