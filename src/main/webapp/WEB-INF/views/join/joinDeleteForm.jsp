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
<style>
	.container_body{
		max-width:500px;
		margin : 0px auto;		
	}
	.form-control{
		margin : 0px 5px;
	}
	form{
		margin-top:30px;
	}
</style>
<body>
<div class="container_body">
<form action="/ictinfo/joinDelete.bbs" method="post" >
	<div class="form-group">
		<label for="password">비밀번호를 입력하세요 : </label>
		<input type="password" class="form-control" name="password" id="password">
	</div>
	<div class="form-group">	
          <input type="submit" value="확인">
          <input type="reset" value="취소"> 
	</div>
	</form> 
</div>	          
</body>
</html>