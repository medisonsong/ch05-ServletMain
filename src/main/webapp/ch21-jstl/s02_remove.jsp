<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>remove 태그</title>
</head>
<body>
<%--		속성명		속성값	저장영역=page(기본값) --%>
<c:set var="str" value="겨울"/>
데이터 삭제 전 : ${str}<br> <%-- 데이터 삭제 전 : 겨울 --%>
-------------------------<br>
<c:remove var="str"/> <%-- 동일한 속성명을 찾아서 삭제 --%>
데이터 삭제 후 : ${str} <%-- 데이터 삭제 후 : --%>
</body>
</html>