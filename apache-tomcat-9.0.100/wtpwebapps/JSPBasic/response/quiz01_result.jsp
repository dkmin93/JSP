<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	/* 첫번째 페이지에서 넘어온 id, pw 받기 */
	/* id가 aaa123 pw가 1234로 동일하면 로그인 성공이라고 간주하고 quiz01_welcome으로 이동 */
	/* 둘 중 하나라도 틀리면 quiz01_fail페이지로 리다이렉트 */
	
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	
	if(id.contentEquals("aaa123") && pw.contentEquals("1234")) {
		response.sendRedirect("quiz01_welcome.jsp");
	} else {
		response.sendRedirect("quiz01_fail.jsp");
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