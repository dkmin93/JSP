<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri ="http://java.sun.com/jsp/jstl/core" prefix ="c"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
		//스크립트릿 - 1~10까지의 합
		int sum = 0;
		for(int i = 1; i <= 10; i++) {
			sum = sum+i;
		}
	
	%>
	
	<%=sum %>
	
	<c:set var="sum" value="0" />
	<c:forEach var="i" begin="1" end="10" step="1">
		<c:set var="sum" value="${sum + i}" />
	</c:forEach>
	
	<c:out value="${sum }" />
	
	<hr>
	
	<!-- c:out은 안써도 된다. step를 따로 설정하지 않을 경우 자동으로 기본값 1이 적용된다. -->
	<h3>구구단 5단 출력</h3>
	<c:forEach var="i" begin="1" end="9" step="1">
		5 x ${i} = ${5 * i} <br>
	</c:forEach>
	
	
	<h3>2~9단까지 출력</h3>
	<c:forEach var="i" begin="2" end="9" step="1">
		<c:forEach var="j" begin="1" end="9" step="1">
			<c:out value="${i} x ${j} = ${i * j}" /><br>
		</c:forEach>
	</c:forEach>
	
	<h3>향상된 for문 for(변수명 : 배열)</h3>
	<c:set var="arr" value="<%=new int[] {1,2,3,4,5} %>"/>
	
	<c:forEach var="i" items="${arr}" varStatus="stat">
		${i}<br>
		i의 인덱스 : ${stat.index} <br>
		i의 카운트 : ${stat.count} <br>
	</c:forEach>

</body>
</html>