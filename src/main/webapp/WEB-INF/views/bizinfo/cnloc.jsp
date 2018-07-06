<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<%-- head.jsp --%>
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
	#cnbiz{
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
	
	<h2 id="cnbiz">전남지역 기업정보</h2>
	<ul class="nav nav-pills nav-stacked nav-justified" id="bizinform" >
	    <li id="gycity2"><a data-toggle="pill" href="gycity.ict" > 광양 </a></li>
	    <li id="njcity2"><a data-toggle="pill" href="njcity.ict" > 나주 </a></li>
	    <li id="mpcity2"><a data-toggle="pill" href="mpcity.ict" > 목포 </a></li>
  	</ul>
	
		<!-- <h2 style="text-align:center">기업정보</h2>	
		<button type="button" class="btn btn-info btn-primary btn-inline" id="gycity"> 광양 </button>
		<button type="button" class="btn btn-info btn-primary btn-inline" id="njcity"> 나주 </button>
		<button type="button" class="btn btn-info btn-primary btn-inline" id="mpcity"> 목포 </button>	 -->	
	
	</div> <!-- cotainer끝-->	
<script>
$(document).ready(function(){
	$("#gycity2").on("click",function(){
		var getbiz = {
				      "bizcategory" : "전남지역",
				      "addr01" : "전라남도",
				      "addr02" : "광양시"
			 		 }

	       var jsonData = JSON.stringify(getbiz);

				$.ajax({
					url: "/ictinfo/gycity.ict", // 서버에 전달할 파일명
					type: "post",
			        data : jsonData,
			        dataType : 'json',
			        contentType : 'application/json; charset=utf-8',
					/* data: {"bizcategory": bizcategory , "addr01": addr01 , "addr02" : addr02 }, */
					success: function(data) {
					      alert('Success'+ data) // 성공시 코드
					},
					 error: function (xhr, ajaxOptions, thrownError) {
			             alert("xhr.status : " + xhr.status);
			             alert("thrownError: " + thrownError);
			    }
			});
	});
/*  		document.location.href="/ictinfo/gycity.ict"; */
	$("#njcity2").on("click",function(){
		document.location.href="/ictinfo/njcity.ict";
	});
	$("#mpcity2").on("click",function(){
		document.location.href="/ictinfo/mpcity.ict";
	});
});
</script>

		<input type="hidden" name="bizcategory" id="bizcategory">                 
	    <input type="hidden" name="addr01" id="addr01">
	    <input type="hidden" name="addr02" id="addr02">
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
