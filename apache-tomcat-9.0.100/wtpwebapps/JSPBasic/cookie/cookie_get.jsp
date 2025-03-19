<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//쿠키를 찾아 쓰는 방법
	//쿠키는 매 요청마다 request에 담겨서 넘어온다.
	
	Cookie[] cookies = request.getCookies();

	//쿠키가 브라우저에 없으면 null이 된다.
	
	if(cookies != null) { //그러므로 반드시 null값이 아닌 상황에서만 사용해야 한다
		
		for(Cookie coo : cookies) { //쿠키의 이름을 얻는다
			String cooName = coo.getName();
			if(cooName.equals("user_id")) {
				String cooValue = coo.getValue();
				out.println("user_id쿠키의 값:" + cooValue);
			}
		}
		
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