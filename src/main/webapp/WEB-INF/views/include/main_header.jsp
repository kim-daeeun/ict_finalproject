<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


    
    
<div class="container">

	<div class="row">
		<div class="col-xs-4" id="toprow">
			<a href="main.ict"><span></span> ICT취준생을 위한 정보망</a>
		</div>

		<ul class="nav navbar-nav navbar-right">
		
			<c:if test="${id!=null}">
					<li><a><span class="glyphicon glyphicon-ok"></span> [ ${id} ] 님 환영합니다</a></li>
					<li><a href="/ictinfo/logout.ict"><span class="glyphicon glyphicon-log-out"></span> 로그아웃</a></li>
					<!-- <form action="/ictinfo/logout.ict" method="post">		 
						<button id="logout">로그아웃</button>
					</form> -->

					<li><a href="joinInfo.ict"><span class="glyphicon glyphicon-user"></span> 회원정보</a></li>
			</c:if>	
			<c:if test="${id==null}">
				<li><a href="login.ict"><span class="glyphicon glyphicon-log-in"></span> 로그인</a></li>
				<li><a href="joinForm.ict"><span class="glyphicon glyphicon-user"></span> 회원가입</a></li>
			</c:if> 
			
			<!-- <li><a href="login.ict"><span class="glyphicon glyphicon-log-in"></span> 로그인</a></li> -->
			
			
			
			<li><a href="weather.ict"><span class="glyphicon glyphicon-cloud"></span> 사이트맵</a></li>
		</ul>

	</div>

</div>



<!--<nav class="navbar navbar-inverse sticky-top" data-spy="affix" data-offset-top="80">-->
<nav class="navbar navbar-inverse sticky-top" data-spy="affix" data-offset-top="80">
	<div class="container-fluid">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="main.ict">ICT취준생을 위한 정보망</a>
		</div>

		<div class="collapse navbar-collapse" id="myNavbar">
			<ul class="nav navbar-nav">
				<li><a href="./main.ict"><span class="glyphicon glyphicon-home"></span></a></li>

				<li class="dropdown">
				<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
										aria-haspopup="true" aria-expanded="false"><span class="glyphicon glyphicon-leaf"></span> 광주지역기업<span class="caret"></span></a>
					<ul class="dropdown-menu ">
						<li class="dropdown-item"><a href="donggu.ict">동구</a></li>
						<li class="dropdown-item"><a href="seogu.ict">서구</a></li>
						<li class="dropdown-item"><a href="namgu.ict">남구</a></li>
						<li class="dropdown-item"><a href="bukgu.ict">북구</a></li>
						<li class="dropdown-item"><a href="gsgu.ict">광산구</a></li>
					</ul>
				</li>

				<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
										aria-haspopup="true" aria-expanded="false"><span class="glyphicon glyphicon-leaf"></span> 전남지역기업<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="gycity.ict">광양</a></li>
						<li><a href="njcity.ict">나주</a></li>
						<li><a href="mpcity.ict">목포</a></li>
					</ul>
				</li>

				<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
										aria-haspopup="true" aria-expanded="false"><span class="glyphicon glyphicon-leaf"></span> 공공기관<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="gjofficial.ict">광주광역시</a></li>
						<li><a href="njofficial.ict">나주시</a></li>
					</ul>
				</li>

				<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
										aria-haspopup="true" aria-expanded="false"><span class="glyphicon glyphicon-leaf"></span> 부가정보<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="selftIntro.ict">자소서 잘쓰기</a></li>
						<li><a href="presentation_interview.ict">발표/면접 잘하기</a></li>
					</ul>
				</li>

				<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
										aria-haspopup="true" aria-expanded="false"><span class="glyphicon glyphicon-leaf"></span> 커뮤니티<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="noticeBoard.ict">공지사항</a></li>
						<li><a href="faqlist.ict?pageNum=1">FAQ</a></li>
						<li><a href="qnaBoard.ict">QnA</a></li>

					</ul>
				</li>
			</ul>

		</div>




	</div>
</nav>    