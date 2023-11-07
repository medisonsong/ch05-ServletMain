<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String company = request.getParameter("company"); /*같은 request를 공유하기 때문에 layout에 명시한 company로 값 호출*/
%>
<!-- 상단 시작 -->
<b><%= company %></b>
상단 메뉴 : 
<a href="#">HOME</a>
<a href="#">INFO</a>
<a href="#">SERVICE</a>
<!-- 상단 끝 -->
<%--
layout.jsp를 실행하면 됨
--%>