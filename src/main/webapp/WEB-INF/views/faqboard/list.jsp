<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>

<title>FAQ</title>
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
	margin:50px 0px;
	text-align: center;
}

#faqlist_write{
	margin-left:1120px;
}



</style>


</head>
<body style="height:1020px">

<%-- main_header.jsp --%>
<%@include file="./../include/main_header.jsp"%>

	<div class="container_body">
	
	<h2 style="text-align:center">FAQ</h2>					
		
	<div id="container">
	<h2>글목록(전체 글:${totalCount })</h2>
	<table width="700" >
		<tr>
			<td align="right" >
				<input type=button" onclick="document.location.href='/ictinfo/faqwrite.ict'" 
				class="btn btn-primary" id="faqlist_write" value="글쓰기"><br>
			</td>
		</tr>
	</table>
	
	<table border="1" width="700" cellpadding="2" cellspacing="2" align="center"> 
	    <tr height="30" > 
	      <td align="center"  width="50"  >번 호</td> 
	      <td align="center"  width="250" >제   목</td> 
	      <td align="center"  width="100" >작성자</td>
	      <td align="center"  width="150" >작성일</td> 
	      <td align="center"  width="50" >조 회</td>          
	    </tr>
    
		<c:forEach var="article" items="${articleList}">
		   <tr height="30">
		    <td align="center"  width="50" >
			  <c:out value="${article.articleNum}"/>	   
			</td>
		    <td  width="250" >  
		      <c:if test="${article.depth > 0}">
			  	<img src="images/image3.png" width="${10 * article.depth}"  height="16">
			    <img src="images/cut.gif">
			  </c:if>
			  <c:if test="${article.depth == 0}">
			    <img src="images/image3.png" width="0"  height="16">
			  </c:if>         
		      <a href="faqcontent.ict?articleNum=${article.articleNum}&pageNum=${pageNum}&fileStatus=${article.fileStatus}">
		          ${article.title}
		           <c:if test="${article.commentCount!=0 }">(${article.commentCount})</c:if> 
		      </a> 
		          <c:if test="${article.hit >= 20}">
		            <img src="images/image3.png" border="0" height="16">
				  </c:if>
			</td>
		    <td align="center"  width="100">${article.id}</td>
		    <td align="center"  width="150">${article.writeDate}</td>
		    <td align="center"  width="50">${article.hit}</td>
		  </tr>
		  </c:forEach>
	  <tr>	  
	      <td colspan="5" align="center" height="40">	 
	 	  ${pageCode} 
		  </td>
	  </tr>
</table><br>
</div>
			
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



