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

<%-- 새로 추가할 CDN 입력하는 부분 --%>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<%-- 새로 추가할 CDN 입력하는 부분 --%>


<%-- head.jsp --%>
<%@include file="./../include/main_css.jsp"%>




<style>

	.container_body{
		max-width:500px;
		margin : 0px auto;	
	}
	h2{
		margin : 50px 0px;
		text-align: center;
	}
 	.form-control{
		margin : 0px 5px;
	} 
	form{
		padding : 0px 10px;
	}

	#address1{
		margin-bottom: 10px;
	}
	#address2{
		max-width:75%;
		display:inline-block;
	}
  	#addrSearch{
  		max-width:25%;
		display:inline-block;
		float : right;
	}  
	#join{
		width:40%;
		margin-left:10px;
	}
	#cancel{
		width:40%;
		margin-right:10px;
		float:right;
	}
</style>

</head>
<body style="height:1020px">

<%-- main_header.jsp --%>
<%@include file="./../include/main_header.jsp"%>

		<div class="container_body">
  <h2>ICT 취준생을 위한 정보망</h2>
  
  
  
<form action="/ictinfo/joinConfirm.bbs" method="post" >
	<div class="form-group">
      <label for="name">이름:</label>
      <input type="text" class="form-control" id="name" placeholder="이름을 입력해주세요" name="name">
    </div>
	<div class="form-group">
      <label for="id">ID :</label>
      <input type="text" class="form-control" id="id" placeholder="아이디는 6~15자 영문자 숫자 조합입니다." name="id">
    </div>
    <div id="idCheckStatus"></div>
	<div class="form-group">
      <label for="password">비밀번호 :</label>
      <input type="password" class="form-control" id="password" placeholder="비밀번호는 8자 이상 영문자, 숫자, 특수문자의 조합이어야 합니다." name="password">
    </div>
	<div class="form-group">
      <label for="password_check">비밀번호 확인:</label>
      <input type="password" class="form-control" id="password_check" placeholder="비밀번호를 다시 한번 입력해주세요" name="password_check">
      <div id="passCheckStatus"></div>
    </div>
    <div class="form-group">
      <label for="email">Email:</label>
      <input type="email" class="form-control" id="email" placeholder="@를 포함한 이메일 주소를 입력해주세요" name="email">
    </div>
    <div class="form-group">
      <label for="phoneNumber">전화번호:</label>
      <input type="text" class="form-control" id="phoneNumber" placeholder=" '-'를 포함한 전화번호를 입력해주세요" pattern="[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}" name="phoneNumber">
    </div>
    <div class="form-group">
      <label for="address1">주소 : </label>
      <input type="text" class="form-control" id="address1" placeholder="주소검색을 눌러주세요" name="address1">
      <label for="address2">상세주소 : </label><br/>
      <input type="text" class="form-control" id="address2" name="address2">
      <button type="button" class="btn btn-default btn-info" id="addrSearch"> 주소검색</button>
    </div>
    <div class="form-group">
	    <button type="submit" class="btn btn-default" id="join">확인</button>
	    <button type="reset" class="btn btn-default" id="cancel">취소 </button>
    </div>
  </form>
</div>

<%-- main_footer.jsp --%>
<%@include file="./../include/main_footer.jsp"%>

<%-- plugin_js.jsp --%>
<%@include file="./../include/main_js.jsp"%>


