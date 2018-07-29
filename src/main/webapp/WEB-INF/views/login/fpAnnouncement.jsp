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
<link href="resources/style.css" rel="stylesheet" type="text/css">
<link href="./img/img_main/logo_ict.png" rel="shortcut icon">
<%-- 새로 추가할 CDN 입력하는 부분 시작 --%>
	<!-- 예 : <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script> -->
<%-- 새로 추가할 CDN 입력하는 부분 끝--%>



<%-- head.jsp --%>
<%@include file="./../include/main_css.jsp"%>


<style>
.container_body{
	margin : 0px auto;	
}

h2 {
	margin:50px 0px;
	text-align: center;
}


<!-- 여기에 CSS 코딩을 하세요 -->

#firstDiv01{
	text-align: center;

}

#firstDiv01{
	border:0px solid Yellow;
	width: 900px;
	height:auto;
	margin:0px auto;

	background-color:white;
	font:bold 20px "굴림";
}



#art04 {
	text-align: center;
	width:900px;

	clear:both;

}


#art04  .gallery {
    border: 0px solid #ccc;
}

#art04  .gallery:hover {
    border: 0px solid #777;
}

#art04  .gallery img {
    width: 100%;
    height: 400px;
}


#art04  .responsive {
    width: 70%;	/* 그림이 4개 이므로 25% 정도로 할당 */
	margin:0px auto;
}


#art04 #txt01{
	width:50%;
	height:30px;
	margin:10px;
	text-align:center;
	font:bold 18px "굴림";
}

#art04 #btngroup {
	border:0px solid white;
	padding:0px;

	margin:0px;
}

#art04 #btngroup .clbtn {
	border:0px solid white;
	width:70px;
	height:50px;
	font:bold 20px "굴림";
	background-color: #2196F3;
	color:white;
}

#art04 #btngroup .clbtn:hover {
	color:red;
	background-color: #0b7dda;
}



</style>



</head>
<body onload="mInit()" style="height:1020px">

<%-- main_header.jsp --%>
<%@include file="./../include/main_header.jsp"%>

	<div class="container_body">
	
		<!-- <h2 style="text-align:center"></h2> -->
		<h2 style="text-align:center"><input type="text" size="30" id="txt01" style="text-align:center;color:blue;font-weight:bold" readonly>	</h2>				
		
			 
		<div id="firstDiv01">
		
		<!-- 여기에 메인 코딩을 하세요 -->	
		
		
				<article id="art04">

					<span id="vCImg01" align="center"></span>/<span id="vTotImg01"></span>
					<div class="responsive">
						<div class="gallery">
							<img src="./img/img_fpa/_img_fpintro_01.png" alt="img01" onclick="a(this.src)">
						</div>
					</div>
					
					<br><br>	
					<div class="clearfix"></div>
						<!-- <input type="text" size="60" id="txt01" readonly> -->
						

					<div id="btngroup">
						<input type="button" class="clbtn" value="<<" onClick="mStart()">
						<input type="button" class="clbtn" value="<" onClick="mPrevios()">
						<input type="button" class="clbtn" value=">" onClick="mNext()">
						<input type="button" class="clbtn" value=">>" onClick="mEnd()">
					</div>

				</article>		
			
			
		
		</div>


	</div> <!-- container_body 끝-->	
	
	<br><br><br><br><br><br>

<%-- main_footer.jsp --%>
<%@include file="./../include/main_footer.jsp"%>

<%-- plugin_js.jsp --%>
<%@include file="./../include/main_js.jsp"%>

<!-- 여기 아래에 JavaScript 코딩을 작성하세요!!! -->
<script>	

var vObjTxt01;	
var vObjTxt02;
var vCImg;
var vTotImg;
var vIndex;
var vCimg=new Array(13);	
var vImgSrc=new Array(13);	// 배열 선언하기

var vMRName=["프로젝트 시연","시연 전체 내용",
				"발표자 인사 [먹짱 최창희]", "발표내용 & 시연 [먹짱 최창희]","발표자 교체[다크템플러]",
				"발표자 인사 [다크템플러 양동혁]", "발표내용 & 시연[다크템플러 양동혁]","마지막 발표자 교체[아는형님]",
				"발표자 인사 [아는형님 김대은]", "발표내용 & 시연[아는형님 김대은]","질의 응답[팀원 모두]",
				"팀원들 프로젝트 후기 및 소감","감사합니다!"];

function mInit(){		// forms[i]는 무조건 배열이다

	for(i=1;i<=vImgSrc.length;i++){					
		if(i<10){
			vImgSrc[i-1]="./img/img_fpa/_img_fpintro_0"+i+".png";	
		}else{
			vImgSrc[i-1]="./img/img_fpa/_img_fpintro_"+i+".png";
		}
	}


	vCImg=document.getElementById("vCImg01");
	vTotImg=document.getElementById("vTotImg01");
	vObjTxt01=document.getElementById("txt01");

	vCImg.innerHTML=1;
	vTotImg.innerHTML=vImgSrc.length;
	vObjTxt01.value="프로젝트 시연";

	vIndex=1;

}


function mStart(){
	vCImg.innerHTML=1;
	document.images[0].src=vImgSrc[0];
	vObjTxt01.value="프로젝트 시연";
	vIndex=1;
}

function mPrevios(){

	if(vIndex>1){
		vIndex--;

		vCImg.innerHTML=vIndex;
		document.images[0].src=vImgSrc[vIndex-1];
		vObjTxt01.value=vMRName[vIndex-1];
	}else{
		vObjTxt01.value="프로젝트 시연";
	}
}


function mNext(){


	if(vIndex<vImgSrc.length){

		vIndex++;

		vCImg.innerHTML=vIndex;
		document.images[0].src=vImgSrc[vIndex-1];
		vObjTxt01.value=vMRName[vIndex-1];
		
	}else{

		vCImg.innerHTML=vIndex;
		document.images[0].src=vImgSrc[vIndex-1];
		vObjTxt01.value=vMRName[vIndex-1];		

	}
	

}


function mEnd(){
	vCImg.innerHTML=vImgSrc.length;
	document.images[0].src=vImgSrc[6];
	vObjTxt01.value="";
	vObjTxt01.value="감사합니다!";
	vIndex=vImgSrc.length;
} 

	
	

</script>


</body>
</html>

