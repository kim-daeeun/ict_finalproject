<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>



<%@include file="./../include/main_css.jsp"%>
<style>
	.container{
		max-width:500px;		
	}
/* 	#biz{
		margin:10px auto;
		text-align:center;
		border:1px solid #000000;
	} */
	.table{
		max-width:70%;
		margin:10px auto;
	}
 	#gjbiz{
 		text-align:center
 	}
	td{
		border:1px solid #000000;
		max-width:130px;
		overflow:hidden;
		text-align:center;
	}
	tr:nth-child(odd){
	background-color: #F0F0FF
	}

</style>

<body style="height:1020px">

<%-- main_header.jsp --%>
<%@include file="./../include/main_header.jsp"%>
	<div class="container">
	<h2 id="gjbiz">광주지역 기업정보</h2>
	
	<ul class="nav nav-pills nav-stacked nav-justified">
	    <li id="donggu2"><a data-toggle="pill" href="donggu.ict"> 동구 </a></li>
	    <li id="seogu2"><a data-toggle="pill" href="seogu.ict" > 서구 </a></li>
	    <li id="namgu2"><a data-toggle="pill" href="namgu.ict" > 남구 </a></li>
	    <li id="bukgu2"><a data-toggle="pill" href="bukgu.ict" > 북구 </a></li>
  		<li id="gsgu2"><a data-toggle="pill" href="gsgu.ict" > 광산구 </a></li>
  	</ul>
  	  <!-- 
	
		<h2 style="text-align:center">기업정보</h2>	
		<button type="button" class="btn btn-info btn-primary btn-inline" id="donggu"> 동구 </button>
		<button type="button" class="btn btn-info btn-primary btn-inline" id="seogu"> 서구 </button>
		<button type="button" class="btn btn-info btn-primary btn-inline" id="namgu"> 남구 </button>
		<button type="button" class="btn btn-info btn-primary btn-inline" id="bukgu"> 북구 </button>
		<button type="button" class="btn btn-info btn-primary btn-inline" id="gsgu"> 광산구 </button>	 -->
	
	</div> <!-- cotainer끝-->	
<script>
$(function(){
	$("#donggu2").on("click",function(){
	
		var getbiz = {
				bizcategory: "광주지역",
				addr01: "광주광역시",
				addr02: "동구"
		};
					 
		$.ajax({
		    url: "/ictinfo/donggu.ict",
		    method: "post",
		    type: getbiz,
		    contentType: "application/getbiz",
		    data: JSON.stringify(getbiz),
		    success: function(data) {
		    alert(data);
	   	 	}
		});
	});
	$("#seogu2").on("click",function(){
		document.location.href="/ictinfo/seogu.ict";
	});
	$("#namgu2").on("click",function(){
 		document.location.href="/ictinfo/namgu.ict";
	});
	$("#bukgu2").on("click",function(){
 		document.location.href="/ictinfo/bukgu.ict"; 
	});
	$("#gsgu2").on("click",function(){
		document.location.href="/ictinfo/gsgu.ict"; 
	});
});
</script>
	<input type="hidden" name="bizcategory" value="${getbiz.bizcategory}">                 
    <input type="hidden" name="addr01" value="${getbiz.addr01}">
    <input type="hidden" name="addr02" value="${getbiz.addr02}">
		<table class="table table-bordered">
			<tr class="active">
				<td>카테고리</td>
				<td>기업 이름</td> 
				<td>사업 내용</td>
				<td>전화번호</td>
				<td>사원수</td>
				<td>광역시,도</td>
				<td>상세주소</td>
				<td>회사주소</td>
				<td>홈페이지</td>
				<td>회사 설립일</td>
			</tr>
			<c:forEach var="bizinfo" items="${bizList}">
			<tr>
				<td>${bizinfo.bizcategory}</td>

				<td>${bizinfo.company_name}</td>

				<td>${bizinfo.biz_contents}</td>

				 <td>${bizinfo.phone_number}</td>

				 <td>${bizinfo.employee_cnt}</td>

				 <td>${bizinfo.addr01}</td>

				 <td>${bizinfo.addr02}</td>

				 <td>${bizinfo.company_addr}</td>

				 <td>${bizinfo.homepage}</td>

				 <td>${bizinfo.establish_date}</td>
			</tr>
			</c:forEach>
		</table>

	
	<%-- main_footer.jsp --%>
<%@include file="./../include/main_footer.jsp"%>

<%-- plugin_js.jsp --%>
<%@include file="./../include/main_js.jsp"%>
</body>
</html>
