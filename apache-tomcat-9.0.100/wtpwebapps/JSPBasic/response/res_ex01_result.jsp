<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//데이터를 받는 페이지, 자바코드만 필요하다. == servlet으로 변경가능하다.

	request.setCharacterEncoding("utf-8");
	String name = request.getParameter("name");
	String age = request.getParameter("age");
	int a = Integer.parseInt(age);
	
	if(a >= 20) { //주류구매 페이지로 이동
		response.sendRedirect("res_ex01_success.jsp");
	} else { //실패 페이지로 이동
		response.sendRedirect("res_ex01_fail.jsp");
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	

</body>
</html>