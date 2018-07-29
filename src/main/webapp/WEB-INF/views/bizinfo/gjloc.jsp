<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<title>광주지역기업</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=466de404db02b12480c85d7a0c90ed16&libraries=services"></script>
<!-- 창희 키<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ca8f227bd413aa26c9c8d2a7f52a7df6&libraries=services"></script> -->
<link href="resources/style.css" rel="stylesheet" type="text/css">
<link href="./img/img_main/logo_ict.png" rel="shortcut icon">
<style>
.container_body{
	max-width:1080px;
	text-align:center;
	margin:0px auto;
	min-height:600px;			
}
	
#gjhead{
	margin:50px auto;
}
	
.active{
	background-color:#FFF0FF;
}

.bizcontent{
	margin:10px auto;
}

#gjbiz{
	text-align:center;
	margin:5px auto;
}

#gjbiz li{
	background-color:#EFF0FF;
	border:1px solid #FFFFFF;

}

.table{
	margin:10px auto;
}

td{
	border:1px solid #000000;
	max-width:130px;
	overflow:hidden;
	text-align:center;
}

tr:nth-child(odd){
	background-color: #F0F0FF;
}

</style>


<%@include file="./../include/main_css.jsp"%>
<c:set var="chkNo" value="${chkIndex}">
</c:set>
	<c:choose>
		<c:when test="${chkNo eq '1'}">
			<body onload="init(1)" style="height:1020px">
		</c:when>
		
		<c:when test="${chkNo eq '2'}">
			<body onload="init(2)" style="height:1020px">
		</c:when>
		
		<c:when test="${chkNo eq '3'}">
			<body onload="init(3)" style="height:1020px">
		</c:when>
		
		<c:when test="${chkNo eq '4'}">
			<body onload="init(4)" style="height:1020px">
		</c:when>
		
		<c:when test="${chkNo eq '5'}">
			<body onload="init(5)" style="height:1020px">
		</c:when>
		
		<c:otherwise>
			<body style="height:1020px">
		</c:otherwise>
	</c:choose>

<%-- main_header.jsp --%>
<%@include file="./../include/main_header.jsp"%>
	<section class="container_body">
	<h2 id="gjhead">광주지역 기업정보</h2>
	<div class="bizcontent">
		<ul class="nav nav-pills nav-stacked nav-justified" id="gjbiz">
		    <li class="chk" id="donggu2"><a data-toggle="pill" href="#"> 동구 </a></li>
		    <li class="chk" id="seogu2"><a data-toggle="pill" href="#" > 서구 </a></li>
		    <li class="chk" id="namgu2"><a data-toggle="pill" href="#" > 남구 </a></li>
		    <li class="chk" id="bukgu2"><a data-toggle="pill" href="#" > 북구 </a></li>
	  		<li class="chk" id="gsgu2"><a data-toggle="pill" href="#" > 광산구 </a></li>
	  	</ul>
  	</div>
  	
  	<div class="bizcontent">
  		<div id="map" style="width:100%;height:350px;"></div>
  	</div>

	<div class="bizcontent">             
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
				<c:forEach var="bizinfo" items="${bizList}" varStatus="status">
				<tr>
					<td>${bizinfo.bizcategory}</td>
	
					<td class="gjloc_name">${bizinfo.company_name}</td>
	
					<td>${bizinfo.biz_contents}</td>
	
					 <td>${bizinfo.phone_number}</td>
	
					 <td>${bizinfo.employee_cnt}</td>
	
					 <td>${bizinfo.addr01}</td>
	
					 <td>${bizinfo.addr02}</td>
	
					 <td class="gjloc_addr" onclick="gjlocaddr(${status.index})">${bizinfo.company_addr}</td>
	
					 <c:if test="${null ne bizinfo.homepage}">
						<td><a href="http://${bizinfo.homepage}" target="_blank">${bizinfo.homepage}</a></td>
					 </c:if>
					 <c:if test="${null eq bizinfo.homepage}">
					 	<td>${bizinfo.homepage}</td>
					 </c:if>
	
					 <td>${bizinfo.establish_date}</td>
				</tr>
				</c:forEach>
			</table>
		</div>
	</section> <!-- cotainer끝-->	

	
	<%-- main_footer.jsp --%>
<%@include file="./../include/main_footer.jsp"%>

<%-- plugin_js.jsp --%>
<%@include file="./../include/main_js.jsp"%>

<script>
$(function(){
	$("#donggu2").on("click",function(){
		document.location.href="/ictinfo/donggu.ict";
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
	
	$(".gjloc_addr").mouseover(function(){
		$(this).css("cursor", "pointer");
	});
});

function init(number){
	 var chk =  document.getElementsByClassName("chk"); 
	  $(chk[number-1]).addClass("active");
	  gjlocaddr(0);
}

function gjlocaddr(obj){
	
	let gjloc = document.getElementsByClassName("gjloc_addr");
	let gjloc_temp = gjloc[obj].innerHTML;
	
	let gjloc_len = gjloc_temp.length;
	
	let gj_name = document.getElementsByClassName("gjloc_name");
	let com = gj_name[obj].innerHTML;
	
	var mapContainer = document.getElementById("map"); 		// 지도를 표시할 div 
    var mapOption = {
        center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };
	
	// 지도를 생성합니다    
	var map = new daum.maps.Map(mapContainer, mapOption); 
	
	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new daum.maps.services.Geocoder();	
	
	switch(gjloc_len){		
		case gjloc_len:
			geocoder.addressSearch(gjloc_temp,comaddr);		
	}	
		
	function comaddr(result, status) {	
	
		// 정상적으로 검색이 완료됐으면 
		if (status === daum.maps.services.Status.OK) {		
		        var coords = new daum.maps.LatLng(result[0].y, result[0].x);
		
		        // 결과값으로 받은 위치를 마커로 표시합니다
		        var marker = new daum.maps.Marker({
		            map: map,
		            position: coords
		        });
		
		        // 인포윈도우로 장소에 대한 설명을 표시합니다
		        var infowindow = new daum.maps.InfoWindow({	        
		        	content:com
		        });
		        infowindow.open(map, marker);
		
		        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		        map.setCenter(coords);
		}
	};
};

</script>

</body>
</html>
