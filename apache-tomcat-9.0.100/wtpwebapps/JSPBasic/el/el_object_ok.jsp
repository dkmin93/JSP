<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	//DepartmentDTO dto = (DepartmentDTO)request.getAttribute("dto");
	//String name = (String)request.getAttribute("name");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<h3>scope키워드는 전부 생략이 가능하다</h3>
	<!-- request > session > application 순서로 참조한다 -->
	
	${requestScope.dto }
	${requestScope.dto.departmentId }<br>
	${dto.departmentName }<br>
	${dto.managerId }<br>
	${dto.locationId }<br>
	
	<!-- session키워드를 생략하면 어디서 끌어온건지 알아보기 힘들 수 있으므로 생략은 가능하지만 남겨두는 것이 좋다 -->
	${sessionScope.userId }<br>
	${applicationScope.menu }<br>
	
	
	
	
	

</body>
</html>