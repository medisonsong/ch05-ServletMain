<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kr.employee.dao.EmployeeDAO" %>
<%@ page import="kr.employee.vo.EmployeeVO" %>
<%
	String user_id = (String)session.getAttribute("user_id");
	if(user_id == null){
		response.sendRedirect("main.jsp");
	}else{
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		String passwd = request.getParameter("passwd");
		
		EmployeeDAO dao = EmployeeDAO.getInstance();
		EmployeeVO vo = dao.checkEmployee(id);
		boolean check = false;
		
		if(vo != null && user_id.equals(id)){
			check = vo.isCheckedPassword(passwd);
		}
		if(check){
			dao.deleteEmployee(vo.getSnum());
			session.invalidate();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 탈퇴</title>
<link rel="stylesheet" href="style.css">
</head>
<body>
<div class="page-main">
	<h1>회원탈퇴 완료</h1>
	<div class="result-display">
		<div class="align-center">
			회원 탈퇴가 완료되었습니다.<br>
			<button onclick="location.href='main.jsp'">홈으로</button>
		</div>
	</div>
</div>
</body>
</html>
<%
		}else{
%>
	<script>
		alert('아이디 또는 비밀번호가 불일치합니다.');
		history.go(-1);
	</script>
<%			
		}
	}
%>