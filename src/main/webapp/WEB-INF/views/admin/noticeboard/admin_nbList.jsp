<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<!-- 타이틀 꼭 수정하세요 -->
<title>View Page</title>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>   
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

<%-- 새로 추가할 CDN 입력하는 부분 시작 --%>
	<!-- 예 : <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script> -->
<%-- 새로 추가할 CDN 입력하는 부분 끝--%>



<%-- head.jsp --%>
<%@include file="./../../include/main_css.jsp"%>


<!-- 여기 아래에 CSS 코딩을 하세요 -->
<style>

/*======================
	기본 틀 설정 부분
=======================*/
body{
	min-height:1080px;
}

.container_body{
	margin : 0px auto;	
}

h2 {
	margin:50px 0px;
	text-align: center;
}

/*=======================
	사이드 메뉴 설정 부분
=========================*/

.sidenav {
    height: 50%;
    width: 0;
    position: fixed;
    z-index: 1;
    top: 50;
    left: 0;
    background-color: #111;
    overflow-x: hidden;
    transition: 0.5s;
    padding-top: 50px;	/* 메뉴닫기와 메뉴의 간격 조절 */
}

.sidenav a {
    padding: 10px 10px 10px 30px;
    text-decoration: none;
    font-size: 18px;
    color: #818181;
    display: block;
    transition: 0.3s;

}

.sidenav a:hover {
    color: #f1f1f1;
}


.sidenav .closebtn {
    position: absolute;
    top: 0;
    right: 25px;
    font-size: 40px;
    margin-left: 50px;

}



#main {
    transition: margin-left .5s;
    padding: 0px;
}

#myFooter {
    transition: margin-left .5s;
    padding: 0px;
}

@media screen and (max-height: 450px) {
  .sidenav {padding-top: 15px;}
  .sidenav a {font-size: 18px;}
}


/*=======================
	메뉴보기 클릭시 부드러운 사라짐
=========================*/

#colmd12-MoveRight{
    transition: margin-left .5s;
}

h4 {
	margin:0px;
	text-align:center;
}
/*============================
	게시판 검색, 글쓰기 디자인 시작
==============================*/

#form1{
	text-align:left;
}



/*============================
	게시판 테이블 디자인 시작
==============================*/
#table01{
	margin:10px auto;
	text-align:center;
	font-size:15px;
	line-height: 1.5em;
}

.articleNum{
	width:50px;
}

.titlelist{
	width:250px;
	text-align:left;
}

#titleList{
	width:250px;
	text-align:center;
}

.writeName{
	width:100px;
}

.writeDate{
	width:150px;
}

.clickfreq{
	width:50px;
}

#table01 tr td{
	border-bottom: 1px solid #ddd;
}

/*============================
	게시판 하단 페이지 블럭 디자인 시작
==============================*/
.pagecode a {
    color: black;
    padding: 8px 16px;
    text-decoration: none;
    border: 1px solid #ddd;
    font-size: 15px;
}

.pagecode a.active {
    background-color: #4CAF50;
    color: white;
    border: 1px solid #4CAF50;
    font:bold;
}

.pagecode a:hover:not(.active) {
	background-color: #ddd;
}

.pagecode a:first-child {
    border-top-left-radius: 5px;
    border-bottom-left-radius: 5px;
}

.pagecode a:last-child {
    border-top-right-radius: 5px;
    border-bottom-right-radius: 5px;
}





</style>
</head>
<body>

<%-- main_header.jsp --%>
<%@include file="./../../include/main_header.jsp"%>

<div class="container_body">
<h2 style="text-align:center">관리자 페이지</h2>		 

<div class="row">		<!-- 첫번째 row 의  시작 -->
<div class="col-md-1">
</div>





