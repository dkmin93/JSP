<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<!-- request 폴더 안에 req_get_ex01 페이지로 상대경로 -->
	<a href="../../request/req_get_ex01.jsp">상대경로</a>
	
	<!-- img태그로 html/img 폴더 안에 있는 이미지를 상대경로 -->
	<img src="../../html/img/a.gif">
	<!-- img태그로 html/img 폴더 안에 있는 이미지를 절대경로 -->
	<img src="/JSPBasic/html/img/a.gif">
	
	<!-- a링크를 통해서 MyServlet 페이지로 상대경로 -->
	<a href="../../apple">상대경로</a>
	<!-- a링크를 통해서 MyServlet 페이지로 절대경로 -->
	<a href="/JSPBasic/apple">절대경로</a>
	
</body>
</html>