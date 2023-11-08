<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 여부 검사</title>
</head>
<body>
<%
	//getAttribute 커서 올려놓으면 guide에서 String타입으로 입력받고 Object타입으로 반환한다고 나옴 그래서 String으로 다운캐스팅
	String user_id = (String)session.getAttribute("user_id"); 
	if(user_id!=null){ //로그인이 된 경우
%>
	아이디 [<%= user_id %>]로 로그인한 상태!!<br>
	<input type="button" value="로그아웃" onclick="location.href='s04_sessionLogout.jsp'">
<%		
	}else {//로그인이 안된 경우
%>
	로그인하지 않은 상태
	<br>
	<input type="button" value="로그인" onclick="location.href='s02_sessionLoginForm.jsp'">
<%		
	}
%>
</body>
</html>