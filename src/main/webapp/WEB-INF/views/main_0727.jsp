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
<link href="resources/style.css" rel="stylesheet" type="text/css">
<link href="./img/img_main/logo_ict.png" rel="shortcut icon">
<!-- <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css"> -->


<style>

table{
	height:250px;
}
 
.BizPageMove {
  height:57px;
} 


</style>


<%-- head.jsp --%>
<%@include file="include/main_css.jsp"%>


</head>
<body style="height:1080px">

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
				<h1>KBIZ 한국 ICT융합 사업협동조합 01</h1>
				<p class="text-center"><a class="btn btn-primary btn-lg" href="http://edu.ictkorea.or.kr/"  target="_blank" role="button"> 바로가기</a></p>
			</div>
		</div>

		<div class="item">
			<img src="./img/img_main/bg_main_03_01.png" alt="Image">
			<div class="carousel-caption">
				<h1>국가 취업 정보 사이트(워크넷) 02</h1>
				<p class="text-center"><a class="btn btn-primary btn-lg" href="https://www.work.go.kr/"  target="_blank" role="button"> 바로가기</a></p>
			</div>
		</div>

		<div class="item">
			<img src="./img/img_main/bg_main_13_01.jpg" alt="Image">
			<div class="carousel-caption">
				<h1>취업정보사이트(사람인) 03</h1>
				<p class="text-center"><a class="btn btn-primary btn-lg" href="http://www.saramin.co.kr/zf_user/"  target="_blank" role="button"> 바로가기</a></p>
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
							<td class="BizPageMove"><a href="donggu.ict" style="cursor:pointer">${bizinfo.company_name}</a></td>
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
							<a href="nbList.ict?pageNum=1" class="pull-right"></span>more...</a>
						</h3>
					</div>


					<table class="table" style="TABLE-layout:fixed">
						<thead>
						<tr>
							<th class="text-center" width="80px">번호</th>
							<th class="text-center">제목</th>
						</tr>
						</thead>					
						
						<tbody>
						

 
 						<div id="divNbList">
	  						<c:forEach var="nbList" items="${nbList}" varStatus="status">
		  						<input type="hidden" class="a1${status.index}" id="nbLista1" value="${nbList.articleNum}">
		  						<input type="hidden" class="a2${status.index}" id="nbLista2" value="${nbList.title}">

		  						<c:if test="${status.last}"> 
		  							<input type="hidden" id="nbListEndNum" value="${status.index}">
		  						</c:if>


							</c:forEach>
 						</div>


						<div id="viewNbList">
							<tr>
								<td id="tdNba1"></td>
								<td id="tdNba2" class="BizPageMove"><a class="nbTitle01" href="nbList.ict?pageNum=1" style="cursor:pointer"></a></td>
							</tr>
							
							<tr>
								<td id="tdNbb1"></td>
								<td id="tdNbb2" class="BizPageMove"><a href="nbList.ict?pageNum=1" style="cursor:pointer"></a></td>
							</tr>
							
							<tr>
								<td id="tdNbc1"></td>
								<td id="tdNbc2" class="BizPageMove"><a href="nbList.ict?pageNum=1" style="cursor:pointer"></a></td>
							</tr>
						</div>						
												
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
							 &nbsp;채용정보
							<!-- <a href="main.ict" class="pull-right">more...</a> -->
							<span id="empInfoShortCut"></span>
						</h3>
					</div>

					<table class="table">
						<thead>
						<tr>
							<th class="text-center">구분</th>
							<th class="text-center">내용</th>
						</tr>
						</thead>
						<tbody>
						<tr>
							<td>회사명<br/><span class='label label-success'>급구 </span></td>
							<td id="empInfo01"></td>
						</tr>
						<tr>
							<td>채용분야<br/><span class='label label-success'>급구 </span></td>
							<td id="empInfo02"></td>

						</tr>
						<tr>
							<td>채용형태<br/><span class='label label-success'>급구 </span></td>
							<td id="empInfo03"></td>

						</tr>
						</tbody>
					</table>

					<div class="panel-footer">
					</div>

				</div>
			</div>
		</div>


	</div>	<!-- class="row" 의 끝 -->
</div><br>	<!-- container_body 의끝 -->

<%-- main_footer.jsp --%>
<%@include file="include/main_footer.jsp"%>

<%-- plugin_js.jsp --%>
<%@include file="include/main_js.jsp"%>

</body>
</html>

