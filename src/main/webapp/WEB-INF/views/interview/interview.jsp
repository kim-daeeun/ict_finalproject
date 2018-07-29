<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>

<head>

<title>발표/면접 잘하기</title>
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
	margin-top:50px 0px;
	text-align: center;
}

.presentation, .interview{
	font-size: 16px;

}

#m_title{
	color:red;
}

#int_title{
	margin-top:50px;
}

</style>


</head>
<body style="height:1080px">

<%-- main_header.jsp --%>
<%@include file="./../include/main_header.jsp"%>

	<div class="container_body">
	
		<div id="int_title"><h2 style="text-align:center">발표 시 알아야 할 중요사항</h2><br></div>				
		
		
	<div class="row" style="text-align:center">	
	<div class="panel col-md-push-2 col-md-8"">		
	
				<div class="panel-body" class="media-body">			
				<div class="media">

		
		<div class="presentation">
		
		연구결과에 따르면 4명 중 3명은 사람들 앞에서 발표하는 것에 많은 긴장을 느낀다고 합니다.<br><br>
		ict 취업준비생들이 능숙하고 멋지게 발표해낼 날을 기대하며, 발표 공포증을 극복하는 데
		도움이 될 4가지 방법을 소개하겠습니다.<br><br>
		
		<iframe width="700" height="500" src="https://www.youtube.com/embed/s5-Psu7UgOo" 
		frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe><br><br>
		
		<div id = "m_title">1. 잘못된 자세 교정하기<br><br></div>
		발표를 할 때 나의 내면상태가 나의 몸에 반영되어 긴장을 많이 한 경우, 어깨에 힘이 많이
		들어가는 것처럼 부자연스러운 자세가 나오기 마련입니다.<br>
		발표전 차분히 호흡하게 되면 마음이 안정되면서 잘못된 자세를 고치는데 도움이 됩니다.<br><br>
		
		<div id = "m_title">2. 발표 연습하기<br><br></div>
		발표를 하기 전 친한 친구들과 미리 발표 연습을 하고, 잘못된 점을 수정합니다.<br><br>
		
		<div id = "m_title">3.발표 잘하는 사람 흉내내기<br><br></div>
		말을 잘하는 자신의 모습을 상상해보거나, 말을 잘하는 사람을 따라합니다.<br> 
		많은 청중앞에서 연습한다고 생각하고 합니다.<br><br>
		
		<div id = "m_title">4.아이컨텍을 잘하기<br><br></div>
		발표 잘하는 사람들의 특징 중 하나가 바로 아이컨텍입니다.<br>
		처음에 여러 사람을 바라보기 부담스러운 경우, 눈과 눈 사이 미간을 보면서 서서히 아이컨텍을
		늘려갑니다.<br><br>
		</div>
		
		</div>
		

		
		
		
		
		
		
	
		<h2 style="text-align:center">면접 시 알아야 할 중요사항</h2>
		<!--직업기초교육 피드백 중심으로 작성-->
		


		
	<div class="panel">			
		<div class="interview">
		
		<iframe width="700" height="500" src="https://www.youtube.com/embed/KILAFPJRPNg" 
		frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe><br><br>
		
		<div id = "m_title">1.인사<br><br></div>
		인사를 할 때, 말로 먼저 말하고 허리를 숙여서 인사합니다.<br><br>
		
		<div id = "m_title">2.다른 면접자도 같이 보기<br><br></div>
		질문하는 면접관만 바라보는 경우가 있었는데, 그것보다 모든 면접관을 한번씩 봐주는게 좋습니다.<br><br>
		
		<div id = "m_title">3.시선처리<br><br></div>
		질문에 당황하여 시선이 이곳저곳 가는 경우가 있었는데 면접관을 보면서 대답하도록 합니다.<br><br>
	
		<div id = "m_title">4.자세 수정하기<br><br></div>
		다리를 벌린다던지, 허리가 굽어있거나 등 잘못된 자세인 경우가 있었는데, 자세를 의식해서 수정합니다.<br>
		</div>
	</div>
	
		</div>
		</div>
		
		

	</div> <!-- row 의 끝 -->
	</div> <!-- container_body 끝-->	

<%-- main_footer.jsp --%>
<%@include file="./../include/main_footer.jsp"%>

<%-- plugin_js.jsp --%>
<%@include file="./../include/main_js.jsp"%>


<script>

/* 여기 아래에 JavaScript 코딩을 작성하세요!!! */

</script>


</body>
</html>

