<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
    request.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP JSTL 예제</title>
</head>
<body>

	<%-- 감싸줄거면 </c:set> 그냥 하나로 끝낼거면 <c:set /> --%>
    
    <!-- 변수 선언 -->
    <c:set var="a" value="홍길동" />
    <!-- 변수 출력 -->
    <c:out value="${a}" />

    <% if (true) { %>
        <b>무조건 실행되는 문장</b>
    <% } %>
    <br>
    
    <c:if test="${true}">
        <b>무조건 실행되는 문장</b>
    </c:if>
    <br>

    <!-- GET 요청에서 name 파라미터가 '홍길동'이면 실행 -->
    <c:if test="${param.name eq '홍길동'}">
        참 입니다
    </c:if>

    <!-- GET 요청에서 age 파라미터가 20 이상이면 실행 -->
    <c:if test="${param.age >= 20}">
        성인입니다.
    </c:if>

    <!-- GET 요청에서 age 파라미터가 20 미만이면 실행 -->
    <c:if test="${param.age < 20}">
        미성년자입니다.
    </c:if>

</body>
</html>