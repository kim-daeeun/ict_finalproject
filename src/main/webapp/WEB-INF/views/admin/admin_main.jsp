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
	사이트 메뉴 설정 부분
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

/*============================
메뉴보기 클릭시 우측으로 부드럽게 움직임 
==============================*/
#colmd12-MoveRight{
    transition: margin-left .5s;
}


/*============================
	버튼 속성 지정하기
==============================*/
.btn{
	color:white;
	border:0px solid orange;	
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
<h2 style="text-align:center">관리자 페이지 메인</h2>		 

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
		  <a href="/ictinfo/admin_nbList.admin?pageNum=1">커뮤니티</a>
		</div>
		
		<div id="main" class="main text-left">
		  <span style="font-size:20px;cursor:pointer" onclick="openNav()">&#9776; 관리자 전체 메뉴보기</span>
		</div>
		
		<br>
	
		<div class="pull-left">

				<button type="button" class="btn btn-primary">광주지역기업</button>
				<button type="button" class="btn btn-secondary">전남지역기업</button>
				<button type="button" class="btn btn-success">공공기관</button>
				<button type="button" class="btn btn-info">부가정보</button>
				
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
	<%@include file="./../include/main_footer.jsp"%>
</div>

<%-- plugin_js.jsp --%>
<%@include file="./../include/main_js.jsp"%>

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
 

</script>


</body>
</html>

