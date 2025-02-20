<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 

	String name = request.getParameter("name");
	String age = request.getParameter("age");
	/* input 태그가 아니라 주소로 넘어온 경우엔 키 값이 문자열 변수로 들어간다 */
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%=name %>님의 나이는 <%=age %>입니다

</body>
</html>