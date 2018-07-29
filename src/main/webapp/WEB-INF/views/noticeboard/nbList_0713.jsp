<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>

<head>

<title>공지사항</title>
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

#nblist_write{
	margin-left:790px;
}


</style>


</head>
<body style="height:1080px">

<%-- main_header.jsp --%>
<%@include file="./../include/main_header.jsp"%>

<div class="container_body">
	<h2> 공지사항 </h2>
	<h4> 글목록(전체 글:${totalCount}) </h4>

		
		<table width="700" id="mainList">
		<tr>
			<td align="right" >
				<input type=button" onclick="document.location.href='/ictinfo/nbWrite.ict'" 
				class="btn btn-primary" id="nblist_write" value="글쓰기"><br><br>
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
	    
		<c:forEach var="article" items="${articleList}">
		   <tr>
		    <td class="articleNum" align="center"  width="50" >
			  <c:out value="${article.articleNum}"/>	   
			</td>
		    <td class="titlelist">  
		      <c:if test="${article.depth > 0}">
		      	<c:forEach var="index" begin="1" end="${article.depth}" step="1">
		      		&nbsp;
		      	</c:forEach>
			  	<img src="img/img_noticeboard/icon_reply.gif" width="${10 * article.depth}"  height="16">
			    <img src="img/img_noticeboard/icon_new.gif" width="10" height="16">
			  </c:if>
			  <c:if test="${article.depth == 0}">
			    <img src="img/img_noticeboard/icon_reply.gif" width="0"  height="16">
			  </c:if>         
		      <a href="nbContent.ict?articleNum=${article.articleNum}&pageNum=${pageNum}&fileStatus=${article.fileStatus}">
		          ${article.title}
		           <c:if test="${article.fileStatus!=0 }">
		           		<img src="img/img_noticeboard/icon_file.png" width="10" height="10">
		           </c:if>
		      </a> 
		          <c:if test="${article.hit >= 20}">
		            <img src="img/img_noticeboard/icon_hot.gif" border="0" height="16">
				  </c:if>
			</td>
		    <td class="writeName">${article.id}</td>
		    <td class="writeDate">${article.writeDate}</td>
		    <td class="clickfreq">${article.hit}</td>
		  </tr>
		  </c:forEach>
		  <tr>	  
		      <td colspan="5" id="pagecode">	 
		 	  ${pageCode} 
			  </td>
		  </tr>
	</table>


	</div> <!-- container_body 끝-->	

<%-- main_footer.jsp --%>
<%@include file="./../include/main_footer.jsp"%>

<%-- plugin_js.jsp --%>
<%@include file="./../include/main_js.jsp"%>

<!-- 여기 아래에 JavaScript 코딩을 작성하세요!!! -->
<script>

	

</script>


</body>
</html>

