<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> QnA(수정하기) </title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<%@include file="./../include/main_css.jsp"%>
<link href="resources/style.css" rel="stylesheet" type="text/css">
<link href="./img/img_main/logo_ict.png" rel="shortcut icon">
<style>
.container_body{
	margin :0px auto;
	max-width:720px;
	min-height:720px;
}

h2 {
	margin:50px 0px;
}

#update_title, #update_content{
	display:block;
	border:none;
}
#update_title{
	width:95%;
}
.fileDrop {
	width:100%;
	height: 100px;
	border: 1px solid #000000;
}

.leftside{
	max-width:40%;
}
.rightside{
	min-width:300px;
}

.filebox{
	text-align:right;
}

.qnaWrite_btn2{
	margin:auto 1px;
}

small {
	margin-left: 3px;
	font-weight: bold;
	color: gray;
}
</style>
</head>

<body style="height:1080px" onload="init()">
<%@include file="./../include/main_header.jsp"%>
	<div class="container_body">
	<h2 style="text-align:center"> QnA(수정하기) </h2>				
	<form:form action="/ictinfo/qnaUpdate.ict" method="post">
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
				<td class="leftside">제목 </td>
				<td class="rightside"><input type="text" name="title" class="form-control" value="${qnaArticle.title}" id="update_title"></td>
			</tr>
			<tr>
				<td colspan="2"><textarea cols="94" rows="10" name="content" class="form-control" id="update_content">${qnaArticle.content}</textarea>
				</td>
			</tr>
			
			<tr>
				<td > 첨부된 파일  </td>
				<td>
					<c:if test="${fileList!=null}">
						<ul id="delGroup">
							<c:forEach var = "storedFname" items="${fileList}">
								<li>${storedFname.substring(storedFname.indexOf("_")+1)}
									<button type="button" deleteFileName="${storedFname}" class="delFile btn btn-sm btn-warning"> 삭제 </button>
								</li>
							</c:forEach>
						</ul>
					</c:if>
				</td>
			</tr>
			
			<tr>
				<td class="leftside"> 파일 첨부 칸 </td>
	      		<td>
	      			<div class='fileDrop'></div>
					<div class='uploadedList'></div>
		  		</td>
	    	</tr>
						
			<tr>
				<td colspan="2">
				<div class="filebox">
					<input type="file"  multiple="multiple" id="ajaxFile" style="display:none;">
		  			<button type="button" class="btn btn-primary qnaUpdate_btn2" onClick="ajaxFileUpload()" id="qnaUpdate_file"> 파일 업로드 </button>
		  			<button type="button" class="btn btn-danger qnaUpdate_btn2" id="qnaUpdate_delete"> 파일 모두삭제</button>
					<button type="submit" class="btn btn-primary qnaUpdate_btn2"> 수정하기 </button> 
					<button type="reset" class="btn btn-warning qnaUpdate_btn2" onclick="document.location.href='/ictinfo/qnaBoard.ict?pageNum=1'"> 수정하기취소</button>
					<button type="button" class="btn btn-info qnaWrite_btn2" onclick="document.location.href='/ictinfo/qnaBoard.ict?pageNum=${pageNum}'"> 목록으로 </button>
				 </div>
				</td>
			</tr>
		</table>
	</form:form>
	</div>
	
<%-- main_footer.jsp --%>
<%@include file="./../include/main_footer.jsp"%>

<%-- plugin_js.jsp --%>
<%@include file="./../include/main_js.jsp"%>	

