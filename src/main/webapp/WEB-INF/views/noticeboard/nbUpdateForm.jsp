<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>

<head>

<title>공지사항[수정하기]</title>
<meta charset="UTF-8">
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
	margin :0px auto;
	text-align:center;
	max-width:700px;	
}

h2 {
	margin-top:50px;
	text-align: center;
}

#update_title, #update_content{
	display:block;
	border:none;
}
#update_title{
	width:95%;
}
.fileDrop {
	width:95%;
	height: 100px;
	border: 1px solid #000000;
	margin: auto,0;
	align: center;
}

.leftside{
	max-width:30%;
}

small {
	margin-left: 3px;
	font-weight: bold;
	color: gray;
}

<!-- 여기에 CSS 코딩을 하세요 -->


</style>


</head>
<body style="height:1080px" onload="init()">

<%-- main_header.jsp --%>
<%@include file="./../include/main_header.jsp"%>

	<div class="container_body">
	
		<h2 style="text-align:center">공지사항(수정하기)</h2>	
<!-- 						
		<div class="test01 col-md-push-2 col-md-8">		 -->
		<form action="/ictinfo/nbUpdate.ict" method="post" >
		<input type="hidden" name="articleNum" value="${articleNum}">
		<input type="hidden" name="pageNum" value="${pageNum}">
		
		<input type="hidden" name="fileStatus" value="${fileStatus}">
		<input type="hidden" name="fileCount" value="${fileCount}">
		
		
		<table class="table table-bordered">  
			<tr>
				 <td class="leftside">글쓴이 </td> 
				 <td class="rightside">${id}</td> 
			</tr>
			<tr>	 
				 <td class="leftside">제목 : </td>
				 <td class="rightside"><input type="text" name="title" value="${article.title}" id="update_title" class="form-control"></td>			 
			</tr>
			<tr>
				  <td colspan="2">
				  <textarea cols="70" rows="20" name="content" id="update_content" class="form-control">${article.content}</textarea>
				  </td>
			</tr>
			<tr>	  
				  <td class="leftside">첨부된 파일 :</td>
				  <td>
					   <c:if test="${fileList!=null}">
						   <ul id="delGroup">
							    <c:forEach var="storedFname" items="${fileList}">
								    <li id="existedFiles">${storedFname.substring(storedFname.indexOf("_")+1)}
								    	<button type="button" deleteFileName="${storedFname}" class="btn btn-warning delFile"> 삭제 </button>
								    </li>
							    </c:forEach>
						   </ul>
					   </c:if>
				   </td>
			</tr>  
		    
		    <tr>
				<td colspan="2">
			     	<div class='fileDrop'></div>
						<!-- <button type="button" id="allDelete" class="btn btn-md btn-danger"> 모두삭제 </button> -->
					<div class='uploadedList'></div>
				</td>
			</tr>
		    <tr>
				<td colspan="2">
					<input type="file"  multiple="multiple" id="ajaxFile" style="display:none;">
				  	<button type="button" class="btn btn-primary" onClick="ajaxFileUpload()" id="Update_file"> 파일 업로드 </button>
				  	<button type="button" class="btn btn-danger" id="update_delete"> 파일 모두삭제</button>
					<button type="submit" class="btn btn-primary"> 수정하기 </button> 
					<button type="reset" class="btn btn-warning"> 수정하기취소</button>
					<button type="button" class="btn btn-primary" onclick="document.location.href='/ictinfo/nbList.ict?pageNum=${pageNum}'"> 목록으로 </button>
				</td>
			</tr>
			
		</table>
			
		</form>	
						
<!-- 	</div> -->
	
</div> <!-- container_body 끝-->	

<%-- main_footer.jsp --%>
<%@include file="./../include/main_footer.jsp"%>

<%-- plugin_js.jsp --%>
<%@include file="./../include/main_js.jsp"%>

<!-- 여기 아래에 JavaScript 코딩을 작성하세요!!! -->
<script>


