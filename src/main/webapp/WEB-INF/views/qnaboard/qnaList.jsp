<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Q&A</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> 
<link href="resources/style.css" rel="stylesheet" type="text/css">
<link href="./img/img_main/logo_ict.png" rel="shortcut icon">
<style>
.container_body{
	margin : 0px auto;
	text-align:center;
	width:1080px;
	min-height:720px;	
}

h2 {
	margin-top:50px;
	text-align: center;
}
h4 {
	margin:10px 0px;
	text-align:center;
}

#write{
	text-align : right;
	display: block;
	border: none;
	margin: 10px auto;
	max-width: 90%;
}

#mainList{
	margin:10px auto;
	text-align:center;
	max-width:90%;
	font-size:15px;
	line-height: 1.5em;
}

.articleNum{
	width:50px;
}

.titlelist{
	width:250px;
	text-align:left;
}

#titleList{
	width:250px;
	text-align:center;
}

.writeName{
	width:100px;
}

.writeDate{
	width:150px;
}

.clickfreq{
	width:50px;
}

#pagecode{
	height:40px;
}

#commentNumber{
	color:red;
}

#qnalist_write{
	margin-left:790px;
}


</style>

<%@include file="./../include/main_css.jsp"%>

</head>

<body style="height:1080px">
	
<%-- main_header.jsp --%>
<%@include file="./../include/main_header.jsp"%>


<div class="container_body">
<h2> QnA </h2>
<h4> 글목록(전체 글:${totalCount}) </h4>

	<table width="700" id="mainList">
		<tr>
			<td align="right" >
				<input type=button" onclick="document.location.href='/ictinfo/qnaWrite.ict'" 
				class="btn btn-primary" id="qnalist_write" value="글쓰기"><br><br>
			</td>
		</tr>
	</table>
	
	<table id="mainList" class="table table-hover"> 	
    <tr> 
      <td class="articleNum">번 호</td> 
      <td id="titleList">제   목</td> 
      <td class="writeName">작성자</td>
      <td class="writeDate">작성일</td> 
      <td class="clickfreq">조 회</td>          
    </tr>
    
	<c:forEach var="qnaArticle" items="${articleList}">
	   <tr>
	    <td class="articleNum" align="center"  width="50" >
		  <c:out value="${qnaArticle.articleNum}"/>	   
		</td>
	    <td class="titlelist">  
	      <c:if test="${qnaArticle.depth > 0}">
	      	<c:forEach var="index" begin="1" end="${qnaArticle.depth}" step="1">
	      		&nbsp; &nbsp;
	      	</c:forEach>
		    <img src="img/img_qnaboard/qna_reply.gif" width="10" height="15">
		  </c:if>
		  <c:if test="${qnaArticle.depth == 0}">
		    <img src="img/img_qnaboard/qna_reply.gif" width="0"  height="16">
		  </c:if>         
	      <a href="/ictinfo/qnaContent.ict?articleNum=${qnaArticle.articleNum}&pageNum=${pageNum}&fileStatus=${qnaArticle.fileStatus}">
	          ${qnaArticle.title}
	           <c:if test="${qnaArticle.commentCount!=0 }">
	           		<span id="commentNumber">[${qnaArticle.commentCount}]</span>
	           </c:if>
	           <c:if test="${qnaArticle.fileStatus!=0 }">
	           		<img src="img/img_qnaboard/qna_file.png" width="10" height="15">
	           </c:if>
	      </a> 
	          <c:if test="${qnaArticle.hit >= 20}">
	            <img src="img/img_qnaboard/qna_reply.gif" border="0" height="16">
			  </c:if>
		</td>
	    <td class="writeName">${qnaArticle.id}</td>
	    <td class="writeDate">${qnaArticle.writeDate}</td>
	    <td class="clickfreq">${qnaArticle.hit}</td>
	  </tr>
	  </c:forEach>
	  <tr>	  
	      <td colspan="5" id="pagecode">	 
	 	  ${pageCode} 
		  </td>
	  </tr>
</table>
</div>
   
   
<%-- main_footer.jsp --%>
<%@include file="./../include/main_footer.jsp"%>

<%-- plugin_js.jsp --%>
<%@include file="./../include/main_js.jsp"%>
   
</body>
</html>