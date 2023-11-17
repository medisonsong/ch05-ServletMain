<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kr.web.member.Member" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>set 태그</title>
</head>
<body>
<%--		속성명		속성값	  저장영역(기본값:page) --%>
<c:set var="msg" value="봄" scope="page"/>
${pageScope.msg}, ${msg}<br>

<%
	Member member = new Member();
%>

<c:set var="member" value="<%= member %>"/> <%-- scope을 명시하지 않으면 기본으로 page영역에 저장됨 --%>
<%-- 			타겟객체 	  타객객체의멤버변수(프로퍼티)   저장할값--%>
<c:set target="${member}" property="name" value="홍길동"/>
회원 이름 : ${member.name}, ${member.getName()}<br>
</body>
</html>