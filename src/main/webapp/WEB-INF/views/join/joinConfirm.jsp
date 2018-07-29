<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 성공</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link href="resources/style.css" rel="stylesheet" type="text/css">
<link href="./img/img_main/logo_ict.png" rel="shortcut icon">
<%-- head.jsp --%>
<%@include file="./../include/main_css.jsp"%>

<style>
.container_body {
    text-align:center;
    margin:0px auto;
    width:1080px;
}

h2 {
	margin:50px 0px;
	text-align: center;
}

#main{
	margin:20px auto;
	width:50%;
	height:200px;
	display:block;
}

#mainbtn{
	margin: 20px auto;
}

</style>

</head>
<body style="height:1020px">
	
	<%-- main_header.jsp --%>
	<%@include file="./../include/main_header.jsp"%>
	<div class="container_body">
		<h2> 회원가입을 축하드립니다.</h2>
		
		 <img src="./img/img_join/join_confirm.jpg" id="main">
		<button type="button" id="mainbtn" class="btn btn-success"> 메인으로 </button>
	</div>
	
<%-- main_footer.jsp --%>
<%@include file="./../include/main_footer.jsp"%>

<%-- plugin_js.jsp --%>
<%@include file="./../include/main_js.jsp"%>
<script type="text/javascript">

$(document).ready(function(){
	$("#mainbtn").on("click",function(){
		document.location.href="main.ict";
	});
}); 	

</script>
</body>
</html>