<div class="col-md-10">
<div class="col-md-12 text-center" id="colmd12-MoveRight">
		<div id="mySidenav" class="sidenav">
		  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
		  <a href="#">광주지역기업</a>
		  <a href="#">전남지역기업</a>
		  <a href="#">공공기관</a>
		  <a href="#">부가정보</a>
		  <a href="#">커뮤니티</a>
		</div>
		
		<div id="main" class="main text-left">
		  <span style="font-size:20px;cursor:pointer" onclick="openNav()">&#9776; 관리자 전체 메뉴보기</span>
		</div>
		
		
		<h2 style="text-align:center"> 공지사항 </h2>
		<h4> 글목록(전체 글:${totalCount}) </h4>
	
		<!-- 삭제 할 목록 선택 버튼 -->
		<input type="button" value="전체선택" id="mAllCheck" onclick="mAllCheck()" />
		<input type="button" value="전체해제" id="mAllUncheck" onclick="mAllUncheck()" />
		<input type="button" value="선택삭제" id="mChkDelete" onclick="mChkDelete()" />	


		<form class="form-inline" role="form" id="form1" action="/ictinfo/nbSearch.ict?pageNum=${pageNum}" method="post">
		    <div class="input-group">	<!-- input-group 엘리먼트가 딱 붙게 해준다. form-control이 필요함 -->
		        <div class="form-group">
		            <select class="form-control" name="searchOption">
			            <!-- 검색조건을 검색처리후 결과화면에 보여주기위해  c:out 출력태그 사용, 삼항연산자 -->
			            <option value="all" <c:out value="${searchOption == 'all'?'selected':''}"/> >제목+작성자+내용</option>
			            <option value="title" <c:out value="${searchOption == 'title'?'selected':''}"/> >제목</option>
			            <option value="id" <c:out value="${searchOption == 'id'?'selected':''}"/> >작성자</option>
			            <option value="content" <c:out value="${searchOption == 'content'?'selected':''}"/> >내용</option>
		            </select>           
		            <input class="form-control" name="keyword" value="${keyword}" placeholder="Search"> 
		            <input type="submit" value="검색" class="btn btn-danger form-control">				                      
		        </div>				    	
		    </div>
		    <input type="button" class="btn btn-primary form-control pull-right" onclick="document.location.href='/ictinfo/nbWrite.ict'" id="writebtn" value="글쓰기">
		</form>	
			

		
		
		<table id="table01" class="table table-hover"> 	
	    <tr> 
	      <td>선택 </td>		<!-- 삭제를 위해서 체크박스 만들기 -->
	      <td class="articleNum">번 호</td> 
	      <td id="titleList">제   목</td> 
	      <td class="writeName">작성자</td>
	      <td class="writeDate">작성일</td> 
	      <td class="clickfreq">조 회</td>          
	    </tr>
	    
		<c:forEach var="article" items="${articleList}">
		   <tr>
		    
			<!-- 선택 체크 버튼 -->
		    <td align="center"  width="30" >
			  	<input type="checkbox" name="msgChkBox" value="${article.articleNum}" />	
			  	<input type="hidden" name="messageNumChk" value="${article.articleNum}" />
			</td>		    
		    
		    
		    <!-- 글번호 -->
		    <td class="articleNum" align="center"  width="50" >
			  <c:out value="${article.articleNum}"/>	   
			</td>
			
			
			
			<!-- 제목 시작, depth는 답글 유무 체크 -->
		    <td class="titlelist">
		      
			      <c:if test="${article.depth > 0}">
			      	<c:forEach var="index" begin="1" end="${article.depth}" step="1">
			      		&nbsp;&nbsp;&nbsp;
			      	</c:forEach>
				  	<%-- <img src="img/img_noticeboard/icon_reply.gif" width="${10 * article.depth}"  height="16"> --%>
				  	<!-- <img src="img/img_noticeboard/icon_reply.gif" height="16"> -->
				  	<!-- 구글 아이콘을 링크 걸어야 나옴 -->
				  	<i class="material-icons" style="font-size:16px;color:red">subdirectory_arrow_right</i>
				    <img src="img/img_noticeboard/icon_new.gif" width="10" height="16">
				  </c:if>
				  
				  
				  
				  <c:if test="${article.depth == 0}">
				    <img src="img/img_noticeboard/icon_reply.gif" width="0"  height="16">
				  </c:if>
				  
				  
				           
			      <a href="nbContent.ict?articleNum=${article.articleNum}&pageNum=${pageNum}&fileStatus=${article.fileStatus}">
			          ${article.title}
						<c:if test="${article.commentCount!=0 }">
							<span id="commentNumber">[${article.commentCount}]</span>
						</c:if>
			          
						<c:if test="${article.fileStatus!=0 }">
							<img src="img/img_noticeboard/icon_file.gif" width="10" height="10">
						</c:if>
			      </a> 
			          <c:if test="${article.hit >= 20}">
			            <img src="img/img_noticeboard/icon_hot.gif" border="0" height="16">
					  </c:if>
				  
			</td>
			<!-- 제목 끝 -->
			
			
			
			
			<!-- 작성자 -->
		    <td class="writeName">${article.id}</td>
		    
		    <!-- 작성일 -->
		    <td class="writeDate">${article.writeDate}</td>
		    
		    <!-- 조회 -->
		    <td class="clickfreq">${article.hit}</td>
		    
		  </tr>
		  </c:forEach>
		  
	</table>
	<br>
	<div class="pagecode">${pageCode} </div>
		








	
	
	

