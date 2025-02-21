<%@page import="java.util.Arrays"%>
<%@page import="java.lang.reflect.Array"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//application은 session과 사용방법은 동일하다
	//생명주기는 프로젝트를 시작할 때 1개가 생성되고 종료할 때 소멸된다
	//그래서 application객체에는 프로그램 전역적으로 사용할 값을 저장할 수 있다.
	int total = 0;
	
	//만약 app에 total이 있으면 값을 찾아와서 기존 값을 app의 total로 대체
	if(application.getAttribute("total_count") != null ) {
		total = (int)application.getAttribute("total_count");
	}
	application.setAttribute("menu", Arrays.asList("흠", "등록","구매", "관리"));
	application.setAttribute("total_count", ++total);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<a href="app_home.jsp">다음 페이지로</a>
	
	<br>
	누적된 총계:<%=total %>>

</body>
</html>