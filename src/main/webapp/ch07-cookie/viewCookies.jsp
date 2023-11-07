<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.net.URLDecoder" %> <%-- 아까 인코딩해서 쿠키를 저장했으니 디코딩을 해야 안깨지게 불러올 수 있음 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠키 목록</title>
</head>
<body>
쿠키 목록<br>
<%
	//클라이언트로부터 전송된 쿠키 정보를 반환
	Cookie[] cookies = request.getCookies(); //쿠키가 session에서 만든것까지 2개가 있어서 배열로 처리
	if(cookies!=null && cookies.length>0){
		for(int i=0; i<cookies.length; i++){
%>
					<%-- 쿠키는 key:value형태라서 getName, getValue로 정보를 읽음 --%>
		<%= cookies[i].getName() %> = <%= URLDecoder.decode(cookies[i].getValue(), "UTF-8") %><br> 

<%			
		}
	}else{
%>
쿠키가 존재하지 않습니다.
<%		
	}
%>
</body>
</html>
<%--
브라우저가 열려있는 상태에서 해야 쿠키가 저장됨 (유효시간을 안줘서)

[출력]
쿠키 목록
name = 홍길동
JSESSIONID = AF0D2E238F0BE87DE5F5CE4B2AA9F7F2 / << session에서 만든거
--%>