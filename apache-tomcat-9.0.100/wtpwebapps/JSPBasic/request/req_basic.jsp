<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	String uri = request.getRequestURI(); //uri
	StringBuffer url = request.getRequestURL(); //url
	String conPath = request.getContextPath(); //컨텍스트패스 - 프로젝트 구분단위
	String address = request.getRemoteAddr();//원격접속 주소

	System.out.println(address);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

uri:<%=uri %><br> <!-- 경로값 -->
url:<%=url %><br> <!-- 전체 주소 -->
컨텍스트패스:<%=conPath %><br> <!-- was가 프로젝트를 식별하는 이름 -->
상대방의접속주소:<%=address %><br>



</body>
</html>