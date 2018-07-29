<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>

<head>

<title>공지사항[내용보기]</title>
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
	margin:0 auto;
	max-width:720px;
	min-height:600px;
}

h2 {
	margin-top:50px;
	text-align: center;
}

.table{
	margin:30px auto;
	height:400px;
	width:100%;
}

textarea{
	border:1px solid #ddd;
	overflow:hidden;
}

.deleteN{
	color:red;
}

#boardDelete{
	display:none;
	position:absolute;
	
	width:100%;
	height:100%;
	
	top:0px;
	left:0px;
	right:0px;
	bottom:0px;
	
	background-color:rgba(0,0,0,0.5);
	z-index:2;
	cursor:pointer;
}

#explain{
 position:absolute;
 top:30%;
 left:31%;

 width:350px;
 height:120px;

 background-color:white;
 font:bold 17px "굴림";

 font-family:head;
 text-align:center;
 
 margin-left:130px;
 padding-top:30px;
}

#fileNone{
	color:#000000;
}



<!-- 여기에 CSS 코딩을 하세요 -->


</style>


</head>
<body style="height:1080px">

<%-- main_header.jsp --%>
<%@include file="./../include/main_header.jsp"%>

	<div class="container_body">
	
		<h2>공지사항[내용보기]</h2>					
		
		<div id="boardDelete">
			   <div id="explain">
			    <p class="deleteN"> 정말로 삭제하겠습니까? </p>

			    <button type="button" class="btn btn-danger" onclick="document.location.href='/ictinfo/nbDelete.ict?articleNum=${article.articleNum}&pageNum=${pageNum}'"> 삭제하기 </button>
			    <button type="button" class="btn btn-info" onclick="clickoff()"> 돌아가기</button>
			   </div>
		</div>
		
    <form action="/ictinfo/nbReplyForm.ict" method="get">    
		<table class="table table-bordered">  
		<tr>
 			 <td>글쓴이 </td> <td>${article.id}</td> 			 
 			 <td>조회수 </td> <td>${article.hit}</td>
 		</tr>
 		<tr>	 
			 <td>제목  </td><td>${article.title}</td>
			 <td>날짜  </td><td>${article.writeDate}</td>
		 </tr>
		 
		 <tr>	
		 	<td>글 내용 </td>		 
			<td colspan="3">${article.content}</td>
	     </tr> 
	     	 
		 <tr>
			<td>첨부파일</td>
			<td colspan="3">
			<c:if test="${article.fileStatus!=0}">
				<c:if test="${fileList!=null}">
					<ul>
						<c:forEach var="storedFname" items="${fileList}">
						<li>
							<a href="nbDownload.ict?storedFname=${storedFname}">${storedFname.substring(storedFname.indexOf("_")+1)}</a>
							
							<!-- JSTL 이용해서 -->
		<!-- 						객체를 받았을때 객체 안의 메소드를 바로 사용이 가능하다
									JSTL은 그렇게 사용을 하지 못한다 -->
							<%-- <a href="download.bbs?storedFname=${storedFname}">${fn:substringAfter(storedFname,"_")}</a> --%>
							
							
						</li>
						</c:forEach>
					</ul>
				</c:if>
			</c:if>
			<c:if test="${article.fileStatus==0}">
				<a id="fileNone"> 첨부파일 없음 </a>
			</c:if>	
			</td>
		 </tr>		
		 	   
	     <tr>
	      <c:if test="${id != null}">
	    	  <td colspan="4" align="right">	    	
	    	  
	    	  <button type="submit" class="btn btn-info"> 답글달기 </button>
	    	  
	    	  <c:if test="${id == article.id}">
	    	  	<button type="button" onclick="document.location.href='/ictinfo/nbUpdate.ict?articleNum=${article.articleNum}&pageNum=${pageNum}&fileStatus=${article.fileStatus}'" class="btn btn-info"> 수정하기 </button>
	    	  	<button type="button"  class="btn btn-danger" onclick="showDelete()"> 삭제하기 </button>	    	  
	    	  </c:if>
	    	  <c:if test="${id != article.id}">
	    	  	<button type="button" class="btn btn-info disabled"> 수정하기 </button>
	    	  	<button type="button" class="btn btn-danger disabled" > 삭제하기 </button>
	    	  </c:if>
	    	  <button type="button" onclick="document.location.href='/ictinfo/nbList.ict?pageNum=${pageNum}'" class="btn btn-info"> 목록으로 </button>
	    	  </td>
	    	  
	      </c:if>
	      		    	
	      <c:if test="${id == null}">
	    	  <td colspan="4" align="right">
	    	  	    <button type="submit" class="btn btn-info disabled"> 답글달기 </button>
	    	  		<button type="button" class="btn btn-info disabled"> 수정하기 </button>
	    	  		<button type="button" class="btn btn-danger disabled"> 삭제하기 </button>
	    	  		<button type="button" onclick="document.location.href='/ictinfo/nbList.ict?pageNum=${pageNum}'" class="btn btn-info"> 목록으로 </button>
	    	  </td>   
	      </c:if>      	 	      	 
	     </tr>
	     
	     
 	     <tr>
	     	<td colspan="4">
	     		<textarea rows="5" cols="70" id="commentContent"></textarea><br><br>
	     		<c:if test="${id == null}">
	     			<input type="button" value="comment 쓰기" disabled="disabled">
	     		</c:if>
	     		<c:if test="${id!=null}">
	     			<input type="button" value="comment 쓰기" id="commentWrite">
	     		</c:if>
	     		<input type="button" value="comment 읽기(${article.commentCount})" onclick="getComment(1,event)" id="commentRead">
	     	 </td>
	     </tr>

	     
		 </table>
		 
		<input type="hidden" name="pageNum" value="${pageNum}">                 
    	<input type="hidden" name="depth" value="${article.depth}">
    	<input type="hidden" name="groupId" value="${article.articleNum}">	
	</form>
	
	<div>
		<div id="showComment" align="center">
		</div>
		<input type="hidden" id="commPageNum" value="1">
	</div>
	

	</div> <!-- container_body 끝-->	

