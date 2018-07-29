<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
<%-- 새로 추가할 CDN 입력하는 부분 시작 --%>
	<!-- 예 : <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script> -->
<%-- 새로 추가할 CDN 입력하는 부분 끝--%>



<%-- head.jsp --%>
<%@include file="./../include/main_css.jsp"%>


<style>
.container_body{
	margin : 0px auto;	
}

h2 {
	margin:50px 0px;
	text-align: center;
}


<!-- 여기에 CSS 코딩을 하세요 -->


</style>


</head>
<body style="height:1020px">

<%-- main_header.jsp --%>
<%@include file="./../include/main_header.jsp"%>

	<div class="container_body">
	
		<h2 style="text-align:center">SITEMAP</h2>					
		
			 
		<div class="test01">
		
		<!-- 여기에 메인 코딩을 하세요 -->
		
	<div class="row">		
		
		<hr>
		<!-- 미디어 사용하기 --> 
		<div class="panel panel-primary col-md-push-2 col-md-8">
		
		
			<div class="panel-heading">
				<h3 class="panel-title"><span class="glyphicon glyphicon-pencil"></span>
					&nbsp; &nbsp; 끊임없이 노력하라! 체력이나 지능이 아니라 노력이야 말로 잠재력의 자물쇠를 푸는 열쇠다.
				</h3>				
			</div>
			
			
			<div class="panel-body" class="media-body">
			
				<div class="media">
					<div class="media">
						<a href="#"><img class="media-object col-md-12" src="./img/img_sitemap/sitemap01.png"></a>
					</div>
				</div>
				<hr>

			
				<div class="media" class="media-body">
					<div class="media">
						<a href="#"><img class="media-object col-md-12" src="./img/img_sitemap/sitemap02.png" ></a>
					</div>
				</div>	
				
								
			</div>
		</div>			
		
	</div>
	</div>


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

