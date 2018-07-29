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
	하위 메뉴 hover시 컬러 꽉 차게
==============================*/


</style>
</head>
<body>

<%-- main_header.jsp --%>
<%@include file="./../include/main_header.jsp"%>

<div class="container_body">
<h2 style="text-align:center">색상표(관리자 페이지)</h2>		 

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
		
		<br><br>
	
		<div class="pull-left">

				<button type="button" class="btn btn-primary">광주지역기업</button>
				<button type="button" class="btn btn-secondary">전남지역기업</button>
				<button type="button" class="btn btn-success">공공기관</button>
				<button type="button" class="btn btn-info">부가정보</button>
				
				<div class="btn-group">
					<button type="button" class="btn btn-warning dropdown-toggle" data-toggle="dropdown">
							커뮤니티<span class="caret"></span>
					</button>
					    <ul class="dropdown-menu" role="menu">
						      <li><a href="#">공지사항</a></li>
						      <li><a href="#">FAQ</a></li>
						      <li><a href="#">QnA</a></li>
						      <li><a href="#">색상표</a></li>
					    </ul>

					<!-- BS4에서 사용
			   		<div class="dropdown-menu">	
					      <a class="dropdown-item" href="#">Tablet</a>
					      <a class="dropdown-item" href="#">Smartphone</a>
				    </div> -->
				    
				</div>

			
		</div>


		<br><br><br><br><br><br>		
		<div class="pull-left text-left">
			부트스트랩3 색상<br>
			<button type="button" class="btn">Basic</button>
			<button type="button" class="btn btn-primary">Primary</button>
			<button type="button" class="btn btn-secondary">Secondary</button>
			<button type="button" class="btn btn-success">Success</button>
			<button type="button" class="btn btn-info">Info</button>
			<button type="button" class="btn btn-warning">Warning</button>
			<button type="button" class="btn btn-danger">Danger</button>
			<button type="button" class="btn btn-dark">Dark</button>
			<button type="button" class="btn btn-light">Light</button>	
		
			<br><br>
			
			부트스트랩4 색상<br>
			<button type="button" class="btn">Basic</button>
			<button type="button" class="btn btn-primary" style="background-color: #007BFF;">Primary #007BFF</button>
			<button type="button" class="btn btn-secondary" style="background-color: #6C757D;">Secondary #6C757D</button>
			<button type="button" class="btn btn-success" style="background-color: #28A745;">Success #28A745</button>
			<button type="button" class="btn btn-info" style="background-color: #17A2B8;">Info #17A2B8</button>
			<button type="button" class="btn btn-warning" style="background-color: #FFC107;">Warning #FFC107</button>
			<button type="button" class="btn btn-danger" style="background-color: #DC3545;">Danger #DC3545</button>
			<button type="button" class="btn btn-dark" style="background-color: #343A40;">Dark #343A40</button>
			<button type="button" class="btn btn-light" style="background-color: #F8F9FA;">Light #F8F9FA</button>
			
			<br><br>
			
			모아둔 색상<br>
			<button type="button" class="btn" style="background-color: #f2f2f2;"> #f2f2f2 </button>
			<button type="button" class="btn" style="background-color: Beige;"> Beige </button>
			<button type="button" class="btn" style="background-color: pink;"> pink </button>
			<button type="button" class="btn" style="background-color: YellowGreen;"> YellowGreen </button>
			<button type="button" class="btn" style="background-color: 4CAF50;"> 4CAF50 </button>
			<button type="button" class="btn" style="background-color: #ddd;"> #ddd </button>
			<button type="button" class="btn" style="background-color: #006699;"> #006699 (군청) </button>
			<button type="button" class="btn" style="background-color: #3CBC8D;"> #3CBC8D (주석) </button>
			<button type="button" class="btn" style="background-color: lightgreen;"> lightgreen </button>
			
			<br><br>
			
			<button type="button" class="btn" style="background-color: #4285F4;"> #4285F4 (구글(파랑)) </button>
			<button type="button" class="btn" style="background-color: #0080ff;"> #0080ff(대명 예약버튼) </button>
			<button type="button" class="btn" style="background-color: #4d7a97;"> #4d7a97 </button>
			<button type="button" class="btn" style="background-color: #008cba;"> #008cba </button>
			<button type="button" class="btn" style="background-color: #4db8bd;"> #4db8bd </button>
			<button type="button" class="btn" style="background-color: #0066ff;"> #0066ff </button>
			<button type="button" class="btn" style="background-color: #0247FE;"> #0247FE </button>
			<button type="button" class="btn" style="background-color: pink;"> black </button>
			<button type="button" class="btn" style="background-color: pink;"> black </button>
			<button type="button" class="btn" style="background-color: pink;"> black </button>



	

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

