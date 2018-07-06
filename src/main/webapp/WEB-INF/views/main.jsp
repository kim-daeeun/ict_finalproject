<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%-- <%@ page session="false" %> --%>


<!DOCTYPE html>
<html>

<head>
<title>Main Page</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> 

<!-- <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css"> -->


<%-- head.jsp --%>
<%@include file="include/main_css.jsp"%>


</head>
<body style="height:1020px">

<%-- main_header.jsp --%>
<%@include file="include/main_header.jsp"%>


<div id="myCarousel" class="carousel slide" data-ride="carousel">
	<!-- Indicators -->
	<ol class="carousel-indicators">
		<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
		<li data-target="#myCarousel" data-slide-to="1"></li>
		<li data-target="#myCarousel" data-slide-to="2"></li>
	</ol>

	<!-- Wrapper for slides -->
	<div class="carousel-inner" role="listbox">
		<div class="item active">
			<img src="./img/img_main/bg_main_09_02.jpg" alt="Image">
			<!-- <img src="https://placehold.it/1200x400?text=IMAGE" alt="Image"> -->
			<div class="carousel-caption">
				<h1>국가 인적 자원 개발 컨소시엄01</h1>
				<p class="text-center"><a class="btn btn-primary btn-lg" href="http://edu.ictkorea.or.kr/"  target="_blank" role="button"> 바로가기</a></p>
			</div>
		</div>

		<div class="item">
			<img src="./img/img_main/bg_main_03_01.png" alt="Image">
			<div class="carousel-caption">
				<h1>취업정보사이트02</h1>
				<p class="text-center"><a class="btn btn-primary btn-lg" href="http://edu.ictkorea.or.kr/"  target="_blank" role="button"> 바로가기</a></p>
			</div>
		</div>

		<div class="item">
			<img src="./img/img_main/bg_main_13_01.jpg" alt="Image">
			<div class="carousel-caption">
				<h1>취업정보사이트03</h1>
				<p class="text-center"><a class="btn btn-primary btn-lg" href="http://edu.ictkorea.or.kr/"  target="_blank" role="button"> 바로가기</a></p>
			</div>
		</div>
	</div>

	<!-- Left and right controls -->
	<a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
		<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
		<span class="sr-only">Previous</span>
	</a>
	<a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
		<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
		<span class="sr-only">Next</span>
	</a>
</div>

<div class="container text-center">
	<h3>What We Do</h3><br>
	
	
	
	
	<div class="row">
	
		<div class="col-sm-4">
		<div class="col-sm-12">
				<div class="panel panel-danger">


					<div class="panel-heading">
						<h3 class="panel-title">
							<span class="glyphicon glyphicon-check"></span>
							&nbsp;관련기업
							<a href="donggu.ict" class="pull-right">more...</a>
						</h3>
					</div>


					<table class="table">
						<thead>
						<tr>
							<th class="text-center">분류</th>
							<th class="text-center">회사명</th>
							<th class="text-center">사업내용</th>
						</tr>
						</thead>
												
						<tbody>
						
						<c:forEach var="bizinfo" items="${bizInfoList}" varStatus="status">
						<tr>
							<td> ${bizinfo.bizcategory} <span class="label label-danger">Hot </span></td>
							<td class="BizPageMove"><a style="cursor:pointer">${bizinfo.company_name}</a></td>
							<td>${bizinfo.biz_contents}</td>

						</tr>
						</c:forEach>
												
						</tbody>
					</table>

					<div class="panel-footer">

					</div>

				</div>
			</div>
		</div>
		
		<div class="col-sm-4">
		<div class="col-sm-12">
				<div class="panel panel-warning">


					<div class="panel-heading">
						<h3 class="panel-title">
							<span class="glyphicon glyphicon-bullhorn"></span>
						  &nbsp;공지사항
							<a href="noticeBoard.ict" class="pull-right">more...</a>
						</h3>
					</div>


					<table class="table">
						<thead>
						<tr>
							<th class="text-center">글번호</th>
							<th class="text-center">제목</th>
							<th class="text-center">내용</th>
						</tr>
						</thead>
						<tbody>
						<tr>
							<td>1</td>
							<td>교육과정</td>
							<td><a href="lecture.html?lectureName=c">보안개발자</a></td>

						</tr>
						<tr>
							<td>2</td>
							<td>채용공고</td>
							<td><a href="lecture.html?lectureName=java">Web개발자</a></td>

						</tr>
						<tr>
							<td>3</td>
							<td>채용박람회</td>
							<td><a href="lecture.html?lectureName=android">취업성공의 길</a></td>

						</tr>
						</tbody>
					</table>

					<div class="panel-footer">

					</div>

				</div>
			</div>
		</div>


		<div class="col-sm-4">
		<div class="col-sm-12">
				<div class="panel panel-success">


					<div class="panel-heading">
						<h3 class="panel-title">
							<span class="glyphicon glyphicon-bookmark"></span>
							 &nbsp;연관사이트
							<a href="main.ict" class="pull-right">more...</a>
						</h3>
					</div>


					<table class="table">
						<thead>
						<tr>
							<th class="text-center">번호</th>
							<th class="text-center">회사명</th>
							<th class="text-center">내용</th>
						</tr>
						</thead>
						<tbody>
						<tr>
							<td>1</td>
							<td>워크넷</td>
							<td><a href="lecture.html?lectureName=c">취업정보</a></td>

						</tr>
						<tr>
							<td>2</td>
							<td>한국고용정보원</td>
							<td><a href="lecture.html?lectureName=java">고용정보분석</a></td>

						</tr>
						<tr>
							<td>3</td>
							<td>고용복지센터</td>
							<td><a href="lecture.html?lectureName=android">일자리와 복지</a></td>

						</tr>
						</tbody>
					</table>

					<div class="panel-footer">

					</div>

				</div>
			</div>
		</div>



	</div>
</div><br>

<%-- main_footer.jsp --%>
<%@include file="include/main_footer.jsp"%>

<%-- plugin_js.jsp --%>
<%@include file="include/main_js.jsp"%>

</body>
</html>

