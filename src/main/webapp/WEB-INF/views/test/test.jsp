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
	font-size:18px;
}

.container_body{
	margin : 0px auto;	
	font-size : 18px;
}

h2 {
	margin:50px 0px;
	text-align: center;
}

/*============================
	하위 메뉴 hover시 펼쳐지며 컬러 꽉 차게
==============================*/

.dropdown {
    position: relative;
    display: inline-block;
}

.dropdown-content {
    display: none;
    position: absolute;
    background-color: white;
    min-width: 140px;
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
    z-index: 1;
    border-radius:5px;

}

.dropdown-content a {
    color: black;
    padding: 12px 12px;
    text-decoration: none;
    display: block;
}

.dropdown-content a:hover {
	background-color: red;
	color: white;
}
.dropdown:hover .dropdown-content {
	display: block;
}


.dropdown-content a:first-child {	
	border-top-left-radius:5px;
	border-top-right-radius:5px;
}

.dropdown-content a:last-child {	
	border-bottom-left-radius:5px;
	border-bottom-right-radius:5px;
}



</style>
</head>
<body>

<%-- main_header.jsp --%>
<%@include file="./../include/main_header.jsp"%>

<div class="container_body">
<h2 style="text-align:center">TEST</h2>		 


<div class="row">		<!-- 첫번째 row 의  시작 -->
<div class="col-md-1">
</div>
<div class="col-md-10">
<div class="col-md-12 text-center">




		  <div class="btn-group">
		    <button type="button" class="btn btn-success">
		    	<a href="/ictinfo/el0.ict?pageName=el0">가</a></button>
		    			    	
		    <button type="button" class="btn btn-success">
		    	<a href="/ictinfo/jstl_ex1.ict?pageName=jstl_ex1">나</a></button>
		    	
		    <button type="button" class="btn btn-success">
		    	<a href="/ictinfo/jstl_ex2.ict?pageName=jstl_ex2">다</button>
		    	
		    <button type="button" class="btn btn-success">
		    	<a href="/ictinfo/jstl_ex3.ict?pageName=jstl_ex3">라</button>
		    	
		    <button type="button" class="btn btn-success">
		    	<a href="/ictinfo/jstl_ex4.ict?pageName=jstl_ex4">마</button>	
		    	
		    <button type="button" class="btn btn-success">
		    	<a href="/ictinfo/jstl_ex6.ict?pageName=jstl_ex6">바</button>
		    	
		    <button type="button" class="btn btn-success">
		    	<a href="/ictinfo/jstl_ex7.ict?pageName=jstl_ex7">사</button>
		    	
		    <button type="button" class="btn btn-success">
		    	<a href="/ictinfo/jstl_ex8.ict?pageName=jstl_ex8">아</button>		    			    			    		    	
		    
			<div class="dropdown">
				<button type="button" class="btn btn-danger dropbtn">커뮤니티 <span class="caret"></span></button>
				<div class="dropdown-content" id="ddcontent">
					<a href="/ictinfo/admin_nbList.admin?pageNum=1">공지사항</a>
					<a href="/ictinfo/admin_nbList.admin">FAQ</a>
					<a href="/ictinfo/admin_nbList.admin">QnA</a>
					<a href="/ictinfo/admin_color.admin">색상표</a>
				</div>
			</div>
		  </div>
		  
		<button type="button" class="btn btn-success">
		    	<a href="/ictinfo/list_set_msp.ict">example실행</a></button>
		  
		  <br><hr><br>

		
		
		
</div><!-- col-md-10의 끝 -->
</div><!-- col-md-12의 끝 -->	  
<div class="col-md-1">
</div>		  
</div> <!-- 첫번째 row의 끝 -->


<div class="row">		<!-- 두번째 row 의  시작 -->
<div class="col-md-1">
</div>
<div class="col-md-10">
<div class="col-md-12 text-center">




		  <div class="btn-group">
		    <button type="button" class="btn btn-primary">
		    	<a href="/ictinfo/el0.ict?pageName=el0">가</a></button>
		    			    	
		    <button type="button" class="btn btn-primary">
		    	<a href="/ictinfo/jstl_ex1.ict?pageName=jstl_ex1">나</a></button>
		    	
		    <button type="button" class="btn btn-primary">
		    	<a href="/ictinfo/jstl_ex2.ict?pageName=jstl_ex2">다</button>
		    	
		    <button type="button" class="btn btn-primary">
		    	<a href="/ictinfo/jstl_ex3.ict?pageName=jstl_ex3">라</button>
		    	
		    <button type="button" class="btn btn-primary">
		    	<a href="/ictinfo/jstl_ex4.ict?pageName=jstl_ex4">마</button>	
		    	
		    <button type="button" class="btn btn-primary">
		    	<a href="/ictinfo/jstl_ex6.ict?pageName=jstl_ex6">바</button>
		    	
		    <button type="button" class="btn btn-primary">
		    	<a href="/ictinfo/jstl_ex7.ict?pageName=jstl_ex7">사</button>
		    	
		    <button type="button" class="btn btn-primary">
		    	<a href="/ictinfo/jstl_ex8.ict?pageName=jstl_ex8">아</button>		    			    			    		    	
		    
			<div class="dropdown">
				<button type="button" class="btn btn-warning dropbtn">커뮤니티 <span class="caret"></span></button>
				<div class="dropdown-content" id="ddcontent">
					<a href="/ictinfo/admin_nbList.admin?pageNum=1">공지사항</a>
					<a href="/ictinfo/admin_nbList.admin">FAQ</a>
					<a href="/ictinfo/admin_nbList.admin">QnA</a>
					<a href="/ictinfo/admin_color.admin">색상표</a>
				</div>
			</div>
		  </div>
		  
		<button type="button" class="btn btn-primary">
		    	<a href="/ictinfo/_example.ict">example실행</a></button>
		  
		  <br><br><br>


		
		
</div><!-- col-md-10의 끝 -->
</div><!-- col-md-12의 끝 -->	  
<div class="col-md-1">
</div>		  
</div> <!-- 두번째 row의 끝 -->
</div> <!-- container_body 끝-->	

<br><br><br><br><br><br><br><br><br>

<%-- main_footer.jsp --%>
<%@include file="./../include/main_footer.jsp"%>

<%-- plugin_js.jsp --%>
<%@include file="./../include/main_js.jsp"%>

<!-- 여기 아래에 JavaScript 코딩을 작성하세요!!! -->
<script>

	

</script>


</body>
</html>