<script type="text/javascript">
$(document).ready(function(){
	//id값으로 읽어 올려면 하나만 선택되어짐.. 클래스 사용
	$(".delFile").on("click", function(){
//		alert($(this).attr("deleteFileName"));
		//deleteFileName이 원래 있던 속성이 아니므로 아래처럼 하면 못 읽어옴
		//let storedFname=$(this).prop("deleteFileName");
		let storedFname=$(this).attr("deleteFileName");
		$(this).parent().remove();
		let deleteFileName ="<input type='hidden' name='deleteFileName' value='"+storedFname+"'>";
		$(deleteFileName).appendTo("form");
		// form 테그안의 뒷부분에 추가하는것 appendTo-> 뒷부분, prepandTo->앞부분
	});
	
	$("input[type=reset]").on("click",function(){
		allDeleteFiles();
	});
	
	$(".fileDrop").on("dragenter dragover", function(event){
		event.preventDefault();		
	});
	
	$(".fileDrop").on("drop", function(event){
		event.preventDefault();	
	//		event.originalEvent는 순수한 원래의 DOM이벤트를 가지고 옮
	//	JQuery를 사용할경우  순수한 DOM이벤트가 아님(jquery로 안되는 경우)
	//	dataTransfer는 이벤트와 같이 전달된 데이터를 의미
	//	그 안에 포함된 파일 데이터를 찾아내기 위해 dataTransfer.files
	//	를 사용함	
		let files = event.originalEvent.dataTransfer.files;			
	//		var file = files[0];
	//		파일이름을 바로 알아낼수 있음
	//		file.name;
	//		alert(file.name+"입니다")
					
		let formData = new FormData();
		$.each(files,function(index,item){
			formData.append("multiFile", item);
		});		
		//files의 개수만큼 append로 파일 생성
		$.ajax({
			  url: '/ictinfo/qnaUploadAjax.ict',
			  data: formData,
	//			  복수개를 업로드시 
			  dataType:'json',	
			  
	//			  processData: false는
	//			  데이터를 일반적인 query string으로 변활할 것인지를 결정, 기본값은 true , 
	//			  'application/x-www-form-urlencoded' 타입으로 전송, 다른 형식으로 데이터를
	//			  보내기 위하여 자동 변환하고 싶지 않은 경우는 false로 지정
			  processData: false,
			  
	//			  contentType: false 는
	//			  기본값은 'application/x-www-form-urlencoded', 파일의 경우 'multipart/form-data'
	//			  방식으로 전송하기 위해서 false
			  contentType: false,
			  type: 'POST',
			  success: function(data){
				  let str ="";				 
//				  alert(data);				  
				  $.each(data,function(index, fileName){					  					 
					  if(checkImageType(fileName)){						 
						  str ="<div><img src='qnaDisplayFile.ict?fileName="+fileName+"'/>"	
								  +"<small class='ictinfo' data-src='"+fileName+"'>X</small>"
								  //이미지 파일일 경우에는 이름에 s_가 포함되어 있으므로 테이블에 바로 입력하면
								  //다운로드 시 썸네일 파일을 다운로드 받게 됨, 이름에 s_를 제거하고 테이블에 입력
								  +"<input type='hidden' name='fileNames' value='"+getImageLink(fileName)+"'></div>";
					  }else{
						  str = "<div>"+ getOriginalName(fileName)
						  +"<small class='ictinfo' data-src='"+fileName+"'>X</small>"
						  +"<input type='hidden' name='fileNames' value='"+fileName+"'</div>";
					  }
					  //getImageLink-> s_를 제거하여 썸네일 이미지를 원본 이미지로 바꿈
					  //getoriginalname-> 파일 앞에 붙은 폴더명(2018\05\24) 제거
					  $(".uploadedList").append(str);
				  });
			  },
			  error : function(xhr){
					alert("error html = " + xhr.statusText);
			  }
		});	
	});
	
	$(".uploadedList").on("click", "small", function(event){	
		//small 태그가 클릭 될때
		let that = $(this);
		//this-> small
	   $.ajax({
		   url:"/ictinfo/qnaDeleteFile.ict",
		   type:"post",
		   data: {
			   fileName:$(this).attr("data-src")
			   //attr("data-src") data-src속성값을 읽어옴, 하나 이상의 속성이 있는 경우(attr("data-src","a.jpg"))는 해당하는 이미지로 바뀜
		   },
		   dataType:"text",		 
		   success:function(result){
			   if(result == 'deleted'){				   
				   that.parent("div").remove();
//				   alert("삭제성공");
			   }
		   }
	   });
	});
	
	$(".delFile").on("click", function(event){			
		let files=[];
		$.each($(".ictinfo"),function(index,item){
	//			files[index]=$(this).attr("data-src");
			files.push($(this).attr("data-src"));						
		});				
		
	// 	배열을 직렬화해서 전송함 
		$.ajaxSettings.traditional = true;
	   $.ajax({
		   url:"/ictinfo/qnaDeleteAllFiles.ict",
		   type:"post",
		   data: {files: files},
		   dataType:"text",		  
		   success:function(result){
			   if(result == 'deleted'){
				   $(".uploadedList").children().remove();
//				   alert("삭제성공");
			   }
		   }
	   });
	});
	$("#qnaUpdate_delete").on("click", function(event){			
		allDeleteFiles();
	});
});
function checkImageType(fileName){			
//		/i는 대소문자 구분 하지 말라는 뜻임
	let pattern = /.jpg|.gif|.png/i;	
	return fileName.match(pattern);		
}

function getImageLink(fileName){
	if(!checkImageType(fileName)){
		return;
	}	
	let front = fileName.substr(0,12);
	//front -> \2018\05\24\s까지 제거
	let end = fileName.substr(14);
	//end ->_제거
//	alert(front + end);		
	return front + end;
	//end와 front를 합하여 파일이름을 원본파일이름으로 바꿈
}

function getOriginalName(fileName){
	if(checkImageType(fileName)){
		return;
	}
	
	let idx = fileName.indexOf("_") + 1 ;
	return fileName.substr(idx);	
}

function allDeleteFiles(){
	let files=[];
	$.each($(".ictinfo"),function(index,item){
		files.push($(this).attr("data-src"));						
	});				
	$.ajaxSettings.traditional = true;
   $.ajax({
	   url:"/ictinfo/qnaDeleteAllFiles.ict",
	   type:"post",
	   data: {files: files},
	   dataType:"text",		  
	   success:function(result){
		   if(result == 'deleted'){
			   $(".uploadedList").children().remove();
//			   alert("삭제성공");
		   }
	   }
	  });
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
