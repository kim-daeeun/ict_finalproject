<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴</title>
</head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link href="resources/style.css" rel="stylesheet" type="text/css">
<link href="./img/img_main/logo_ict.png" rel="shortcut icon">
<%-- head.jsp --%>
<%@include file="./../include/main_css.jsp"%>

<style>
	.container_body{
		max-width:500px;
		margin : 0px auto;		
	}
	
	#joinDeletehead{
		margin:50px auto;	
	}
	
	form{
		margin-top:30px;
	}
	
	.form-control{
		margin: 10px 0px;
	}
	
	#input_pass, #input_error, #success{
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

	.login {
	 max-width: 500px;
 	 padding: 15px;
 	 margin: 0 auto;
	}

	#password{
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
		margin-bottom:20px;
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
	
	
	#deleteChk, #deleteCancel{
		text-align:center;
		margin: 10px 20px;
		max-width:40%;
		display:inline;
}
	
</style>
<body style="height:1020px">

	<%-- main_header.jsp --%>
	<%@include file="./../include/main_header.jsp"%>
	
<div class="container_body">
	<h2 style="text-align:center" id="joinDeletehead"> 회원 탈퇴 </h2>
	<form action="joinDelete.ict" method="post" >
	
	 <img src="./img/img_join/join_deleteForm.jpg" id="main">
		<!-- 아이디가 입력되지 않은 경우 -->
			<div id="input_pass">
			   <div id="explain">
			   <p class="head"></p>
			   	<img src="./img/img_login/img_loginfail.png"><br>
			    <p class="error01">비밀번호를 입력해 주세요.</p>
			    <button type="button" class="btn btn-warning" onclick="clickoff()">돌아가기</button>
			   </div>
		   </div>
   
		   <!-- 아이디 또는 비밀번호가 틀린경우 -->
		   <div id="input_error">
			   <div id="explain">
			   <p class="head"></p>
			   <img src="./img/img_login/img_loginfail.png"><br>
			    <p class="error02"> 비밀번호가 잘못되었습니다.</p>
			    <button type="button" class="btn btn-danger" onclick="clickoff()">돌아가기</button>
			   </div>
		   </div>
	   
	   		<!-- 로그인에 성공했을 경우 -->
		   <div id="success">
			   <div id="explain">
			   	<p class="head"></p>
			    <img src="./img/img_join/img_memDelete.jpg"><br>
			    <p class="success03"><a id="inputid"></a> 정말로 탈퇴하겠습니까 </p> 
			    <button type="button" id="forwardid" class="btn btn-danger"> 탈퇴하기 </button>
			    <button type="button" id="cancel" class="btn btn-default"> 뒤로가기 </button>		    
			   </div>
		   </div>
		   
		   <div class="form-group">
			<label for="id"> 아이디 : </label>
			<input type="text" class="form-control" name="id" id="id" value="${id}" readonly>
		</div>
		   
		<div class="form-group">
			<label for="password">비밀번호를 입력하세요 : </label>
			<input type="password" class="form-control" name="password" id="password">
		</div>
		<div class="form-group">
			<button type="button" class="btn btn-warning btn-block" id="deleteChk">	회원탈퇴 </button>
        	<button type="reset" class="btn btn-info btn-block" id="deleteCancel"> 탈퇴취소 </button>
		</div>
		
	   
			<div id="error1"></div>
			
			
	</form> 
</div>

<%-- main_footer.jsp --%>
<%@include file="./../include/main_footer.jsp"%>

<%-- plugin_js.jsp --%>
<%@include file="./../include/main_js.jsp"%>
<script>
$(function(){
	$("#deleteChk").on("click",function(){	

		let pass=$("#password").val().trim();
	
		if(pass == null || pass.length==0){
			showhowto1();
			return false;
			
		}else{			
			$.ajax({
				 type:"POST",
				 url:"/ictinfo/joinPassChk.ict",	
				 dataType:"json", 
				 data: {
					 "password":pass
				 },	
				 success:function(data){
					if(data==1){
						showhowto1();
					}else if(data==2){
						showhowto2();
					}else{						
						showhowto3();
				 	}
				 },			

			});	
		}		
			 	 
	 });
	
	$("#forwardid").on("click",function(){
			alert('회원 탈퇴에 성공하셨습니다.')
		   document.location.href="/ictinfo/joinDelete.ict";
	});
	
	$("#cancel").on("click",function(){
		   document.location.href="/ictinfo/joinDeleteForm.ict";
	});
	
	$("#deleteCancel").on("click",function(){
		document.location.href="main.ict";
	});
	
}); 


function showhowto1(){
	 document.getElementById("input_pass").style.display="block";
}

function showhowto2(){
	 document.getElementById("input_error").style.display="block";
}

function showhowto3(){
	 document.getElementById("success").style.display="block"; 
}

function clickoff(){
	document.getElementById("input_pass").style.display="none";
	document.getElementById("input_error").style.display="none";
	document.getElementById("success").style.display="none";
}

</script>
	          
</body>
</html>