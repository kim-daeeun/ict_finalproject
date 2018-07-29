package com.ict.ictinfo.noticeboard.common;

/*
★ pageNum >>>>> 1			// 현재 게시판 하단에 선택된 페이지 숫자(변함)
★ totalCount >>>>> 12		// 게시판 리스트 총 갯수(변함)
★ pageSize >>>>> 10			// 게시판 상단에 보여준 리스트 갯수(불변)
★ pageBlock >>>>> 10		// 10씩 증가함.. 10개의 묶음이 1개의 Block(변함)
★ totalPage >>>>> 2			// 게시물이 10개, 2개해서 총 2페이지를 나타냄(변함)
★ startRow >>>>> 1			// 현재 게시판 상단에 11번째 게시목록부터 보여주고 있다(변함)
★ endRow >>>>> 10			// 현재 게시판 상단에 20번째 게시목록까지 보여주고 있다(변함)
★ startPage >>>>> 1			// 현재 게시판 하단에 보여지고 있는 넘버 처음 숫자(불변)
★ endPage >>>>> 10			// 현재 게시판 하단에 보여지고 있는 넘버 마지막 숫자(불변)
*/



import java.util.HashMap;

import org.springframework.stereotype.Component;

@Component
public class NbPage {
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
		
		// endpage가 10개이고 totalpage가 8개 일때, 하단에 10개 지정했는데 10 페이지가 안된다면
		if(endPage > totalPage) {	 
			endPage = totalPage;
		}			
		
		// 10보다 작은 숫자의 페이지를 선택했을때, 아닐때
		// 게시판 하단의 << 를 설정하는 부분. <<를 클릭하면 startPage가 10씩 작아지면서 뿌려줌 
		sb = new StringBuffer();
		
		if(startPage < pageBlock) {
			sb.append("<a>&laquo;</a>");
		} else {
			sb.append("<a href='nbList.ict?pageNum=");
			sb.append(startPage + pageBlock);
			sb.append("\"' style='cursor:pointer'> ");
			sb.append("&laquo;");
			sb.append("</a>");				
		}
		
		// 게시판 하단의 블럭에서 페이지 숫자를 클릭하면
		// 선택된 숫자  css 주기
		for(int i = startPage; i <= endPage; i++) {		
			if(i == pageNum) {	// 자기 페이지 이면
				sb.append("<a class=\"active\">");	// 컬러 변경
				sb.append(i);
				sb.append("</a>");
			} else {
				sb.append("<a href='nbList.ict?pageNum=");
				sb.append(i);
				sb.append("'>");
				sb.append(i);		// 숫자 적어 주기
				sb.append("</a>");
			}
		}
		
		// 게시물의 페이지가 10개가 넘는 다면
		// 게시판 하단의 >> 를 설정하는 부분. >>를 클릭하면 startPage가 10씩 더해주면서 뿌려줌
		if(endPage < totalPage) {
			sb.append("<a href='nbList.ict?pageNum=");
			sb.append(startPage + pageBlock);
			sb.append("\"' style='cursor:pointer'> ");
			sb.append("&raquo;");
			sb.append("</a>");
			
		} else {
			sb.append("<a>&raquo;</a>");			
		}	
		
		pagingMap.put("pageCode", sb.toString());
		return pagingMap;
	}	

}
