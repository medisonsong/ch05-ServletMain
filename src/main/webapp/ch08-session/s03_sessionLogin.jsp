<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
<%
	//전송된 데이터 인코딩 처리
	request.setCharacterEncoding("utf-8");

	//전송된 데이터 반환
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	
	//테스트용으로 id와 비밀번호가 같으면 로그인 처리 (db연동 X)
	if(id.equals(password)){ //로그인 성공 (id=pw 로 조건)
							//속성명 		속성값
		session.setAttribute("user_id", id);
%>
	<%-- 로그인 성공+회원 서비스 UI --%>
	<%= id %>님이 로그인했습니다.<br>
	<input type="button" value="로그인 체크" onclick="location.href='s05_sessionLoginCheck.jsp'"> <%-- 인라인 방식으로 js / 이동하게 만들려고 --%> 
	<input type="button" value="로그아웃" onclick="location.href='s04_sessionLogout.jsp'">
<%
	}else{ //로그인 실패
		//다시 form으로 보내서 입력하게 함 (script를 이용 / history.go(-1))
%>
	<script type="text/javascript">
		alert('로그인에 실패했습니다.');
		history.go(-1);
	</script>
<%		
	}
%>
</body>
</html>