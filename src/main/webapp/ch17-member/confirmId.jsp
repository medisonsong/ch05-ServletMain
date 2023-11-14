<%@ page language="java" contentType="text/plain; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ page import="kr.member.dao.MemberDAO" %>
<%@ page import="kr.member.vo.MemberVO" %>
<%
	//전송된 데이터 인코딩 처리
	request.setCharacterEncoding("utf-8");
	//전송된 데이터 반환
	String id = request.getParameter("id");
	
	//DAO 객체 생성
	MemberDAO dao = MemberDAO.getInstance();
	MemberVO member = dao.checkMember(id);
	
	//id를 select해서 검색결과값이 null인거니까 미중복 / null이 아니면 중복
	if(member!=null){//아이디 중복
%>
	{"result":"idDuplicated"}
<%		
	}else{//아이디 미중복
%>
	{"result":"idNotFound"}
<%		
	}
%>