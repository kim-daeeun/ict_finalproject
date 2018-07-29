<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="java.util.*"%>


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




		<br><br>
		<button type="button" class="btn btn-warning pull-center">
		    	<a href="/ictinfo/test.ict">테스트 페이지로 이동</a></button>

<br><hr><br>


<%
	// VO -> Map으로 대체
	Map<String, List<Map>> searchType = new HashMap<String, List<Map>>();
	Map map1 = new HashMap();
	map1.put("a", "aa");
	map1.put("b", "bb");
	map1.put("c", "cc");
	
	Map map2 = new HashMap();
	map2.put("a", 100);
	map2.put("b", 200);
	map2.put("c", 300);
	
	List<Map> list1 = new ArrayList<Map>();
	list1.add(map1);
	list1.add(map2);
	
	searchType.put("list1", list1);
	
	request.setAttribute("searchType", searchType);
%>

<!-- Html의 자료구조 -->
<!-- {list1=[{b=bb, c=cc, a=aa}, {c=300, a=100, b=200}]} -->

<!-- 값 호출 방법 -->
<!-- ${searchType.list1[0].a} -->

<c:set var="list1" value="${searchType.list1}" />

<table>
	<c:forEach var="searchTypeItem" items="${list1}" varStatus="status">
		<tr>
			<td>검색유형 : ${searchTypeItem.a}</td>
			<td>검색유형 : ${searchTypeItem.b}</td>
			<td>검색유형 : ${searchTypeItem.c}</td>
		</tr>
	</c:forEach>
</table>

<br><hr><br>	

<!-- 위에 것과 똑같음 -->		
		
<%
	Map<String, String> map11 = new HashMap<String, String>();
	map11.put("a", "aa");
	map11.put("b", "bb");
	map11.put("c", "cc");
	
	Map<String, Integer> map22 = new HashMap<String, Integer>();
	map22.put("k", 100);
	map22.put("d", 200);
	map22.put("e", 300);
	
	List<Map> list11 = new ArrayList<Map>();
	list11.add(map11);
	list11.add(map22);
	
	Map<String, List<Map>> search = new HashMap<String, List<Map>>();
	search.put("list11", list11);
	
	request.setAttribute("search", search);	
%>
<%@ taglib prefix ="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %><br>

<c:set var="list11" value="${search.list11}" />
<table>
	<c:forEach var="i" items="${list11}" varStatus="status">
		<tr>
			<td>
				1 : <c:out value="${i.a}" />
				2 : <c:out value="${i.b}" />
				3 : <c:out value="${i.c}" />
			</td>
			<td>
				<c:catch var="calErr">
				4 : <c:out value="${(i.k + i.d + i.e)/0}" />
				5 : <fmt:formatNumber value="${(i.k + i.d + i.e)/0}" pattern="#,##0.0"/>
				</c:catch>	
				<c:if test="${calErr != null}" >
					 Error : <c:out value="${calErr.message}" />
				</c:if>
								
			</td>
		</tr>
	</c:forEach>
</table>



	
		
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

