<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kr.employee.dao.EmployeeDAO" %>
<%@ page import="kr.employee.vo.EmployeeVO" %>
<%
	//전송된 데이터 인코딩 처리
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="vo" class="kr.employee.vo.EmployeeVO"/>
<jsp:setProperty property="*" name="vo"/>

<%
	EmployeeDAO dao = EmployeeDAO.getInstance();
	dao.insertEmployee(vo);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사원등록</title>
<link rel="stylesheet" href="style.css">
</head>
<body>
<div class="page-main">
	<h1>사원등록 완료</h1>
	<div class="result-display">
		<div class="align-center">
			회원가입 성공!<br>
			<button onclick="location.href='main.jsp'">홈으로</button>
		</div>
	</div>
</div>
</body>
</html>