/* 
$(document).ready(function(){
	
	let fileName = $("#existedFiles").text();
	alert(fileName);
	
	if(checkImageType(fileName)){			// 이미지 파일이면(s_파일이름.jpg)
		str ="<div><img src='nbDisplayFile.ict?fileName="+fileName+"'/>"	
			  +"<small class='allDeleteFilesClass' data-src='"+fileName+"'>X</small>"
			  
				  /*이미지 파일일 경우에는 이름에 s_가 포함됭어 있으므로 테이블에 바로 입력하면
			  다운로드시 썸네일 파일을 다운로드 받게됨.. 이름에 s_제거하고 테이블에 입력 
			  +"<input type='hidden' name='fileNames' value='"+getImageLink(fileName)+"'></div>";		
				  
		  // alert("str >>>>>>>>>>>>  : "+str);								  
				  
	 }else{								// 이미지 파일이 아니면
		str = "<div>" + getOriginalName(fileName)
				+ "<small class='allDeleteFilesClass' data-src='"+fileName+"'>X</small>"
					// small 은 CSS 적용됨
				  +"<input type='hidden' name='fileNames' value='"+fileName+"'></div>";
	 }	  
				  
				// ■ ■ ■ 파일 이름의 받아와서 DB에 넣기 위해 파일 이름 DTO에 저장
			           // 위에다가 hidden 태그 추가, div에 추가  하기
			           // str += "<input type='hidden' name='files' value='"+fileName+"'>";        			
			
			
	$(".uploadedList").append(str);	// 업로드한 파일을 뿌려주는 장소
					 

});


 */




$(document).ready(function(){
	// id 값으로 읽어 오려면 하나만 선택되어짐.. 클래스 사용
	$(".delFile").on("click", function(){
		alert($(this).attr("deleteFileName"));
		//deleteFileName이 원래 있던 속성이 아니므로 아래처럼 하면 못 읽어옴
		// let storedFname=$(this).prop("deleteFileName");
		let storedFname=$(this).attr("deleteFileName");
		$(this).parent().remove();
		
		let deleteFileName="<input type='hidden' name='deleteFileName' value='"+storedFname+"'>";
		$(deleteFileName).appendTo("form");	// appendTo 는 폼태그 안의 맨 아래에 삽입하라
	})
});


//글쓰기 취소시에 업로드 되어 있는 파일 삭제
$("input[type=reset]").on("click",function(){
	allDeleteFiles();
});

///////////////////////////////////////////////////////////////////////

$(".fileDrop").on("dragenter dragover", function(event){
	event.preventDefault();		// 파일이 업로드 영역으로 들어가서 펼쳐지지 않게 함
});

$(".fileDrop").on("drop", function(event){
	event.preventDefault();	
//		event.originalEvent는 순수한 원래의 DOM이벤트를 가지고 옴
//	JQuery를 사용할경우  순수한 DOM이벤트가 아님
//	dataTransfer는 이벤트와 같이 전달된 데이터를 의미
//	그 안에 포함된 파일 데이터를 찾아내기 위해 dataTransfer.files
//	를 사용함	
	let files = event.originalEvent.dataTransfer.files;		// files 라는 배열에 들어간다	
//		var file = files[0];
//		파일이름을 바로 알아낼수 있음
//		file.name;
//		alert(file.name+"입니다")
				
	let formData = new FormData();							// index는 0번째, 1번째 업로드한 파일의 인덱스가 담겨있다
	$.each(files,function(index,item){						// file 이름을 formData에 담는다. item에는 업로드한 파일이 들어온다
		formData.append("multiFile", item);					// 키이름은 multiFile 이다
	});		
	
	$.ajax({
		  url: '/ictinfo/nbUploadAjax.ict',
		  data: formData,
//			  복수개를 업로드시 
		  dataType:'json',	// json 타입으로 받을것이다
		  
//			  processData: false는
//			  데이터를 일반적인 query string으로 변활할 것인지를 결정, 기본값은 true , 
//			  'application/x-www-form-urlencoded' 타입으로 전송, 다른 형식으로 데이터를
//			  보내기 위하여 자동 변환하고 싶지 않은 경우는 false로 지정
		  processData: false,	// processData, contentType 2개가 들어오면 Query String이 아니라 파일이 들어온다는것을 컨테이너가 안다
		  
//			  contentType: false 는
//			  기본값은 'application/x-www-form-urlencoded', 파일의 경우 'multipart/form-data'
//			  방식으로 전송하기 위해서 false
		  contentType: false,
		  type: 'POST',
		  
		  // 여기에 날짜가 붙은 썸네일 이미지나 파일들이 들어온다. list가 들어온다
		  success: function(data){
			  let str ="";				 
			  // alert(data);	
			  
			  $.each(data,function(index, fileName){	// fileName은 S_가 포함되어 있다
				  
				  if(checkImageType(fileName)){			// 이미지 파일이면(s_파일이름.jpg)					  		
/* 	a href는 다운로드까지 되도록 함				  
					  str ="<div><a href=displayFile.bbs?fileName="+getImageLink(fileName)+">"
							  +"<img src='displayFile.bbs?fileName="+fileName+"'/>"	
							  +"</a><small class='human' data-src='"+fileName+"'>X</small></div>";
							  
*/

					 str ="<div><img src='nbDisplayFile.ict?fileName="+fileName+"'/>"	
							  +"<small class='allDeleteFilesClass' data-src='"+fileName+"'>X</small>"
							  
/* 								  이미지 파일일 경우에는 이름에 s_가 포함됭어 있으므로 테이블에 바로 입력하면
							  다운로드시 썸네일 파일을 다운로드 받게됨.. 이름에 s_제거하고 테이블에 입력 */
							  +"<input type='hidden' name='fileNames' value='"+getImageLink(fileName)+"'></div>";								  
							  
							  
							  
					  // alert("str >>>>>>>>>>>>  : "+str);								  
							  
				  }else{								// 이미지 파일이 아니면
					  str = "<div>" + getOriginalName(fileName)
				  			+ "<small class='allDeleteFilesClass' data-src='"+fileName+"'>X</small>"
				  				// small 은 CSS 적용됨
				  			  +"<input type='hidden' name='fileNames' value='"+fileName+"'></div>";
				  }
				  
				  
				  
				  	// ■ ■ ■ 파일 이름의 받아와서 DB에 넣기 위해 파일 이름 DTO에 저장
	                // 위에다가 hidden 태그 추가, div에 추가  하기
	                // str += "<input type='hidden' name='files' value='"+fileName+"'>";        			
				  
				  
				  $(".uploadedList").append(str);	// 업로드한 파일을 뿌려주는 장소
			  });				 
		  },
		  error : function(xhr){
				alert("error html = " + xhr.statusText);
		  }			  
		});	
});


