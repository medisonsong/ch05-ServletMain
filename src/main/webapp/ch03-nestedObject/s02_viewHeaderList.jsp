<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Enumeration" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>헤더 목록 출력</title>
</head>
<body>
<%
	//문자열로 반환하기 때문에 <String>을 넣음
	Enumeration<String> headerEnum = request.getHeaderNames();
	while(headerEnum.hasMoreElements()){
		String headerName = headerEnum.nextElement(); //파라미터 네임
		String headerValue = request.getHeader(headerName); //밸류
%>
		<%= headerName %> = <%= headerValue %><br>
<%		
	}
%>
</body>
</html>

<!-- 
[출력결과]
클라이언트(브라우저)가 서버에 보내는 정보

host = localhost:8080
connection = keep-alive
sec-ch-ua = "Chromium";v="118", "Google Chrome";v="118", "Not=A?Brand";v="99"
sec-ch-ua-mobile = ?0
sec-ch-ua-platform = "Windows"
upgrade-insecure-requests = 1
user-agent = Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36
accept = text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7
sec-fetch-site = none
sec-fetch-mode = navigate
sec-fetch-user = ?1
sec-fetch-dest = document
accept-encoding = gzip, deflate, br
accept-language = ko-KR,ko;q=0.9,en-US;q=0.8,en;q=0.7
cookie = JSESSIONID=80CEA7E75D5DB312684156A2A186A8ED

 -->