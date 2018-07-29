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
.container_body{
	margin : 0px auto;	
}

h2 {
	margin:50px 0px;
	text-align: center;
}

.sidenav > .affix {
      top: 60px;
      width: 14%;
      z-index: 9999 !important;
  }

/* 왼쪽 메뉴바 관련 속성 */

#leftsidemenu {
    list-style-type: none;
    margin: 0;
    padding: 0;
    background-color: #f1f1f1;
    /* position: fixed; */
    overflow: auto;
}

#leftsidemenu li a {
    display: block;
    color: #000;
    padding: 8px 16px;
    text-decoration: none;
}

#leftsidemenu li a.active {
    background-color: #4CAF50;
    color: white;
}

#leftsidemenu li a:hover:not(.active) {
    background-color: #555;
    color: white;
}

 
 
</style>
</head>
<body style="height:1020px">

<%-- main_header.jsp --%>
<%@include file="./../include/main_header.jsp"%>
<br><br>


<div class="container-fluid text-center" >    
  <div class="row content">
    <div class="col-sm-2 sidenav">
		<ul class="nav nav-pills nav-stacked" id="leftsidemenu"  data-spy="affix" data-offset-top="205">
		  <li><a class="active" href="#home">광주지역기업</a></li>
		  <li><a href="#news">전남지역기업</a></li>
		  <li><a href="#contact">공공기관</a></li>
		  <li><a href="#about">부가정보</a></li>
		  <li><a href="#about">커뮤니티</a></li>
		</ul>
    </div>
    
    <h2 style="text-align:center">관리자 페이지</h2>
    
    <div class="col-sm-8 text-left"> 
      <h1>Welcome</h1>
      <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
      <hr>
      <h3>Test</h3>
      <p>Lorem ipsum...</p>
    </div>
    <div class="col-sm-2 sidenav">
      <div class="well">
        <p>ADS</p>
      </div>
      <div class="well">
        <p>ADS</p>
      </div>
    </div>
  </div>
</div>

<%-- main_footer.jsp --%>
<%@include file="./../include/main_footer.jsp"%>

<%-- plugin_js.jsp --%>
<%@include file="./../include/main_js.jsp"%>

<!-- 여기 아래에 JavaScript 코딩을 작성하세요!!! -->
<script>



</script>


</body>
</html>

