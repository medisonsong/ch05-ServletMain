<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠키 값 변경</title>
</head>
<body>
<%
	//클라이언트로부터 전송된 쿠키 정보를 반환
	Cookie[] cookies = request.getCookies();
	if(cookies!=null && cookies.length>0){ //쿠키 정보가 존재함
		for(int i=0; i<cookies.length; i++){
			//쿠키명이 name인 쿠키를 검색해서 존재하면 쿠키 값을 변경
			if(cookies[i].getName().equals("name")){ //문자열을 비교하기 때문에 equals 사용
				Cookie cookie = new Cookie("name", URLEncoder.encode("JSP프로그래밍","UTF-8")); // 같은 이름으로 덮어씌워서 변경
				//생성한 쿠키를 클라이언트에 전송
				response.addCookie(cookie);
				
				out.println("name 쿠키의 값을 변경했습니다.");
			}
		}
	}else{
		out.println("쿠키가 존재하지 않습니다.");
	}
%>
</body>
</html>
<%--
쿠키를 변경하려면 순서가 있음
1) 기존 쿠키가 있는지 없는지 확인
2) 있으면 덮어씌우는 방식으로 값 변경
3) 클라이언트로 쿠키 전송

makeCookie 실행시키고 브라우저 안 끈 상태로 이거 실행해보기
그러면  out.println("name 쿠키의 값을 변경했습니다."); 
viewCookie 다시 실행하면 바뀐 값으로 나옴
--%>