<%-- main_footer.jsp --%>
<%@include file="./../include/main_footer.jsp"%>

<%-- plugin_js.jsp --%>
<%@include file="./../include/main_js.jsp"%>

<!-- 여기 아래에 JavaScript 코딩을 작성하세요!!! -->
<script>
function clickoff(){
	document.getElementById("boardDelete").style.display="none";
}
function showDelete(){
	document.getElementById("boardDelete").style.display="block";	
}


$(document).ready(function(){
	$.ajaxSetup({
		type : "POST",
		async : true,
		dataType : "json",	
		error : function(xhr){
			alert("error html = " + xhr.statusText);
		}
	});
	
	$("#commentWrite").on("click",function(){
		$.ajax({			
			url:"/ictinfo/nbCommentWrite.comment",
// 			data{}에서는 EL을 ""로 감싸야함..그외에는 그냥 사용
			data:{				
				commentContent:$("#commentContent").val(),
				articleNum:"${article.articleNum}"
			},
// 			beforeSend : function(){
// 				alert("시작전");
// 			},
// 			complete: function(){
// 				alert("완료후");
// 			},
			success:function(data){
				if(data.result==1){
					//alert("comment가 정상적으로 입력되었습니다");
					$("#commentContent").val("");
					showHtml(data.commentList,1);
					//값이 넘어오면 showhtml로 보여줄 예정
				}
			}
		}); 
	});
});
	function getComment(commPageNum,event){
		//event.preventDefault();
		$.ajax({
			url:"/ictinfo/nbCommentRead.comment",
			data:{
				articleNum:"${article.articleNum}",
				//숫자와 문자연산에서 +제외하고는 숫자 우선  ex 1*10 10 
				commentRow:commPageNum*10
			},
			success:function(data){
				showHtml(data,commPageNum);
			}
		});
	}
	function showHtml(data,commPageNum){
		let html="<table border='1' width='500' align='center'>";
		$.each(data,function(index,item){
			html +="<tr>";
			html +="<td>"+(index+1)+"</td>";
			html +="<td>"+item.id+"</td>";
			html +="<td>"+item.commentContent+"</td>";
			html +="<td>"+item.commentDate+"</td>";
			html +="<td>"+item.articleNum+"</td>";
			html +="</tr>";			
		});
		html +="</table>";
		commPageNum=parseInt(commPageNum);
		if("${article.commentCount}">commPageNum*10){
			nextPageNum=commPageNum+1;
			html+="<br/><input type='button' onclick='getComment(nextPageNum,event)' value='다음comment보기'<br>";
		}
		//html함수에 html (태그적용)을 불러온다. text는 문자열만 불러온다.
		$("#showComment").html(html);
		$("#commentContent").val("");
		$("#commentContent").focus();
		
	}
	
</script>


</body>
</html>

