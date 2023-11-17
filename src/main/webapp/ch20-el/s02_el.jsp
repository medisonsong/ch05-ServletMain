<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//전송받은 데이터 인코딩 처리 (아래에서 post로 자기 자신에게 보냈기 때문에)
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EL의 내장객체</title>
</head>
<body>
	<h3>EL의 사용 - 파라미터값 처리</h3>
	<form action="s02_el.jsp" method="post">
		이름 : <input type="text" name="name">
		<input type="submit" value="확인">
	</form>
<p>
	이름은 <%= request.getParameter("name") %><br>
	이름은 ${param.name}<br>
	이름은 ${param["name"]}
</p>
</body>
</html>