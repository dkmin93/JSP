<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<!-- 데이터를 quiz_ok.jsp 페이지로 post방식으로 전송하고 화면에 넘어온 값을 출력 -->

	<form action="quiz_ok.jsp" method="post">
	
		아이디:<input type="text" name="id"><br>
		비밀번호:<input type="password" name="pw"><br>
		생일:<input type="date" name="birth"><br>
		
		<!-- checkbox, radio 그룹은 반드시 name의 속성을 통일시켜서 하나의 그룹으로 만든다 -->
		
		관심분야:
		<input type="checkbox" name="inter" value="JAVA">JAVA
		<input type="checkbox" name="inter" value="JSP">JSP
		<input type="checkbox" name="inter" value="DB">DB
		<input type="checkbox" name="inter" value="HTML">HTML
		
		<br>
		전공:
		<input type="radio" name="major" value="국문학과">국문학과
		<input type="radio" name="major" value="수학과">수학과
		<input type="radio" name="major" value="철학과">철학과
		<input type="radio" name="major" value="경제학과">경제학과
		
		<br>
		지역
		<select name="region">
			<option>서울시</option>
			<option>경기도</option>
			<option>부산시</option>
			<option>대전시</option>
		</select>


		<br>
		
		자기소개
		<textarea rows="5" cols="50" name="hello"></textarea>
		
		<br>
		파일첨부:
		<input type="file" name="file">
		<input type="reset" value="clear" name="reset"><br>
		<input type="button" value="이 버튼을 누르면 누군가가 죽습니다" name="버튼"><br>
		<input type="submit" value="전송"><br>
		<!-- submit은 form안에 데이터를 서버로 전송하는 역할 -->
		
	</form>

</body>
</html>