<script>
$.ajaxSetup({
	type : "POST",
	async : true,
	dataType : "json",
	error : function(xhr){
		alert("error html = " + xhr.statusText);
	}
});

 $(function(){
//		아이디 중복체크
	 $("#id").on("blur", function(){	
		 if($("#id").val().trim().length!=0){
		 $.ajax({			 
			url:"/ictinfo/joinIdCheck.bbs",					
			data:{				
				id:$('#id').val()				
			},
			success : function(data) {				
				let html;
				if(data==1){
					let reg=/^(?=.*[a-zA-Z])(?=.*[0-9]).{6,15}$/;
//				 	let reg= new RegExp('//');
					let result = reg.test($("#id").val().trim());
					if(!result){
						html="<b>아이디는 6~15자로 만들어야 합니다.</b>";
						$("#idCheckStatus").html(html).css("color","red");
						$("#id").focus();
					}
					else{
						html="<b>사용할 수 있는 아이디입니다.</b>";
						$("#idCheckStatus").html(html).css("color","green");
						$("#password").focus();
					}
				}else{
					html="<b>중복된 아이디입니다.</b>";
					$("#idCheckStatus").html(html).css("color","red");
					$("#id").focus();
					$("#id").select();
					} 				
				}					
			}); 
		 }else{
			 html="<b>아이디를 입력하지 않으셨습니다.</b>";
			$("#idCheckStatus").html(html).css("color","orange");
			$("#id").focus();
		}
	 });	 
	$("#password_check").on("blur", function(){
		let html;
		let pass=$("#password").val().trim();
		let passCheck=$("#password_check").val().trim();
		let reg=/^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,16}$/;
//	 	let reg= new RegExp('//');
		let result = reg.test($("#password").val().trim());
		if(pass==null|| pass.length==0){
				html="<b>비밀번호를 입력하지 않았습니다.</b>";
				$("#passCheckStatus").html(html).css("color","orange");
				$("#password").focus();
		}
		
		else if(pass!=passCheck){
				html="<b>비밀번호가 맞지 않습니다.</b>";
				$("#passCheckStatus").html(html).css("color","red");
		}
		else{
			if(!result){
				html="<b>패스워드는 8자 이상 영문자, 숫자, 특수문자의 조합이어야 합니다.</b>";
				$("#passCheckStatus").html(html).css("color","red");
				$("#password").focus();
			}
			else{
				html="<b>비밀번호가 일치합니다.</b>";
				$("#passCheckStatus").html(html).css("color","green");
				$("#email").focus();
			}
		}
	});


// 주소검색 API	
	$("#addrSearch").on("click",function(){
		getDaumAddress();
	 });
// 각종 유효성 검사(아이디 및 비밀번호의 길이, 이메일의 형식 등..)
	$("input[type=submit]").on("click",function(){
		checkName($("#name").val().trim());
		/* checkId($("#id").val().trim()); */
/* 		checkPass($("#password").val().trim()); */
		checkEmail($("#email").val().trim());
		checkTel($("#phoneNumber").val().trim());
		return true;
	});
});

	function getDaumAddress(){
	     new daum.Postcode({            
	         oncomplete: function(data) {
	            $('#postcode1').val(data.postcode1);
	             $('#postcode2').val(data.postcode2);
	             $('#address1').val(data.roadAddress);
	             $('#address2').focus();               
	         }
		}).open();
	}
 	
	function strTrim(str){
		 return str.replace(/(^\s*)|(\s*$)/g, "");
	}
// /: 문자열 시작
// ^: 문자열의 처음
// \s* : 임이의 개수 공백문자
// | : or
// $ : 문자열의 끝
// g : 문자열의 모든부분에 걸쳐 글로벌하게 치환
// '' : 치환할 빈 문자열
// 빈 문자열로 치환 -> 기존 문자열 삭제
	function checkName(name){
		if(name.length<2||name>5){
			alert("이름을 정확히 입력해주세요.");
			return false;
		}
	}
	
/* 	function checkId(id){
		let reg=/^(?=.*[a-zA-Z])(?=.*[0-9]).{6,15}$/;
//	 	let reg= new RegExp('//');
		let result = reg.test(id);
		if(!result){
				alert("아이디는 6자 이상 15자 이하 영문자 숫자 조합으로 작성해주셔야 합니다.");
				return false;
			}	
	} */
	
/* 	function checkPass(password){
		let reg=/^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,16}$/;
// 	let reg= new RegExp('//');
		let result = reg.test(password);
		if(!result){
			alert("패스워드는 8자 이상 영문자, 숫자, 특수문자의 조합이어야 합니다.");
			return false;
		}
	} */
	function checkEmail(email){
//		이메일 주소 중 아이디가 알파벳 혹은 숫자로 시작해야함. 
//		* : 0회여도 되고 한번 이상이여도 된다. / + : 무조건 한번 이상 반복
//		회사 도메인명 다음에 마침표를 찍고, co/ com/ 등을 구별해준다
//		([a-zA-Z]{2,6}) : com, museum, travel, kr 등 도메인을 정의.
		let reg =/^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/;
//		let reg=/[a-zA-Z][0-9a-zA-Z\\-.]*[a-zA-Z0-9]@([a-zA-Z][0-9a-zA-Z\\-]*[a-zA-Z0-9]\\.){1,2}[a-zA-Z]{2,3}/;
// 	let reg= new RegExp('//');
		let result = reg.test(email);
		if(!result){
			alert("이메일 형식에 오류가 있습니다.");
			return false;
		}
	}

	
	
</script>


</body>
</html>

