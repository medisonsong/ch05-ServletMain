<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kr.member.dao.MemberDAO" %>
<%@ page import="kr.member.vo.MemberVO" %>
<%
	//전송된 데이터 인코딩 처리 (post 방식일 땐 무조건 넣어야함)
	request.setCharacterEncoding("utf-8");
	
	//데이터를 받고 자바빈에 담아서 전달
	//1) 자바빈(VO) 생성 후 담기
	/* 
	MemberVO member = new MemberVO();
	member.setId(request.getParameter("id"));
	member.setName(request.getParameter("name"));
	member.setPasswd(request.getParameter("passwd"));
	member.setEmail(request.getParameter("email"));
	member.setPhone(request.getParameter("phone"));*/
%>
<%-- 액션태그를 이용해서 자바빈(VO) 객체 생성 --%>
<jsp:useBean id="member" class="kr.member.vo.MemberVO"/> <%--id가 참조변수(식별자)/ class에 명시할 때에도 풀네임으로 명시해야함 --%>
<%-- request로부터 전송된 데이터를 읽어들여 자바빈에 저장 (일부러 param과 자바빈의 property값 일치시켰음)--%>
<jsp:setProperty property="*" name="member"/> <%-- property=> MemberVO안에 있는 멤버 변수 --%>


<%	
	//넘겨주기 (MemberDAO 객체 생성 후 넘겨줄건데 private이기 때문에 memberDAO dao = new MemberDAO()라고 호출하지 못함)
	//MemberDAO 객체 생성
	MemberDAO dao = MemberDAO.getInstance();
	dao.insertMember(member); // insertMember안에서 멤버변수를 활용할 수 있게 전달
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="style.css">
</head>
<body>
<div class="page-main">
	<h1>회원가입 완료</h1>
	<div class="result-display">
		<div class="align-center">
			회원가입 성공!<br>
			<button onclick="location.href='main.jsp'">홈으로</button>
		</div>
	</div>
</div>
</body>
</html>