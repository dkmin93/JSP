<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String name = request.getParameter("name");
	String height = request.getParameter("height");
	String weight = request.getParameter("weight");
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	이름:<%=name %><br>
	키:<%=height %>cm<br>
	몸무게:<%=weight %>kg<br>
	<% 
	double bmi = (double)Integer.parseInt(weight) * 10000 / (double)Integer.parseInt(height) / (double)Integer.parseInt(height); 
			/* 문자열을 double형으로 변환할때는 Double.parseDouble(); */
	%>
	BMI지수:<%=bmi %>
	
	<br>
	당신은
	<% if(bmi <= 18) {
		out.println("저체중");
	} else if(bmi >= 25) {
		out.println("과체중");
	} else {
		out.println("정상");
	}
	%>
	입니다.

	<!-- BMI공식 = kg / (cm/100 * cm/100)  -> 문자열이기 때문에 형변환 진행(실수)
	화면에 이름, 키, 몸무게 BMI지수를 출력
	if을 통해 BMI지수가 25이상 과체중, 18 이하라면 저체중, 나머지는 정상으로 출력 -->

</body>
</html>