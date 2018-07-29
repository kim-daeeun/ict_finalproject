<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> 
<link href="resources/style.css" rel="stylesheet" type="text/css">
<link href="./img/img_main/logo_ict.png" rel="shortcut icon">
<%@include file="./../include/main_css.jsp"%>

<style>
	.container_body{
		max-width:500px;
		margin : 0px auto;		
	}
	.form-control{
		margin : 0px 5px;
	}
	form{
		padding : 10px;
	}
	h2{
		margin : 50px 0px;
	}
	#address1{
		margin-bottom: 10px;
	}
	#address2{
		display:inline-block;
	}
  	#addrSearch{
  		max-width:25%;
		display:inline-block;
		float : right;
	}  
	#btn_group{
		text-align:center;
		margin: 20px auto;
	}

</style>

</head>

<body style="height:1020px">
	
<%-- main_header.jsp --%>
<%@include file="./../include/main_header.jsp"%>


	<div class="container_body">
  		<h2 align="center"> 회원 정보 </h2>
		
		<div class="form-group">
     		<label for="name">이름:</label>
      		<input type="text" class="form-control" id="name" value="${memjoin.name}" name="name" readonly>
    	</div>
		<div class="form-group">
      <label for="id">ID :</label>
      <input type="text" class="form-control" id="id" value="${id}" readonly="readonly"  name="id" readonly>
    </div>
    <div id="idCheckStatus"></div>
	<div class="form-group">
      <label for="password">비밀번호 :</label>
      <input type="password" class="form-control" id="password" value="${memjoin.password}" name="password" readonly>
    </div>
    <div class="form-group">
      <label for="email">Email:</label>
      <input type="email" class="form-control" id="email"  value="${memjoin.email}" name="email" readonly>
    </div>
    <div class="form-group">
      <label for="phoneNumber">전화번호:</label>
      <input type="text" class="form-control" id="phoneNumber" value="${memjoin.phoneNumber}" pattern="[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}" name="phoneNumber" readonly>
    </div>
    <div class="form-group">
      <label for="address1">주소 : </label>
      <input type="text" class="form-control" id="address1"  value="${memjoin.address1}" name="address1" readonly>
      <label for="address2">상세주소 : </label>
      <input type="text" class="form-control" id="address2" value="${memjoin.address2}" name="address2" readonly>
    </div>
    	<div class="form-group" id="btn_group">
	    	<button type="button" class="btn btn-info" id="update"> 회원정보 수정 </button>
	    	<button type="button" class="btn btn-danger" id="delete"> 회원탈퇴 </button>
	    	<button type="button" class="btn btn-info" id="main"> 돌아가기 </button>
    	</div>

	</div>

   
   
<%-- main_footer.jsp --%>
<%@include file="./../include/main_footer.jsp"%>

<%-- plugin_js.jsp --%>
<%@include file="./../include/main_js.jsp"%>
<script>

$(document).ready(function(){
	$("#update").on("click",function(){
		document.location.href="joinUpdate.ict";
	});
	$("#delete").on("click",function(){
		document.location.href="joinDeleteForm.ict";
	});
	$("#main").on("click",function(){
		document.location.href="main.ict";
	});
}); 

</script>
</body>
</html>