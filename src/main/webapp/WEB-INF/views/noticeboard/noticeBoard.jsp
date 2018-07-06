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


</style>


</head>
<body style="height:1020px">

<%-- main_header.jsp --%>
<%@include file="./../include/main_header.jsp"%>

	<div class="container">
	
		<h2 style="text-align:center">공지 사항</h2>		 
 

<center><b>글목록(전체 글:${totalCount})</b>

		<table class="pull-right text-right">
		  <tr>
		    <td align="right" class="pull-right text-right">
		       <a href="/human/write.bbs">글쓰기</a>
		    </td>
		  </tr>
		</table>
		
		
		
		
		<%-- <c:if test="${totalCount == 0}"> --%>
		<!-- <table width="700" border="1" cellpadding="0" cellspacing="0"> -->
		<!--   <tr> -->
		<!--     <td align="center"> -->
		<!--       게시판에 저장된 글이 없습니다. -->
		<!--     </td> -->
		<!--   </tr> -->
		<!-- </table> -->
		<%-- </c:if> --%>
		
		
		
		<!-- <table class="table" border="1" width="700" cellpadding="2" cellspacing="2" align="center"> --> 
		<table class="table"> 
			<thead>
			    <tr height="30" > 
				      <td align="center"  width="50"  >번 호</td> 
				      <td align="center"  width="250" >제   목</td> 
				      <td align="center"  width="100" >작성자</td>
				      <td align="center"  width="150" >작성일</td> 
				      <td align="center"  width="50" >조 회</td>          
			    </tr>
			</thead>
			    
			    
			<tbody>
				<!-- articleList를 article에 넣는다 -->
			   <c:forEach var="article" items="${articleList}">
			   <tr height="30">
					    <td align="center"  width="50" >
						  <c:out value="${article.articleNum}"/>	   
						</td>
					    <td  width="250" >  
					      <c:if test="${article.depth > 0}">	<!-- 답글이 있으면 -->
						  	<img src="images/image3.png" width="${10 * article.depth}"  height="16">
						    <img src="images/cut.gif">
						  </c:if>
						  <c:if test="${article.depth == 0}">
						    <img src="images/image3.png" width="0"  height="16">
						  </c:if>         
					      <a href="/human/content.bbs?articleNum=${article.articleNum}&pageNum=${pageNum}&fileStatus=${article.fileStatus}"> <!-- 공백 조심 -->
					          ${article.title}
					          
					           <c:if test="${article.commentCount!=0 }">           
					          	 <span style="color:red"> (${article.commentCount})</span>		<!-- 리스트 옆에 댓글 갯수를 나타낼때 사용 -->
					           </c:if>      
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
					  ${pageCode}	<!-- 링크가 생기는 코드 -->
					  </td>
			  </tr>
			  
			 </tbody>
		</table>
</center>
			
		



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

