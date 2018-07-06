<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=27703aefb48df81e1a6dd06ce7ab03f4&libraries=services"></script>
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
	}
	
	#selfintroduce{
		text-align:center;
		margin: 0 auto;
		max-width:40%;
	}
	.selfintro{
		margin:2px 20px;
		text-align:center;
		border:1px solid #FFFFFF;
		background-color:#EFF0FF;
	}
	#scr1{
		margin: 40px auto;
	}
	textarea{
		margin:10px auto;
		font-weight:bold;
		font-size:16px;
		align:center;
		border:none;
	}
		
	
</style>

<body style="height:1020px">

<%-- main_header.jsp --%>
<%@include file="./../include/main_header.jsp"%>
	<div class="container_body">
	
	<h2 style="text-align:center" id="selfhead"> 자기소개서 작성 항목 및 방법 </h2>
	<ul class="nav nav-pills nav-stacked nav-justified" id="selfintroduce">
	    <li class="selfintro" id="selfintrocate"><a data-toggle="pill" href="#"> 자기소개서 작성 항목 </a></li>
	    <li class="selfintro" id="selfintromethod"><a data-toggle="pill" href="#"> 자기소개서 작성 방법 </a></li>
  	</ul>
  	<iframe width="720" height="360" src="https://www.youtube.com/embed/DL0JTwZCWXk" id="scr1"></iframe>
  	
  	
  	<textarea cols="100" rows="50">
1.성장배경

자신을 핵심적이고 뚜렷하게 부각시킬 수 있는 유년의 에피소드나 가족관계에 얽힌 이야기 혹은 
자신이 성장한 고향의 이야기 등을 글의 전개에 무리가 가지 않는 선에서 
신선하게 끌어들여 말문을 여는 것이 더 참신한 방법이 될 수 있다.
좀 더 깊이 있게 자신을 드러내려면 유년기에 가졌던 호기심이나 문제의식 등을 
전공이나 현재의 관심분야에 연결시켜 언급하는 것도 읽는 사람에게 깊은 인상을 심어 줄 수 있다. 


2.성격

상대에게 거부감을 일으키지 않을 정도의 어법으로 구체적인 표현을 해주는 것이 좋고 
만일 단점이 있다면 무조건 표현을 피하는 것보다는 개선의 의지와 노력을 보이면서 
드러내 주는 것이 솔직하고 발전적인 인상을 줄 수 있다.


3.학창시절

대학생활 이전의 생활들은 특징적이고 개괄적인 것을 간단히 소개하는 선에서 마무리하고 
본격적인 이야기는 대학생이나 최종학교의 생활에 맞추어서 해야 한다.

전공이나 활동했던 분야를 지원업종과의 연관성에 초점을 두고 구체적으로 서술해준다면 
기업에서는 가장 빠르게 업무적합 여부를 판단할 수 있는 직접적인 자료가 될 수 있다.
관심 분야나 활동 분야는 직업과 직결되는 경우가 많으므로 구체적이고 심도 있게 다뤄주는 배려가 필요하다.


4.지원동기 및 앞으로의 포부

자기소개서를 통해 기업의 입장에서 실질적인 관심사가 되는 부분이다. 
실제 기업측에서는 능력을 인정받는 사원들이 자기가 맡은 분야에서 성취감이나 의욕감을 느끼지 못해
 퇴사하는 경우를 많이 경험하기 때문이다.
기본적으로 강한 의지를 담되, 지원하려는 기업의 구체적인 환경에 대한 사전지식 속에서 솔직하게 쓰는 것이 가장 좋은 방법이다.		
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
