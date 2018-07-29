<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page import="java.util.Date"%>

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

<%-- 새로 추가할 CDN 입력하는 부분 시작 --%>
	<!-- 예 : <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script> -->
<%-- 새로 추가할 CDN 입력하는 부분 끝--%>



<%-- head.jsp --%>
<%@include file="./../include/main_css.jsp"%>


<!-- 여기 아래에 CSS 코딩을 하세요 -->
<style>

/*=======================
	기본 틀 설정 부분
=========================*/

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
	여기 아래에 CSS 코딩
=========================*/


</style>
</head>
<body>

<%-- main_header.jsp --%>
<%@include file="./../include/main_header.jsp"%>

<div class="container_body">
<h2 style="text-align:center">관리자 페이지</h2>		 



<div class="row">		<!-- 첫번째 row 의  시작 -->
<div class="col-md-1">
</div>
<div class="col-md-10">
<div class="col-md-12 text-center">




		  <div class="btn-group">
		    <button type="button" class="btn btn-primary">가</button>
		    <button type="button" class="btn btn-primary">나</button>
		    <button type="button" class="btn btn-primary">다</button>
		    <button type="button" class="btn btn-primary">라</button>
		    <div class="btn-group">
		      <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
		     		 마 <span class="caret"></span></button>
		      <ul class="dropdown-menu" role="menu">
		        <li><a href="#">하위메뉴1</a></li>
		        <li><a href="#">하위메뉴2</a></li>
		        <li><a href="#">하위메뉴3</a></li>
		      </ul>
		    </div>
		  </div>





	<h2>** 문자열 분할 JSTL TEST ** </h2>
	
	<c:forTokens var="ani" items="horse,tiger,lion" delims=",">
		동물: <c:out value="${ani}"/><br>
	</c:forTokens>
	<p/>
	
	<br><hr><br>
	
	--- 숫자 및 날짜 서식 ---
	<%@ taglib prefix ="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %><br>
	숫자 : <fmt:formatNumber value="98745612345.67867" type="number"/><br> 
			<!-- 결과 : 숫자 : 98,745,612,345.679 3자리에서 반올림됨-->
	통화 : <fmt:formatNumber value="12345.789" type="currency" currencySymbol="$"/><br>
			<!-- 결과 : 통화 : $12,345 -->
	숫자 : <fmt:formatNumber value="12345.456" pattern="#,##0.0"/><br>
			<!-- 결과 : 숫자 : 12,345.4 -->
	
	<br><hr><br>
	
	<c:set var="kor" value="77" />
	<c:set var="eng" value="88" />
	<c:set var="mat" value="91" />
	다 합해서 나누기 3 : <fmt:formatNumber value="${(kor + eng + mat) / 3}" pattern="##0.0"/>
	
	<br><hr><br>
	
	<c:set var="now" value="<%=new Date() %>" />
	${now}
	<br>
	날짜 : <fmt:formatDate value="${now}" type="date"/><br>
		<!-- 2018. 7. 28 -->
	시간 : <fmt:formatDate value="${now}" type="time"/><br>
		<!-- 오후 3:12:44 -->
	날짜 : <fmt:formatDate value="${now}" type="both" dateStyle="full"/>
		<!-- 2018년 7월 28일 토요일 오후 3:12:44 -->


		
		
		
</div><!-- col-md-10의 끝 -->
</div><!-- col-md-12의 끝 -->	  
<div class="col-md-1">
</div>		  
</div> <!-- 첫번째 row의 끝 -->
</div> <!-- container_body 끝-->	

<%-- main_footer.jsp --%>
<%@include file="./../include/main_footer.jsp"%>

<%-- plugin_js.jsp --%>
<%@include file="./../include/main_js.jsp"%>

<!-- 여기 아래에 JavaScript 코딩을 작성하세요!!! -->
<script>

	

</script>


</body>
</html>

