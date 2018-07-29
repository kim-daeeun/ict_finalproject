<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title> Q&A(글읽기) </title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
.container_body{
	margin :0px auto;
	max-width:720px;
	min-height:720px;
}

h2 {
	margin:50px 0px;
	text-align: center;
}
		
.table{
	margin:30px auto;
}

#commentbtn{
	text-align:right;
	margin:10px 2px;
}

#commentView{
	max-width:500px;
	text-align:center;
	margin:2px auto;
}
#read_content{
	border:none;
	overflow:hidden;
}

.deleteQ{
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

</style> 
<%@include file="./../include/main_css.jsp"%>
</head>

<body style="height:1080px">

<%@include file="./../include/main_header.jsp"%> 
<div class="container_body">
	<h2 style="text-align:center"> Q&A(글읽기) </h2>
   	<form action="/ictinfo/qnaReply.ict" method="get"> 
   	
   		<div id="boardDelete">
			   <div id="explain">
			    <p class="deleteQ"> 정말로 삭제하겠습니까? </p>

			    <button type="button" class="btn btn-danger" onclick="document.location.href='/ictinfo/qnaDelete.ict?articleNum=${qnaArticle.articleNum}&pageNum=${pageNum}'"> 삭제하기 </button>
			    <button type="button" class="btn btn-info" onclick="clickoff()"> 돌아가기</button>
			   </div>
		</div>
		        
	<table class="table table-bordered">
		<tr>
 			<td>글쓴이  </td> <td>${qnaArticle.id}</td> 			 
 			<td>조회수  </td> <td>${qnaArticle.hit}</td>
 		</tr>
 		<tr>	 
			<td>제목  </td><td>${qnaArticle.title}</td>
			<td>날짜  </td><td>${qnaArticle.writeDate}</td>
		</tr>
		 
		
		 
		<tr>
			<td> 첨부파일  </td>
			<td colspan="3">
			<c:if test="${qnaArticle.fileStatus!=0}">
				<c:if test="${fileList!=null}">
				<ul>
					<c:forEach var="qnaFile" items="${fileList}">
						<li><a href="qnaDownload.ict?articleNum=${qnaArticle.articleNum}&fileNum=${qnaFile.fileNum}">
						${qnaFile.storedFname.substring(qnaFile.storedFname.indexOf("_")+1)}</a></li>
					<%-- 	JSTL 이용
					<a href="download.ict?storedFname=${storedFname}">${fn:substringAfter(storedFname,"-") }</a> --%>
					</c:forEach>
				</ul>
				</c:if>
			</c:if>
			<c:if test="${qnaArticle.fileStatus==0}">
				<a id="fileNone"> 첨부파일 없음 </a>
			</c:if>
		<%--  	<td colspan="2"><a href="/ictinfo/download.ict?fname=${qnaArticle.fname}">${qnaArticle.fname}</a></td>--%>
		</td>
		 </tr>
		 		
		 <tr>
		 	<td>내용  </td>
			<td colspan="3">
				<textarea cols="75" rows="10" readonly id="read_content">
${qnaArticle.content}
				</textarea>
			</td>
		</tr>
			  
	     <tr>
	      <c:if test="${id !=null}">
	    	  <td colspan="4" align="right">	    	
	    	  <button type="submit" class="btn btn-info"> 답글쓰기 </button>
	    	  <c:if test="${id ==qnaArticle.id}">
	    	  <button type="button" onclick="document.location.href='/ictinfo/qnaUpdate.ict?articleNum=${qnaArticle.articleNum}&pageNum=${pageNum}&fileStatus=${qnaArticle.fileStatus}'" class="btn btn-info"> 수정하기 </button>
	    	  <button type="button" onclick="showDelete()" class="btn btn-danger"> 삭제하기 </button>
	    	  </c:if>
	    	  <c:if test="${id !=qnaArticle.id}">
	    	  <button type="button" class="btn btn-info disabled"> 수정하기 </button>
	    	  <button type="button" class="btn btn-danger disabled"> 삭제하기 </button>
	    	  </c:if>
	    	  <button type="button" onclick="document.location.href='/ictinfo/qnaBoard.ict?pageNum=${pageNum}'" class="btn btn-info"> 목록으로 </button>
	    	  </td>
	      </c:if>
	      		    	
	      <c:if test="${id ==null}">
	    	  <td colspan="4" align="right">
	    	  <button type="submit" class="btn btn-info disabled"> 답글쓰기 </button>
	    	  <button type="button" class="btn btn-info disabled"> 수정하기 </button>
	    	  <button type="button" class="btn btn-danger disabled"> 삭제하기 </button>
	    	  <button type="button" onclick="document.location.href='/ictinfo/qnaBoard.ict?pageNum=${pageNum}'" class="btn btn-info"> 목록으로 </button>
	    	  </td>   
	      </c:if>      	 	      	 
	     </tr>
	     
	     <tr>
	     	<td colspan="4">
	     		<textarea rows="5" cols="94" id="commentContent" class="form-control"></textarea>
				<div id="commentbtn">
	     		<c:if test="${id == null}">
	     			<button type="button" class="btn btn-primary disabled"> comment 쓰기 </button>
	     		</c:if>
	     		<c:if test="${id !=null}">
	     			<button type="button" class="btn btn-primary" id="commentWrite"> comment 쓰기 </button>
	     		</c:if>
	     		<button type="button" onclick="getComment(1,event)" class="btn btn-primary" id="commentRead"> comment 읽기(${qnaArticle.commentCount}) </button>
				</div>	     	
	     	</td>	
	      </tr>
		 </table>	
	<input type="hidden" name="pageNum" value="${pageNum}">                 
    <input type="hidden" name="depth" value="${qnaArticle.depth}">
    <input type="hidden" name="groupId" value="${qnaArticle.articleNum}">
    <input type="hidden" name="title" value="${qnaArticle.title}"	>
	</form>
	
	<div id="commentView">
		<div id="showComment"> </div>
		<input type="hidden" id="commPageNum" value="1">
	</div>
	
</div>	  
<%-- main_footer.jsp --%>
<%@include file="./../include/main_footer.jsp"%>

<%-- plugin_js.jsp --%>
<%@include file="./../include/main_js.jsp"%>	
	
<script type="text/javascript">
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
				url:"/ictinfo/qnaCommentWrite.ict",
//	 			data{}에서는 EL을 ""로 감싸야함..그외에는 그냥 사용
				data:{				
					commentContent:$("#commentContent").val(),
					articleNum:"${qnaArticle.articleNum}"
				},
//	 			beforeSend : function(){
//	 				alert("시작전");
//	 			},
//	 			complete: function(){
//	 				alert("완료후");
//	 			},
				success:function(data){
					if(data.result==1){
						alert("comment가 정상적으로 입력되었습니다");
						$("#commentContent").val("");
						showHtml(data.commentList,1);
					}
				}
				
			}); 
		});
	});
	
	function getComment(commPageNum, event){
		$.ajax({
			url:"/ictinfo/qnaCommentRead.ict",
			data:{
				articleNum:"${qnaArticle.articleNum}",
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
		//$.each(data.commentList, function(index,item){
			//MappingJackson2JsonView사용
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
		if("${qnaArticle.commentCount}">commPageNum*10){
			nextPageNum=commPageNum+1;
			html +="<br /><input type='button' onclick='getComment(nextPageNum,event)' value='다음comment보기'><br>";
		}
		
		$("#showComment").html(html);
		$("#commentContent").val("");
		$("#commentContent").focus();
	}
	function clickoff(){
		document.getElementById("boardDelete").style.display="none";
	}
	function showDelete(){
		document.getElementById("boardDelete").style.display="block";	
	}	
</script>
		
</body>
</html>