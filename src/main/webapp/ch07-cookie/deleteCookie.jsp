<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠키 삭제</title>
</head>
<body>
<%
	//클라이언트로부터 전송된 쿠키 정보를 반환
	Cookie[] cookies = request.getCookies();
	if(cookies!=null && cookies.length>0){ //쿠키 정보가 존재함
		for(int i=0; i<cookies.length; i++){
			//쿠키명이 name인 쿠키를 검색해서 존재하면 쿠키 삭제
			if(cookies[i].getName().equals("name")){ //문자열을 비교하기 때문에 equals 사용
				Cookie cookie = new Cookie("name",""); // 어차피 삭제할거라서 값은 명시x
				cookie.setMaxAge(0); //쿠키를 삭제하기 위해 유효시간 0으로 수정 (쿠키 정보 제거)
				//생성된 쿠키를 클라이언트에 전송
				response.addCookie(cookie);
				
				out.println("name 쿠키를 삭제합니다");
			}
		}
	}else{
		out.println("쿠키가 존재하지 않습니다.");
	}
%>
</body>
</html>
<%--
remove cookie이런게 있는게 아니라 그냥 유효시간을 만료시켜서 쿠키를 삭제함
--%>