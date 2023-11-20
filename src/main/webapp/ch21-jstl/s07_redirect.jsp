<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:redirect url="s01_set.jsp">
	<%-- 	파라미터네임			값 --%>
	<c:param name="id" value="dragon"/>
	<c:param name="name" value="petter"/>
</c:redirect>

<%-- 
http://localhost:8080/ch05-ServletMain/ch21-jstl/s01_set.jsp;jsessionid=871F193D4213C1398A019754DF7F33F0?id=dragon&name=petter

redirect한 페이지에 get방식으로 parameter 문자열로 값을 전달할 수 있음
id=dragon&name=petter <<
--%>