//  ■ ■ ■ click 이벤트가 발생하는데 small인 경우에는 삭제하는 경우
$(".uploadedList").on("click", "small", function(event){			
	let that = $(this);			// this는 small 태그가 클릭되므로 small 객체이다
   $.ajax({
	   url:"/ictinfo/nbDeleteFile.ict",
	   type:"post",
	   data: {
		   fileName:$(this).attr("data-src") // small 태그의 data-src 속성값에
	   },
	   dataType:"text",		 
	   success:function(result){
		   if(result == 'deleted'){				   
			   that.parent("div").remove();	// small 태그인 x 표를 눌러서 삭제할경우 이미지를 담는 div를 삭제하라 
			   alert("삭제성공");
		   }
	   }
   });
});





$("#update_delete").on("click", function(event){			
	allDeleteFiles();		
});


//  ■ ■ ■ 모든 파일 삭제를 위한 함수를 별도로 만듬
function allDeleteFiles(){
	let files=[];
	$.each($(".allDeleteFilesClass"),function(index,item){
		//files[index]=$(this).attr("data-src");
		files.push($(this).attr("data-src"));		// this는 small 태그이다				
	});				
	
 	 // ■ ■ ■  배열을 직렬화해서 전송함 
   $.ajaxSettings.traditional = true;				// 배열이 직열화 하는 방법이다(컨트롤러가 받는 방법이 달라진다)
   
   $.ajax({
	   url:"/ictinfo/nbDeleteAllFiles.ict",
	   type:"post",
	   data: {files: files},						// 뒤 files 는 배열이다
	   dataType:"text",		  
	   success:function(result){
		   if(result == 'deleted'){
			   $(".uploadedList").children().remove();
			   alert("삭제성공");
		   }
	   }
   });
   
}


// ■ ■ ■  이미지 파일인지 일반 파일인지 체크하는 로직
function checkImageType(fileName){			
		//	/i는 대소문자 구분 하지 말라는 뜻임
	let pattern = /.jpg|.gif|.png/i;	// 3중에 한개이면	
	return fileName.match(pattern);		
}

//  ■ ■ ■  s_ 를 잘라내야 원본 파일이 오므로 원본 파일을 만드는 과정
function getImageLink(fileName){
	
	if(!checkImageType(fileName)){
		return;
	}	
	
	let front = fileName.substr(0,12);	// 0부터 12까지 자르기
	let end = fileName.substr(14);		// 14 이후부터 자르기
	alert("getImageLink>>>>>>>>>>>>>>>>>>> " + front + end);					// 결과 s_가 없어진다
	return front + end;	
}

//  ■ ■ ■  일반 파일일 경우 날짜 폴더명을 제거하고 뿌려주어야 함. 참고 : 이미지 파일은 파일 이름이 없다
function getOriginalName(fileName){
	if(checkImageType(fileName)){
		return;
	}
	
	let idx = fileName.indexOf("_") + 1 ;
	return fileName.substr(idx);			// idx 이후부터 잘라라.
}

function ajaxFileUpload() {
    // 업로드 버튼이 클릭되면 파일 찾기 창을 띄운다.
    jQuery("#ajaxFile").click();
}

function init(){
	document.getElementById("update_title").focus();
}

</script>


</body>
</html>

