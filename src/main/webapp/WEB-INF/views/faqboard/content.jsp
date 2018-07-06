<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE>
<html>

<head>

<title>글읽기</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>   

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
	margin-top:50px 0px;
	text-align: center;
}


/* 여기에 CSS 코딩을 하세요 */


</style>


</head>
<body style="height:1020px">

<%-- main_header.jsp --%>
<%@include file="./../include/main_header.jsp"%>

	<div class="container_body">
	
	<h2 style="text-align:center">글읽기</h2><br>
	
	<form action="/ictinfo/faqreplyForm.ict" method="post">      
    <input type="hidden" name="pageNum" value="${pageNum}">                 
    <input type="hidden" name="depth" value="${article.depth}">
    <input type="hidden" name="groupId" value="${article.groupId}">
	<table border="1" width="500" align="center">  
		<tr>
 			 <td>글쓴이 :${article.id}</td>
 		</tr>
 		
 		<tr>			 
 			 <td>조회수 :${article.hit}</td>
 		</tr>
 		
 		<tr>	 
			 <td>제목 :${article.title}</td>
		</tr>
		
		<tr>
			 <td>날짜 :${article.writeDate}</td>
		 </tr>	 
		 <%-- <tr>
			<td colspan="2">다운로드 </td>
			<td colspan="2"><a href="/download.ict?fname=${article.fname}">${article.fname}</a></td>
		 </tr> --%>		
		 <tr>			 
			  <td colspan="4">${article.content}</td>
	     </tr> 	
	     
	     <tr>
			<td colspan="2">다운로드
			<c:if test="${article.fileStatus!=0}">
				
				<c:if test="${fileList!=null}">
				<ul>
					<c:forEach var="storedFname" items="${fileList}">
						<li><a href="faqdownload.ict?storedFname=${storedFname}">
						${storedFname.substring(storedFname.indexOf("_")+1)}</a></li>
					<%-- 	JSTL 이용
					<a href="download.bbs?storedFname=${storedFname}">${fn:substringAfter(storedFname,"-") }</a> --%>
					</c:forEach>
				</ul>
				</c:if>
				</c:if>
		<%--  	<td colspan="2"><a href="/human/download.bbs?fname=${article.fname}">${article.fname}</a></td>--%>
		</td>
		 </tr>	
	     
	     
	     
	     <tr>
	      <c:if test="${id !=null}">
	    	  <td colspan="4" align="center">
	    	      	
	    	  <input type="submit" value="답글달기" class="btn btn-success">
	    	  <c:if test="${id ==article.id}">
	    	  <input type="button" value="수정하기" onclick="document.location.href='/ictinfo/faqupdate.ict?articleNum=${article.articleNum}&pageNum=${pageNum}&fileStatus=${article.fileStatus}'" class="btn btn-primary">
	    	  <input type="button" value="삭제하기" onclick="document.location.href='/ictinfo/faqdelete.ict?articleNum=${article.articleNum}&pageNum=${pageNum}'" class="btn btn-danger">
	    	  </c:if>
	    	  <c:if test="${id !=article.id}">
	    	  <input type="button" value="수정하기" disabled="disabled" class="btn btn-primary">
	    	  <input type="button" value="삭제하기" disabled="disabled" class="btn btn-danger">
	    	  </c:if>
	    	  <input type="button" value="목록으로" onclick="document.location.href='/ictinfo/faqlist.ict?pageNum=${pageNum}'" class="btn btn-info">
	    	  </td>
	      </c:if>
	      		    	
	      <c:if test="${id ==null}">
	    	  <td colspan="4" align="center">
	    	  <input type="submit" value="답글달기" disabled="disabled" class="btn btn-success">
	    	  <input type="button" value="수정하기" disabled="disabled" class="btn btn-primary">
	    	  <input type="button" value="삭제하기" disabled="disabled" class="btn btn-danger">
	    	  <input type="button" value="목록으로" onclick="document.location.href='/ictinfo/faqlist.ict?pageNum=${pageNum}'" class="btn btn-info">
	    	  </td>   
	      </c:if>      	 	      	 
	     </tr>
	     
	      <tr>
	     	<td colspan="4" align="center">
	     		<textarea rows="5" cols="70" id="commentContent"></textarea><br><br>
	     		<c:if test="${id == null}">
	     			<input type="button" value="comment 쓰기" disabled="disabled" class="btn btn-warning">
	     		</c:if>
	     		<c:if test="${id !=null}">
	     			<input type="button" value="comment 쓰기" id="commentWrite" class="btn btn-warning">
	     		</c:if>
	     		<input type="button" value="comment 읽기(${article.commentCount})" 
	     		onclick="getComment(1,event)" id="commentRead" class="btn btn-warning">
	     	</td>
	      </tr>
	          
		 </table>	
	</form>
	
	<div>
		<div id="showComment" align="center">
		</div>
		<input type="hidden" id="commPageNum" value="1">
	</div>
	
		</div>

 <!-- container_body 끝-->	

<%-- main_footer.jsp --%>
<%@include file="./../include/main_footer.jsp"%>

<%-- plugin_js.jsp --%>
<%@include file="./../include/main_js.jsp"%>

<script>
$.ajaxSetup({
	type : "POST",
	async : true,
	dataType : "json",
	error : function(xhr){
		alert("error html = " + xhr.statusText);
	}
}); 
$(document).ready(function(){
	$("#commentWrite").on("click",function(){
		$.ajax({					
			url:"/ictinfo/faqcommentWrite.comment",
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
					alert("comment가 정성적으로 입력되었습니다");
					$("#commentContent").val("");
					showHtml(data.commentList,1);
				}
			}
			
		}); 
	});
});

function getComment(commPageNum, event){
	$.ajax({
		url:"/ictinfo/faqcommentRead.comment",
		data:{
			articleNum:"${article.articleNum}",
			//숫자와 문자연산에서 +를 제외하고는 숫자 우선
			commentRow:commPageNum*10
		},
		success:function(data){
			showHtml(data,commPageNum);
		}
	});
}

function showHtml(data,commPageNum){
	let html="<table border='1' width='500' align='center'>";
	$.each(data, function(index,item){
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
		html +="<br /><input type='button' onclick='getComment(nextPageNum,event)' value='다음comment보기'><br>";
	}
	
	$("#showComment").html(html);
	$("#commentContent").val("");
	$("#commentContent").focus();
}
</script>
</body>
</html>
