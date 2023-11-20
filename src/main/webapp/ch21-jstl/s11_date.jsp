<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>formatDate 태그</title>
</head>
<body>
<c:set var="now" value="<%= new java.util.Date() %>"/>
${now}<br> <%-- Mon Nov 20 12:32:40 KST 2023 --%>

<%-- simpleDateFormat이 없어도 한글로 나올 수 있게끔 태그 처리 --%>
<fmt:formatDate value="${now}" type="date" dateStyle="full"/> <%--2023년 11월 20일 월요일 --%>
<br>
<fmt:formatDate value="${now}" type="date" dateStyle="short"/> <%-- 23. 11. 20. --%>
<br>

<fmt:formatDate value="${now}" type="time" timeStyle="full"/> <%-- 오후 12시 35분 58초 대한민국 표준시 --%>
<br> 
<fmt:formatDate value="${now}" type="both" dateStyle="full" timeStyle="full"/> <%-- 2023년 11월 20일 월요일 오후 12시 37분 34초 대한민국 표준시 --%>
<br>


<%-- 원하는 것만 명시하고 싶을 땐 pattern 사용 --%>
<fmt:formatDate value="${now}" pattern="yyyy-MM-dd E요일 a hh:mm:ss"/> <%-- 2023-11-20 오후 12:40:17 --%>
</body>
</html>