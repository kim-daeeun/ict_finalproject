<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %> 
<%@ taglib prefix="page" uri="http://www.opensymphony.com/sitemesh/page" %>




<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<!-- 타이틀 꼭 수정하세요 -->
<!-- <title>View Page</title> -->
<title>title:::::<decorator:title /></title>

    <!-- header -->
    <decorator:head></decorator:head>
    <!-- //header -->


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

<decorator:body ></decorator:body>


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
		    <button type="button" class="btn btn-primary">광주지역기업</button>
		    <button type="button" class="btn btn-primary">전남지역기업</button>
		    <button type="button" class="btn btn-primary">공공기관</button>
		    <button type="button" class="btn btn-primary">부가정보</button>
		    <div class="btn-group">
		      <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
		     		 커뮤니티 <span class="caret"></span></button>
		      <ul class="dropdown-menu" role="menu">
		        <li><a href="#">공지사항</a></li>
		        <li><a href="#">FAQ</a></li>
		        <li><a href="#">QnA</a></li>
		      </ul>
		    </div>
		  </div>





<div class="panel panel-success">

			<div class="panel-heading">
				<h3 class="panel-title">
					<span class="glyphicon glyphicon-bullhorn"></span>&nbsp;공지사항
					<a href="nbList.ict?pageNum=1" class="pull-right"></span>more...</a>
				</h3>
			</div>

			<div class="panel-body">
					<table class="table">
						<thead>
							<tr>
								<th>번호</th>
								<th>제목</th>
							</tr>
						</thead>					
						
						<tbody> 
							<div id="viewNbList">
								<tr>
									<td></td>
									<td></td>
								</tr>
							</div>													
						</tbody>						
						
					</table>	<!-- 테이블의 끝 -->
			
			</div> <!-- class="panel-body" 의 끝--> 





			<div class="panel-footer">
			</div>			

</div> <!-- class="panel panel-success" 의 끝 -->


		
		
		
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

