<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>choose 태그</title>
</head>
<body>
<c:choose>
	<c:when test="${param.name == 'dragon' && param.age >= 20}"> <%-- 조건체크 --%>
		당신의 이름은 ${param.name}이고 20세 이상입니다.
	</c:when>
	<c:when test="${param.name == 'dragon'}">
		당신의 이름은 ${param.name} 입니다.
	</c:when>
	<c:when test="${param.age >= 20}">
		당신은 20세 이상입니다.
	</c:when>
	<c:otherwise>
		당신은 'dragon'이 아니고 20세 이상이 아닙니다.
	</c:otherwise>
</c:choose>
</body>
</html>

<%-- 
처음 화면
당신은 'dragon'이 아니고 20세 이상이 아닙니다.

http://localhost:8080/ch05-ServletMain/ch21-jstl/s04_choose.jsp?name=dragon&age=20
당신의 이름은 dragon이고 20세 이상입니다.

http://localhost:8080/ch05-ServletMain/ch21-jstl/s04_choose.jsp?name=dragon
당신의 이름은 dragon 입니다.

http://localhost:8080/ch05-ServletMain/ch21-jstl/s04_choose.jsp?age=20
당신은 20세 이상입니다.
--%>