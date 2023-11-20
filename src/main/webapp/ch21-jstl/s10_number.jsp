<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>formatNumber 태그</title>
</head>
<body>
숫자 : <fmt:formatNumber type="number" value="10000"/> <%-- 자동으로 ,넣어서 출력도 해줌! --%>
<br>
통화 : <fmt:formatNumber type="currency" value="10000" currencySymbol="$"/> <%-- 통화 형식 --%>
<br>
통화 : <fmt:formatNumber type="currency" value="10000" currencySymbol="\\"/> <%-- \(원) 표시가 특문이라 일반 문자로 바꾸기 위해선 \를 하나 더 넣어줌 --%>
<br>
퍼센트 : <fmt:formatNumber type="percent" value="0.3"/>
<br>
패턴 : <fmt:formatNumber value="12.345" pattern="0000.00"/> <%-- 패턴 : 0012.35 --%>
</body>
</html>