</div><!-- col-md-10의 끝 -->
</div><!-- col-md-12의 끝 -->

		  
<div class="col-md-1">
</div>	
	
	
	
	  
</div>				<!-- 첫번째 row 의 끝 -->
<br>







</div> <!-- container_body 끝-->	


<br><br><br><br><br><br><br><br>
<br><br><br><br><br><br><br><br>
<br><br><br><br><br><br><br><br>


<div id="myFooter">		
	<%-- main_footer.jsp --%>
	<%@include file="./../../include/main_footer.jsp"%>
</div>

<%-- plugin_js.jsp --%>
<%@include file="./../../include/main_js.jsp"%>

<!-- 여기 아래에 JavaScript 코딩을 작성하세요!!! -->
<script>
/*=======================
	관리자 메뉴 보이기 숨기기
=========================*/
 
 function openNav() {
    document.getElementById("mySidenav").style.width = "250px";
    document.getElementById("colmd12-MoveRight").style.marginLeft = "250px";

}

function closeNav() {
    document.getElementById("mySidenav").style.width = "0";
    document.getElementById("colmd12-MoveRight").style.marginLeft= "0";

}
 
/*=======================
	삭제할 글 선택, 해제, 삭제
=========================*/ 
  	// 전체 선택하기
	$("#mAllCheck").click(function(){
		$("input[type=checkbox]").prop("checked",true);			
	});
	  
  	// 전체 선택 해제하기
	$("#mAllUncheck").click(function(){
		$("input[type=checkbox]").prop("checked",false);
	});	  	
  	
  	
  	// 선택된 항목 삭제하기
	$('#mChkDelete').click(function(){
		let checkboxValues=[];
		$("input[name=msgChkBox]:checked").each(function(i) {
	        checkboxValues.push($(this).val());
			alert(checkboxValues);
		});				

		$.ajaxSettings.traditional = true;				// 배열이 직열화 하는 방법이다(컨트롤러가 받는 방법이 달라진다)
		$.ajax({
			 url:"/ictinfo/articleListDelete.ict",
			 type:"post",
			 data: {
				 checkboxValues: checkboxValues,
				 messageCount:"${totalCount}"					 
			 },						// 뒤 files 는 배열이다
			 dataType:"json",		  
			 success:function(result){

			   		alert("삭제성공");
			   		window.location.reload();

			 }
		});			 
	});	
 
</script>


</body>
</html>

