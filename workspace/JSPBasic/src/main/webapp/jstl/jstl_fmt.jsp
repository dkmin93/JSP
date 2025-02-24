<%@ page import="java.util.Date" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- JSTL 태그 라이브러리 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
    request.setCharacterEncoding("utf-8");
    
    // 현재 날짜를 request 속성으로 저장
    Date now = new Date();
    request.setAttribute("now", now);
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>JSP 날짜 및 숫자 변환 예제</title>
</head>
<body>

    <h3>값을 형변환해서 출력할 때, 셋 중에 하나를 선택하면 된다 (DB vs Java vs 화면)</h3>

    <h3>parseDate = 문자를 날짜로 형변환</h3>
    <fmt:parseDate var="a" value="2025/02/24" pattern="yyyy/MM/dd" />
    <p>변환된 날짜: ${a}</p>

    <h3>formatDate = 날짜형을 문자타입으로 변경함</h3>
    <p><fmt:formatDate value="${now}" pattern="yyyy년 MM월 dd일 HH:mm:ss" /></p>
    <p><fmt:formatDate value="${now}" pattern="yyyy-MM-dd HH:mm:ss" /></p>

    <h3>parseNumber = 문자를 숫자로 변환</h3>
    <fmt:parseNumber var="parsedNumber1" value="3.14" type="number" />
    <p>변환된 숫자: ${parsedNumber1}</p>

    <h3>formatNumber = 숫자를 문자열로 변환</h3>
    <fmt:formatNumber value="2000" pattern="0000.00" />
	
	<hr>
	<h3>아래 값을 2025년 02월 24일 형식으로 변경</h3>
	
	<c:set var="timeA" value="2025-02-24" />
    <fmt:parseDate var="time_a" value="${timeA}" pattern="yyyy-MM-dd" />
    <fmt:formatDate value="${time_a}" pattern="yyyy년 MM월 dd일" />
    
	<c:set var="timeB" value="<%=new Date() %>" />
    <p><fmt:formatDate value="${timeB}" pattern="yyyy년 MM월 dd일" /></p>
   
	


</body>
</html>