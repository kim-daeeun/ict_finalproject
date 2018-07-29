<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@page import="java.util.Date"%>
<%@page import="java.util.HashMap"%>

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





<h2> 제어문, 반복문 JSTL TEST</h2>
forEach 연습 결과
<c:forEach var="i" begin="1" end="10" step="1"> <!-- 증가치가 1일 경우 생략 -->
	<c:out value="${i}" /> &nbsp;&nbsp;
</c:forEach>
		<br><hr><br>
		
		
문제 ) 구구단 3단 출력
<c:forEach var="i" begin="1" end="9" step="1">
	3 * ${i} = ${3 * i}<br> 
</c:forEach>
<p/>
forEach 결과 (header:내장객체(k,v)):<br>
<c:forEach var="h" items="${headerValues}"> <!-- 헤더값을 찍음 -->
	속성 : <c:out value="${h.key}" /> &nbsp;&nbsp;
	값 : <c:forEach var="k" items="${h.value }">
		<c:out value="${k}"/>
		</c:forEach>
		<hr>
</c:forEach>
		<br><hr><br>
		

<c:set var="arr" value="<%= new int[]{1,2,3,4,5} %>"/>
배열 출력 <br>
<c:forEach var="i" items="${arr}" begin="0" end="5" step="1">
${i} &nbsp;&nbsp;
</c:forEach>
		<br><hr><br>
		

<%
	HashMap map = new HashMap();
	map.put("name", "홍길동");
	map.put("today", new Date());
%>
<c:set var="m" value="<%=map %>"/>		
map 출력<br>
<c:forEach var="i" items="${m}">
	${i.key}:${i.value}<br>
</c:forEach>


		
		
		
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

