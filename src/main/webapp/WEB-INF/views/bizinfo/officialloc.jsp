<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	.btn-inline{
		max-width:20%;
	}
	.table{
		max-width:70%;
		margin:10px auto;
	}
	#officialbiz{
		text-align:center;
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
	
	<h2 id="officialbiz">공공기관 기업정보</h2>
	<ul class="nav nav-pills nav-stacked nav-justified" >
	    <li id="gjofficial2"><a data-toggle="pill" href="gjofficial.ict"> 광주 </a></li>
	    <li id="njofficial2"><a data-toggle="pill" href="njofficial.ict"> 나주 </a></li>
  	</ul>
		<!-- <h2 style="text-align:center">기업정보</h2>	
		<button type="button" class="btn btn-info btn-primary btn-inline" id="gjofficial"> 광주 </button>
		<button type="button" class="btn btn-info btn-primary btn-inline" id="njofficial"> 나주 </button>				
	 -->
	</div> <!-- cotainer끝-->	
<script>
$(function(){
	$("#gjofficial2").on("click",function(){
		document.location.href="/ictinfo/gjofficial.ict";
	});
	$("#njofficial2").on("click",function(){
		document.location.href="/ictinfo/njofficial.ict";
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
