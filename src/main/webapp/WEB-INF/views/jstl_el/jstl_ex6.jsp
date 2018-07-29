<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<!-- 타이틀 꼭 수정하세요 -->
<title>View Page</title>

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


<!-- 여기 아래에 CSS 코딩을 하세요 -->
<style>

/*=======================
	기본 틀 설정 부분
=========================*/

body{
	min-height:1080px;
}

.container_body{
	margin : 0px auto;	
}

h2 {
	margin:50px 0px;
	text-align: center;
}

/*=======================
	여기 아래에 CSS 코딩
=========================*/


</style>
</head>
<body>

<%-- main_header.jsp --%>
<%@include file="./../include/main_header.jsp"%>

<div class="container_body">
<h2 style="text-align:center">관리자 페이지</h2>		 



<div class="row">		<!-- 첫번째 row 의  시작 -->
<div class="col-md-1">
</div>
<div class="col-md-10">
<div class="col-md-12 text-center">




		  <div class="btn-group">
		    <button type="button" class="btn btn-primary">가</button>
		    <button type="button" class="btn btn-primary">나</button>
		    <button type="button" class="btn btn-primary">다</button>
		    <button type="button" class="btn btn-primary">라</button>
		    <div class="btn-group">
		      <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
		     		 마 <span class="caret"></span></button>
		      <ul class="dropdown-menu" role="menu">
		        <li><a href="#">하위메뉴1</a></li>
		        <li><a href="#">하위메뉴2</a></li>
		        <li><a href="#">하위메뉴3</a></li>
		      </ul>
		    </div>
		  </div>




		<br>
		Man 결과 출력:<br>
		전통 : Hi <%= request.getAttribute("man") %><br>
		EL : Hi ${requestScope.man} ${man}<p>
		
		<br><hr><br>
		
		Person EL : Hi ${requestScope.person} ${person.age}<p>
		
		<br><hr><br>
		
		EL : ${animals[0]} ${animals[1]} ${animals["2"]}
		
		EL : ${animals[0]} ${animals[1]} ${animals["2"]}<p>
		
		<c:if test="${list !=null}">
			<c:forEach var="a" items="${list}">
				<c:forEach var="b" items="${a}">
					${b}&nbsp;
				</c:forEach>
					<br>
			</c:forEach>
		</c:if>
		
		<br><hr><br>
		
		<c:choose>
			<c:when test="${list eq null}">자료 없음</c:when>
			<c:otherwise>자료 있네요</c:otherwise>
		</c:choose>
		
		<br><hr><br>
		
		예외처리 : <br>
		<c:catch var="myErr">
			<%int a = 10 / 0; out.println(a); %>
		</c:catch>
		<c:if test="${myErr != null}">
		 	에러 발생 : ${myErr.message} <br>
		</c:if>
		
		<br><hr><br>
		
		 다른 문서 포함<br>
		 1. incldue 지시어 : <%@include file="./jstl_ex6_poham.jsp" %>
		 <br>
		 2. jsp action tag : <jsp:include page="./jstl_ex6_poham.jsp"/>
		 <br>
		 3. jstl: <c:import url="./jstl_ex6_poham.jsp"/>
		
		<br><hr><br>
		
		 <c:import url="https://www.daum.net"/>
		
		<br><hr><br>
		
		 <c:set var="url" value="https://daum.net"/>
		 <c:import url="${url}" var="u"/>
		 <c:out value="${url}"/><br><Br>
		 <c:out value="${u}"/>


		
		
		
</div><!-- col-md-10의 끝 -->
</div><!-- col-md-12의 끝 -->	  
<div class="col-md-1">
</div>		  
</div> <!-- 첫번째 row의 끝 -->
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

