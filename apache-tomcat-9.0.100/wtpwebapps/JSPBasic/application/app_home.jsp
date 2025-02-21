<%@page import="org.apache.catalina.tribes.util.Arrays"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.lang.reflect.Array"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<String> list = (ArrayList)application.getAttribute("menu");
	
	//데이터베이스 연결 작업
	application.setAttribute("menu", Arrays.asList("흠", "등록","구매", "관리"));

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<ul>
		<%for(String menu : list) {%>
		<li><%=menu %></li>
		<%} %>
	</ul>
	
	

</body>
</html>