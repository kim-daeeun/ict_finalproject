<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>

<html>
<title>전남지역기업</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=466de404db02b12480c85d7a0c90ed16&libraries=services"></script>
<!-- <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=27703aefb48df81e1a6dd06ce7ab03f4&libraries=services"></script> -->

<link href="resources/style.css" rel="stylesheet" type="text/css">
<link href="./img/img_main/logo_ict.png" rel="shortcut icon">
<style>

	.container_body{
		max-width:1080px;
		text-align:center;
		margin:0px auto;
		min-height:600px;		
	}
		
	#cnhead{
		margin:50px auto;
	}
	
	.active{
		background-color:#F0E0FF;
	}
	
	.bizcontent{
		margin:10px auto;
	}
	
	#cnbiz{
		text-align:center;
		margin:30px auto;
	}
	
	#cnbiz li{
		background-color:#EFF0FF;
		border:1px solid #FFFFFF;

	}
	
	.table{
		margin:30px auto;
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
<%-- head.jsp --%>
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
	
		<c:otherwise>
			<body style="height:1020px">
		</c:otherwise>
	</c:choose>

<%-- main_header.jsp --%>
<%@include file="./../include/main_header.jsp"%>
	<section class="container_body">
	
	<h2 id="cnhead">전남지역 기업정보</h2>
	<div class="bizcontent">
	<ul class="nav nav-pills nav-stacked nav-justified" id="cnbiz" >
	    <li class="chk" id="gycity2"><a data-toggle="pill" href="#"> 광양 </a></li>
	    <li class="chk" id="njcity2"><a data-toggle="pill" href="#"> 나주 </a></li>
	    <li class="chk" id="mpcity2"><a data-toggle="pill" href="#"> 목포 </a></li>

  	</ul>
	</div>
		<!-- <h2 style="text-align:center">기업정보</h2>	
		<button type="button" class="btn btn-info btn-primary btn-inline" id="gycity"> 광양 </button>
		<button type="button" class="btn btn-info btn-primary btn-inline" id="njcity"> 나주 </button>
		<button type="button" class="btn btn-info btn-primary btn-inline" id="mpcity"> 목포 </button>	 -->	
	
 <!-- cotainer끝-->
	
	<div class="bizcontent">
  		<div id="map" style="width:100%;height:350px;"></div>
  	</div>
		
	<div class="bizcontent">   
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
			<c:forEach var="bizinfo" items="${bizList}" varStatus="status">
			<tr>
				<td>${bizinfo.bizcategory}</td>

				<td class="com_name">${bizinfo.company_name}</td> 

				<td>${bizinfo.biz_contents}</td>

				 <td>${bizinfo.phone_number}</td>

				 <td>${bizinfo.employee_cnt}</td>

				 <td>${bizinfo.addr01}</td>

				 <td>${bizinfo.addr02}</td>


				

				<td class="com_addr" onclick="com_addr(${status.index})"> ${bizinfo.company_addr}</td> 

				 
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
	
	</section>
	
	<%-- main_footer.jsp --%>
<%@include file="./../include/main_footer.jsp"%>

<%-- plugin_js.jsp --%>
<%@include file="./../include/main_js.jsp"%>
<script>


$(document).ready(function(){
	$("#gycity2").on("click",function(){
 		document.location.href="/ictinfo/gycity.ict";
	});
	
	$("#njcity2").on("click",function(){
		document.location.href="/ictinfo/njcity.ict";
	});
	
	$("#mpcity2").on("click",function(){
		document.location.href="/ictinfo/mpcity.ict";
	});
	
	$(".com_addr").mouseover(function(){
		$(this).css("cursor", "pointer");
	});
	
});

function init(number){
	 var chk =  document.getElementsByClassName("chk"); 
	  $(chk[number-1]).addClass("active");
	  com_addr(0);
}

function com_addr(obj){
	
	let temp = document.getElementsByClassName("com_addr");
	let com_temp = temp[obj].innerHTML;
	
	let com_len = com_temp.length;
	
	let temp1 = document.getElementsByClassName("com_name");
	let com = temp1[obj].innerHTML;
	
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

	// 지도를 생성합니다    
	var map = new daum.maps.Map(mapContainer, mapOption); 
	
	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new daum.maps.services.Geocoder();
	
	
	switch(com_len){
		
		case com_len:
			geocoder.addressSearch(com_temp,comaddr);		
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
