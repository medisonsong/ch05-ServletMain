<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder" %> <%-- 한글일 경우에는 깨지기 때문에 encoding을 해야함 --%>
<%
	Cookie cookie = new Cookie("name",URLEncoder.encode("홍길동", "UTF-8")); //cookie는 name:value의 쌍으로 만듦/ encode("값,encode형식")
	//쿠키 유효시간 지정(단위:초)
	//쿠키 유효시간을 지정하면 클라이언트 영역에 파일을 생성해서 쿠키 정보를 보관함
	//쿠키 유효시간을 지정하지 않으면 메모리에 쿠키 정보를 보관
	//cookie.setMaxAge(30*60);
	//cookie.setMaxAge(-1); //메모리에 쿠키 정보 보관
	
	//생성한 쿠키를 클라이언트로 전송
	response.addCookie(cookie);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠키 생성</title>
</head>
<body>
 <%--		쿠키명						쿠키값 --%>
<%= cookie.getName() %> = <%= cookie.getValue() %>
</body>
</html>