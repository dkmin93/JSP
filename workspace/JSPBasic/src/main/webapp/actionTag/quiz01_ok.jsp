<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	//앞에서 넘어온 국어 수학 점수의 평균을 구한다.
	//평균이 60점 이상이면 succes 페이지로 이동해서
	//"name님의 평균은 xx점 합격입니다"를 출력한다
	//평균이 60점 미만이라면 fail 페이지로 이동해서
	//"name"님의 평균은 xx점 불합격입니다"를 출력한다

	request.setCharacterEncoding("utf-8");
	
	String name = (String)request.getAttribute("name");
	String kor = (String)request.getAttribute("kor");
	String math = (String)request.getAttribute("math");
	
	
	
	double av = Double.parseDouble(kor + math) / 2.0;
	
	//다음페이지에서 name, 평균값이 필요하다
	request.setAttribute("name", name);
	request.setAttribute("av", av);
	
	if(av >= 60) {
		request.getRequestDispatcher("quiz01_success.jsp").forward(request, response);
	} else {
		request.getRequestDispatcher("quiz01_fail.jsp").forward(request, response);
		
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