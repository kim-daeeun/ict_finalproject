<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html>
<html>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> 
<%-- head.jsp --%>
<%@include file="./../include/main_css.jsp"%>
<style>
.container_body {
    text-align:center;
}

h2 {
	margin:50px 0px;
	text-align: center;
}

.login {
  max-width: 500px;
  padding: 15px;
  margin: 0 auto;
}

.form-control{
	margin-top:25px;
}

#id, #password{
	width:500px;
}

#error1{
	margin-left:30px;
	margin-bottom: 10px;
	color:red;
	font-size:20px;
}

.btn{
	margin-top:20px;
	width:200px;
}

#main{
	margin-top:50px;
	width:500px;
	height:200px;
}

img{
	width:200px;
	height:150px;
}

.error01, .error02{
	color:red;
}

.success03{
	color:blue;
}

#loginok{
	width:500px;
}

#memberjoin, #cancel{
	margin-left:32px;
}

#input_id, #input_error, #success{
 display:none;
 position:absolute;

 width:100%;
 height:100%;

 top:0px;
 left:0px;
 right:0px;
 bottom:0px;

 background-color:rgba(0,0,0,0.5);
 z-index:2;
 cursor:pointer;
}

#explain, #showInfo{
 position:absolute;
 top:30%;
 left:31%;

 width:470px;
 height:250px;

 background-color:white;
 border:1px solid block;
 font:bold 17px "굴림";
 color:black;

 font-family:head;
 text-align:center;
 
 margin-left:130px;
}
</style>

<body style="height:1020px">

<%-- main_header.jsp --%>
<%@include file="./../include/main_header.jsp"%>

<%-- 여기 아래에 코드를 작성할것 --%>

	<div id="container_body">

			<h2>ICT 취준생을 위한 정보망</h2>
			
			
		<form action="login.ict" method="post" id="loginForm" class="login">	

			 <img src="./img/img_login/img_logintop.jpg" id="main">



	
			<!-- 아이디가 입력되지 않은 경우 -->
			<div id="input_id">
			   <div id="explain">
			   <p class="head"></p>
			   	<img src="./img/img_login/img_loginfail.png"><br>
			    <p class="error01">아이디를 입력해 주세요.</p>
			    <button type="button" class="btn btn-warning" onclick="clickoff()">돌아가기</button>
			   </div>
		   </div>
   
		   <!-- 아이디 또는 비밀번호가 틀린경우 -->
		   <div id="input_error">
			   <div id="explain">
			   <p class="head"></p>
			   <img src="./img/img_login/img_loginfail.png"><br>
			    <p class="error02">아이디 또는 비밀번호가 잘못되었습니다.</p>
			    <button type="button" class="btn btn-danger" onclick="clickoff()">돌아가기</button>
			   </div>
		   </div>
	   
	   		<!-- 로그인에 성공했을 경우 -->
		   <div id="success">
			   <div id="explain">
			   <p class="head"></p>
			    <img src="./img/img_login/img_loginok.jpg"><br>
			    <%-- <p class="success03">${id} 님 환영합니다[로그인 성공]</p> --%>
			    <p class="success03"><a id="inputid"></a> 님 환영합니다[로그인 성공]</p> 
			    <button type="button" id="forwardid" class="btn btn-primary">메인으로 가기 </button>
			     <input type="hidden" id="backpage" value="<%=request.getHeader("Referer")%>">
			    
			    
			   </div>
		   </div>
	   
			<div id="error1"></div>
		
			<label for="id">
			<input type="text" name="id" id="id" class="form-control" placeholder="id"></label><br />
			
			<label for="pass">
			<input type="password" name="pass" id="password" class="form-control" placeholder="password"></label><br>
			
			<input type="button" value="로그인" class="btn btn-lg btn-primary btn-block" id="loginchkbtn"><br>
			<input type="button" value="회원가입" class="btn">
			<input type="reset" value="취소" class="btn">
	</form>
	</div>
<%-- 여기 위까지 코드를 작성할것 --%>

<%-- main_footer.jsp --%>
<%@include file="./../include/main_footer.jsp"%>

<%-- plugin_js.jsp --%>
<%@include file="./../include/main_js.jsp"%>


<%-- 해당 페이지에 필요한 js는 여기에 넣을것 --%>
<script type="text/javascript">


$(function(){
	$("#loginchkbtn").on("click",function(){	

		let id=$("#id").val().trim();
		let pass=$("#password").val().trim();
		
		if(id == null || id.length==0){
			showhowto1();
			return false;
		}
	
		if(pass == null || pass.length==0){
			showhowto2();
			return false;
			
		}else{			
			$.ajax({
				 type:"POST",
				 url:"/ictinfo/login.ict",	
				 dataType:"json", 
				 data: {
					 "id":id, 
					 "password":pass
				 },	
				 success:function(data){
					if(data==0){
						showhowto1();
					}else if(data==1){
						showhowto2();
					}else{						
						showhowto3();
				 	}
				 },			

			});	
		}		
			 	 
	 });
}); 


function showhowto1(){
	 document.getElementById("input_id").style.display="block";
}

function showhowto2(){
	 document.getElementById("input_error").style.display="block";
}

function showhowto3(){
	 document.getElementById("success").style.display="block";
	 temp_id=document.getElementById("id");
	 document.getElementById("inputid").innerHTML="";
	 document.getElementById("inputid").innerHTML=temp_id.value;	 
}

function clickoff(){
	document.getElementById("input_id").style.display="none";
	document.getElementById("input_error").style.display="none";
	document.getElementById("success").style.display="none";
}

$(function(){
	$("#forwardid").on("click",function(){
		 temp_id=document.getElementById("id");
		 document.getElementById("inputid").innerHTML="";

		   let backPageUrl=$("#backpage").val();  
		   document.location.href="/ictinfo/mainLoginOk.ict?id="+temp_id.value+"&backPageUrl="+backPageUrl;

	});  
 });

</script>
</body>
</html>