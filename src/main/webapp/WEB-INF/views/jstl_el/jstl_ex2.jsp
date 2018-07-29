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





		<h2> * JSTL TEST2 *</h2>
		-- 제어문 : 조건 판단 --
		
		<br><hr><br>
		
		
		<c:set var="kbs" value="moon"/>
		<c:if test="${kbs == 'star'}">
			if 연습 : kbs 값은 <c:out value="${kbs}"/> <!-- KBS가 STAR라는 조건에 부합할 경우에 출력 -->
		</c:if>
		<br>
		
		<br><hr><br>
		
		
		<c:if test="${kbs eq 'moon'}">
		if 연습 : 아하 달이네  <!-- 13번 줄의 value 값에 달라서 출력 유무 결정 -->
		</c:if>
		
		<br><hr><br>
		
		<p>
		choose 문 사용(if ~else는 choose로 표현)<br>
		<c:choose>
			<c:when test="${kbs =='star'}">별</c:when>
			<c:when test="${kbs =='moon'}">달</c:when>
			<c:otherwise>어떤 조건도 아닐 경우 수행</c:otherwise>
		</c:choose>
		
		<br><hr><br>
		
		
		<c:choose>
			<c:when test="${empty param.name}">
				<form>
					이름 : <input type="text" name="name">
					<input type="submit" value="확인">
				</form>
			</c:when>
			<c:when test="${param.name == 'admin' }">
				관리자 작업
			</c:when>
			<c:when test="${param.name eq 'user' }">
				일반 사용자. 회원 <c:out value="${param.name}" />
			</c:when>
			<c:otherwise>
				기타 작업
			</c:otherwise>
		</c:choose>
		
		</p>
		

		
		
		
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

