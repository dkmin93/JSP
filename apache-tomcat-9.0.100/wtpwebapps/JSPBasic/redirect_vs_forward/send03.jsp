<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
	String name = request.getParameter("name");
	
	//setAttribute 저장 했던 값은 getAttribute로 얻는다
	Date date = (Date)request.getAttribute("date");
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%=id %><br>
	<%=name %><br>
	<%=date %>
</body>
</html>