<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h3>get 방식(form태그가 꼭 필요한건 아님)</h3>
	<form action="req_get_ex02.jsp">
		날짜:<input type="date" name="date"><br>
		메세지:<textarea rows="5" cols="50" name="msg"></textarea>
		
		<!-- checkbox, radio 버튼이 실제로 가지는 값은 value -->
		<br>
		동의항목:<br>
		<input type="checkbox" name="agree" value="코딩">coding404 코딩404<br>
		<input type="checkbox" name="agree" value="고딩">coding404 고딩404<br>
		<input type="checkbox" name="agree" value="꼬딩">coding404 꼬딩404<br>
		
		<br>
		<input type="submit" value="get방식">
		
	</form>
	
	
	
	
	
	

</body>
</html>