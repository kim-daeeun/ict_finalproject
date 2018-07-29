<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>QnA(답글쓰기)</title>
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

#reply_title, #reply_content{
	display:block;
	border:none;
}

#reply_title{
	width:480px;
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

.qnaWrite_btn1{
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

<%-- main_header.jsp --%>
<%@include file="./../include/main_header.jsp"%>

<div class="container_body">
	
	<h2 style="text-align:center"> QnA(답글쓰기) </h2>

	<form:form action="/ictinfo/qnaReply.ict" method="post">

	<input type="hidden" name="pageNum" value="${pageNum}">                 
    <input type="hidden" name="depth" value="${depth}">
    <input type="hidden" name="groupId" value="${groupId}">
	<table class="table table-bordered">  
		<tr>
 			 <td class="leftside">글쓴이</td>
 			 <td class="rightside">${id}</td>
 		</tr>
 		<tr>	 
		 <td class="leftside">제목 </td>
		 <td class="rightside"><input type="text" class="form-control" name="title" id="reply_title" value="${title}"></td>			 
		</tr>
		<tr>
		  <td colspan="2">
		  <textarea cols="94" rows="10" name="content" class="form-control" id="reply_content" ></textarea>
		  </td>
	    </tr>
	    <tr>
	    	<td class="leftside"> 파일 첨부 칸 </td>
	    	<td>
	    		<div class="fileDrop"></div>
			 	<div class="uploadedList"></div>
	    	</td>
	    </tr>
	    <tr>
			<td colspan="2">
				<div class="filebox">
					<input type="file"  multiple="multiple" id="ajaxFile" style="display:none;">
			  		<button type="button" class="btn btn-primary qnaUpdate_btn1" onClick="ajaxFileUpload()" id="qnaUpdate_file"> 파일 업로드 </button>
			  		<button type="button" class="btn btn-danger qnaUpdate_btn1" id="qnaUpdate_delete"> 파일 모두삭제</button>
					<button type="submit" class="btn btn-primary qnaUpdate_btn1"> 답글쓰기 </button> 
					<button type="reset" class="btn btn-warning qnaUpdate_btn1" onclick="document.location.href='/ictinfo/qnaBoard.ict?pageNum=1'"> 답글쓰기 취소</button>
					<button type="button" class="btn btn-info qnaWrite_btn1" onclick="document.location.href='/ictinfo/qnaBoard.ict?pageNum=${pageNum}'"> 목록으로 </button>
				</div>
			</td>
		</tr> 	    
	</table>	
	
</form:form>
</div>
<%@include file="./../include/main_footer.jsp"%>


<%@include file="./../include/main_js.jsp"%>

<script type="text/javascript">
$(document).ready(function(){
	//id값으로 읽어 올려면 하나만 선택되어짐.. 클래스 사용
	$("input[type=reset]").on("click", function(event){
		allDeleteFiles();
	});
	
 	$(".fileDrop").on("dragenter dragover", function(event){
		event.preventDefault();
	}); 
 	
  	$(".fileDrop").on("drop", function(event){
		event.preventDefault();
		
		let files = event.originalEvent.dataTransfer.files;								
		let formData = new FormData();
		
		$.each(files,function(index,item){
			formData.append("multiFile", item);
		});		
		
		$.ajax({
			  url: '/ictinfo/qnaUploadAjax.ict',
			  data: formData,
			  dataType:'json',	
			  processData: false,
			  contentType: false,
			  type: 'POST',
			  success: function(data){
				  let str ="";				 
//				  alert(data);				  
				  $.each(data,function(index, fileName){	
					  if(checkImageType(fileName)){						 
						  str ="<div><img src='qnaDisplayFile.ict?fileName="+fileName+"'/>"	
								  +"<small class='ictinfo' data-src='"+fileName+"'>X</small>"
						  			+"<input type='hidden' name='fileNames' value='"+getImageLink(fileName)+"'></div>";
					  }else{
						  str = "<div>"  + getOriginalName(fileName)
								  +"<small class='ictinfo' data-src='"+fileName+"'>X</small>"
								  +"<input type='hidden' name='fileNames' value='"+fileName+"'></div>";
					  }
					  
					  $(".uploadedList").append(str);
				  });				 
			  },
			  error : function(xhr){
					alert("error html = " + xhr.statusText);
			  }			  
			});	
	});
	$(".uploadedList").on("click", "small", function(event){			
		let that = $(this);
	   $.ajax({
		   url:"/ictinfo/qnaDeleteFile.ict",
		   type:"post",
		   data: {
			   fileName:$(this).attr("data-src")
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
	$("#qnaUpdate_delete").on("click", function(event){			
		allDeleteFiles();
	});
});	
	function checkImageType(fileName){			
		let pattern = /.jpg|.gif|.png/i;		
		return fileName.match(pattern);		
	}
	
	function getImageLink(fileName){
		if(!checkImageType(fileName)){
			return;
		}	
		let front = fileName.substr(0,12);
		let end = fileName.substr(14);
//		alert(front + end);		
		return front + end;	
	}
	
	function getOriginalName(fileName){
		if(checkImageType(fileName)){
			return;
		}
		
		let idx = fileName.indexOf("_") + 1 ;
		return fileName.substr(idx);	
	}
	
	function getImageLink(fileName){
		if(!checkImageType(fileName)){
			return;
		}	
		let front = fileName.substr(0,12);
		//front -> \2018\05\24\s까지 제거
		let end = fileName.substr(14);
		//end ->_제거
//		alert(front + end);		
		return front + end;
		//end와 front를 합하여 파일이름을 원본파일이름으로 바꿈
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
//				   alert("삭제성공");
			   }
		   }
		  });
	}
	
	function ajaxFileUpload() {
	    // 업로드 버튼이 클릭되면 파일 찾기 창을 띄운다.
	    jQuery("#ajaxFile").click();
	}
	
	function init(){
		document.getElementById("reply_content").focus();
	}
  	
</script>

</body>
</html>