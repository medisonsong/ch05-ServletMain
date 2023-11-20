<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>if 태그</title>
</head>
<body>

<%-- 값을 넘기지 않아도 출력 --%>
<c:if test="true"> <%-- ""안 자체가 boolean공간임 그래서 무조건 실행함 --%>
	무조건 수행 <br>
	<%-- 아무 값을 넘기지 않아도 출력됨 --%>
</c:if>



<%-- 값을 넘겨야 출력 --%>
<c:if test="${param.name == 'dragon'}"> <%-- 밖에 "가 이미 있어서 안에서 문자열 인식할 때 '를 사용 --%>
	name 파라미터의 값이 ${param.name} 입니다. <br>
	<%-- get방식으로 data를 넘겨주게 되면 (http://localhost:8080/ch05-ServletMain/ch21-jstl/s03_if.jsp?name=dragon)
		name 파라미터의 값이 dragon 입니다. 라고 출력됨
	 --%>
</c:if>

<c:if test="${param.name.equals('dragon')}">
	name 파라미터의 값이 ${param.name} 입니다. <br>
	<%-- 상동 --%>
</c:if>

<c:if test="${param.age >= 20}">
	당신의 나이는 20세 이상입니다.
	<%-- http://localhost:8080/ch05-ServletMain/ch21-jstl/s03_if.jsp?name=dragon&age=30
		무조건 수행
		name 파라미터의 값이 dragon 입니다.
		name 파라미터의 값이 dragon 입니다.
		당신의 나이는 20세 이상입니다.			--%>
</c:if>

</body>
</html>