<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html>
<title>자소서 잘쓰기</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=27703aefb48df81e1a6dd06ce7ab03f4&libraries=services"></script>
<link href="resources/style.css" rel="stylesheet" type="text/css">
<link href="./img/img_main/logo_ict.png" rel="shortcut icon">
<%-- head.jsp --%>
<%@include file="./../include/main_css.jsp"%>
<style>
	.container_body{
		max-width:1080px;	
		text-align:center;
		margin: 20px auto;	
	}
	#selfhead{
		margin:30px auto;
		margin-top:50px;
	}
	
	#selfintroduce{
		text-align:center;
		margin: 0 auto;
		max-width:40%;
	}
	.selfintro{
		margin:20px 20px;
		text-align:center;
		border:1px solid #FFFFFF;
		background-color:#EFF0FF;
	}
	#scr2{
		margin: 40px auto;
	}
	textarea{
		margin:10px auto;
		font-weight:bold;
		font-size:16px;
		align:center;
		border:none;
		max-width:720px;
	}
		
	
</style>

<body style="height:1020px">

<%-- main_header.jsp --%>
<%@include file="./../include/main_header.jsp"%>
	<div class="container_body">
	
	<h2 style="text-align:center" id="selfhead"> 자기소개서 작성 항목 및 방법 </h2>
	<ul class="nav nav-pills nav-stacked nav-justified" id="selfintroduce">
	    <li class="selfintro" id="selfintrocate"><a data-toggle="pill" href="#"> 자기소개서 작성 항목 </a></li>
	    <li class="selfintro active" id="selfintromethod"><a data-toggle="pill" href="#"> 자기소개서 작성 방법 </a></li>
  	</ul>
	<iframe width="720" height="360" src="https://www.youtube.com/embed/qZU-1N_gFqY" id="scr2"></iframe>
  	
  	<textarea cols="100" rows="35">
1.구체적으로 써라!

'다양한 아르바이트를 통해 경험을 쌓았습니다.'라는 말보다는 
어떤 아르바이트를 하면서 무슨 일을 하였고, 
그러한 것들이 현재 어떤 식으로 도움이 되는지 구체적으로 기술하는 것이 좋다.

2.업무적인 면을 쓸 때는 실적을 중심으로 하되 '숫자'를 강조적으로 쓰는 것이 좋다.

예를 들자면, 영업성과가 좋았다는 것을 전년대비 100% 성장, 아니면 매출액이라고 표현하는 것이 좋다. 
구체적으로 표현해야 인사담당자도 구체적으로 생각한다.

3.일관성 있는 표현을 사용하라!

한가지로 통일해서 사용하고 동일한 대상에 반복 표현을 위해 다양한 표현을 쓰는 것은 좋으나
호칭, 종결형 어미, 존칭어 등은 일관된 표현으로 쓰는 것이 바람직하다.

4.초고를 작성하라!

한번에 작성하지 말고, 초고를 작성하여 여러 번에 걸쳐 수정 보완 해야 한다.
처음부터 완벽하게 쓰려고 하면 그만큼 시간 소모도 많고 비효율적이다. 
점점 다듬으면서 자기소개서를 완성하는 것이다. 
		
  	</textarea>

	</div> <!-- cotainer끝-->	

<script>

$(function(){
	$("#selfintrocate").on("click",function(){
		document.location.href="/ictinfo/selfintrocate.ict";
	});
	$("#selfintromethod").on("click",function(){
		document.location.href="/ictinfo/selfintromethod.ict";
	});	
});

</script>
	<%-- main_footer.jsp --%>
<%@include file="./../include/main_footer.jsp"%>

<%-- plugin_js.jsp --%>
<%@include file="./../include/main_js.jsp"%>
</body>
</html>
