<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kr.member.dao.MemberDAO" %>
<%@ page import="kr.member.vo.MemberVO" %>
<% 
	//전송된 데이터 인코딩 처리
	request.setCharacterEncoding("utf-8");
	//전송된 데이터 반환
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	
	MemberDAO dao = MemberDAO.getInstance();
	//id 존재 여부 확인 
	MemberVO member = dao.checkMember(id); //member이 null이 아니어야함
	boolean check = false;
	
	if(member!=null){//id 존재
		//사용자가 입력한 비밀번호와 DB에 저장된 비밀번호 일치여부 확인
		check = member.isCheckedPassword(passwd); //일치하면 T 불일치 시 F (check 기본값이 False라 else 안 만들거임)
	}
	
	if(check){ //아이디와 비밀번호 인증 성공 (true)
		//로그인 처리 (session에 로그인 정보를 저장해놓고 판별)
		session.setAttribute("user_num", member.getNum());
		session.setAttribute("user_id", id); //로그인처리된거기 때문에 member.이걸 따로 안해도됨 (해도 되고 안해도 되고)
		//main.jsp로 리다이렉트
		response.sendRedirect("main.jsp");
	}else{//id 또는 비밀번호 인증 실패 (false)
%>
	<script>
		alert('아이디 또는 비밀번호가 불일치합니다.');
		history.go(-1); //home
	</script>
<%		
	}
%>