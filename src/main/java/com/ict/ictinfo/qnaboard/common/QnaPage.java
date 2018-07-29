package com.ict.ictinfo.qnaboard.common;

import java.util.HashMap;

import org.springframework.stereotype.Component;

@Component
public class QnaPage {
	
	private int startRow, endRow;
	
	private StringBuffer sb;
	
	public synchronized HashMap<String,String> paging(String pageNum,int totalCount,int pageSize,int pageBlock) {
		int pagingNum=Integer.parseInt(pageNum);
		HashMap<String,String> pagingMap = new HashMap<String, String>();
		int totalPage = (int) Math.ceil((double)totalCount/pageSize);
		startRow = (pagingNum-1)*pageSize +1;
		endRow = pagingNum*pageSize;
		pagingMap.put("startRow",String.valueOf(startRow));
		pagingMap.put("endRow", String.valueOf(endRow));
		
		int startPage = (int) ((pagingNum-1)/pageBlock)*pageBlock +1;
		int endPage = startPage + pageBlock -1;
		
		if(endPage > totalPage) {
			endPage = totalPage;
		}
		
		sb = new StringBuffer();
		if(startPage < pageBlock) {
			sb.append("<img src='img/img_qnaboard/bg12.gif' width='30' height='9'>");			
		} else {
			sb.append("<img src='img/img_qnaboard/bg12.gif' width='30' height='9'");
			sb.append(" onclick='location.href=\"qnaBoard.ict?pageNum=");
			sb.append(startPage - pageBlock);
			sb.append("\"' style='cursor:pointer'> ");
		}
		
		sb.append("&nbsp;&nbsp;|");
		for(int i = startPage; i <= endPage; i++) {		
			if(i == pagingNum) {
				sb.append("&nbsp;&nbsp;<b><font color='#91B7EF'>");
				sb.append(i);
				sb.append("</font></b>");
			} else {
				sb.append("&nbsp;&nbsp;<a href='/ictinfo/qnaBoard.ict?pageNum=");
				sb.append(i);
				sb.append("'>");
				sb.append(i);
				sb.append("</a>");
			}
		}

		sb.append("&nbsp;&nbsp;|");		
		if(endPage < totalPage) {
			sb.append("<img src='img/img_qnaboard/bg12.gif' width='30' height='9'");
			sb.append(" onclick='location.href=\"qnaBoard.ict?pageNum=");
			sb.append(startPage + pageBlock);
			sb.append("\"' style='cursor:pointer'> ");						
		} else {
			sb.append("<img src='img/img_qnaboard/bg12.gif' width='30' height='9'>");			
		}	
		
		pagingMap.put("pageCode", sb.toString());
		return pagingMap;
	}
}
