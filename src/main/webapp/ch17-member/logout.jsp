<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	//리다이렉트 할거기 때문에 ui필요 없음(그냥 main으로 넘기면 됨)
	//로그아웃
	session.invalidate();
	//main.jsp로 리다이렉트
	response.sendRedirect("main.jsp");
%>