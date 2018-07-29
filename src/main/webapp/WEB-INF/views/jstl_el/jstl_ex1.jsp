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
	font-size: 18px;
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
<h2 style="text-align:center">테스트 페이지</h2>		 



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





		<h2>* JSTL TEST *</h2>
		--- 변수 선언 ---<br>
		<c:set var="ir" value="홍길동" scope="page"/> <!--  자바 객체는 value에 다 들어올 수 있음 / request,page,session,application -->
		<c:out value="${ir}"/><br>
		\${ir} ==> ${ir}
		
		<br><hr>
		
		<c:set var="ir2" scope="session">
			한국인
		</c:set>
		<c:out value="${ir2}"/>
		<br><hr>
		
		
		<c:set var="aa" value="${header['User-Agent']}" scope="page"/>
			USER-AGENT 값은 : <c:out value="${aa}"/>
		<br>
		
		<c:remove var="aa" scope="page"/> <!-- remove는 삭제한다는 의미 -->
			aa 삭제 후 값은 >>[ <c:out value="${aa}"/> ] >> 변수값이 삭제됨
		<br><hr>
		
		<c:set var="su1" value="10"/>
		<c:set var="su2" value="${20}"/>
		<c:set var="su3">
			30.5
		</c:set>
			합은 ${su1 + su2 + su3}<br>
		

		
		
		
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

