<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
* 자료 입력 *<br>
<form action="el2_op.jsp" method="post">
이름 : <input type="text" name="irum"><br> 
성격1 : <input type="text" name="sung"></br> <!-- 배열처리되어서 el2_op에서 arraylist로 처리 -->
성격2 : <input type="text" name="sung"></br> <!-- 배열처리되어서 el2_op에서 arraylist로 처리 -->
<br>
<input type="submit">
</form>
</body>
</html>