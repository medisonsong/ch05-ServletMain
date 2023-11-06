<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>클라이언트 및 서버 정보</title>
</head>
<body>
클라이언트IP = <%= request.getRemoteAddr() %><br>
요청정보 프로토콜 = <%= request.getProtocol() %><br>
요청정보 전송방식 = <%= request.getMethod() %><br>
요청 URL(Uniform Resource Locator) =	<%= request.getRequestURL() %><br> <!-- 전체주소 반환 -->
요청 URI(Uniform Resource Identifier) = <%= request.getRequestURI() %><br> <!-- 같은 서버일때 특정 경로부터 명시 -->
컨텍스트 경로 = <%= request.getContextPath() %><br>
서버패스 = <%= request.getServletPath() %><br>
쿼리 문자열 = <%= request.getQueryString() %><br>
서버 이름 = <%= request.getServerName() %><br>
서버 포트 = <%= request.getServerPort() %><br>

</body>
</html>
<!-- 
[출력화면]
클라이언트IP = 0:0:0:0:0:0:0:1
요청정보 프로토콜 = HTTP/1.1
요청정보 전송방식 = GET
요청 URL(Uniform Resource Locator) = http://localhost:8080/ch05-ServletMain/ch03-nestedObject/s01_requestInfo.jsp
요청 URI(Uniform Resource Identifier) = /ch05-ServletMain/ch03-nestedObject/s01_requestInfo.jsp
컨텍스트 경로 = /ch05-ServletMain
서버패스 = /ch03-nestedObject/s01_requestInfo.jsp
쿼리 문자열 = null
서버 이름 = localhost
서버 포트 = 8080


URL		전체경로
URI		같은 서버일 때 
컨텍스트경로
서버패스		URI에서 컨택스트경로를 해당한 주소

모두 주소와 관련있는 것들

http://localhost:8080/ch05-ServletMain/ch03-nestedObject/s01_requestInfo.jsp
이 원주소 뒤에 ?city=seoul 를 붙이면

null값을 출력하던 쿼리문자열이 city=seoul을 출력함

경로를 알면 좋은 점 : 같은 서버 내에서 다른 자원 호출 가능

요청 url~ 쿼리문자열까진 외우는게 좋음
 -->