<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<h3>path_ex01</h3>
	<!-- 절대경로는 내위치와 상관 없이 전체 경로를 다 적는 방법이다 -->
	<!-- 상대경로는 내위치에서 상대적으로 경로를 적는 방법이다 -->

	<a href="path_ex02.jsp">상대경로</a>
	<a href="http://localhost:8181/JSPBasic/path/path_ex02.jsp">절대경로</a>
	<a href="/JSPBasic/path/path_ex02.jsp">절대경로</a>


</body>
</html>