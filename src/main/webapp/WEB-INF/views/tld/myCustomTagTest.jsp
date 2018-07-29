<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page import="org.springframework.web.servlet.tags.Param"%>

<%@page import="java.util.Date"%>
<%@page import="java.util.HashMap"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>example 실행</title>
</head>
<body>

		<br><br>
		<button type="button" class="btn btn-warning pull-center">
		    	<a href="/ictinfo/test.ict">테스트 페이지로</a></button>
		    	
		<br><hr><br>

<%@ taglib uri="/WEB-INF/views/tld/numberFormat.tld" prefix="mytags" %>

<h2>customTag Test</h2>
<mytags:monneyFormat number="123123.574" format="#,###.00"/><br><br>





	
</body>
</html>




















