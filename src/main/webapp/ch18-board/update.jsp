<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kr.board.dao.BoardDAO" %>
<%@ page import="kr.board.vo.BoardVO" %>
<%
	//전송된 데이터 인코딩 처리
	request.setCharacterEncoding("utf-8");
%>
<%-- 인코딩 처리 후 자바빈을 만들고 자바빈에 넣은 뒤 update메소드로 가공 --%>
<jsp:useBean id="boardVO" class="kr.board.vo.BoardVO"/> <%-- 자바빈 생성 --%>
<jsp:setProperty property="*" name="boardVO"/> <%-- request에 전송된 데이터를 자바빈에 넣어줌 --%>
<%
	BoardDAO dao = BoardDAO.getInstance();
	
	//비밀번호 인증하기
	BoardVO db_board = dao.getBoard(boardVO.getNum()); //pk를 넣어서 한건의 레코드 읽어오기
	boolean check = false;
	if(db_board!=null){
		//비밀번호 일치 여부 체크
		check = db_board.isCheckedPassword(boardVO.getPasswd()); //우리가 전송한 비밀번호 넘기기
	}
	if(check){ //인증 성공
		boardVO.setIp(request.getRemoteAddr()); // ip세팅 후 update
		dao.update(boardVO);
%>
	<script type="text/javascript">
		alert('글 수정을 완료했습니다.');
		location.href='detail.jsp?num=<%= boardVO.getNum() %>';
	</script>
<%		
	}else{//인증 실패
%>
	<script type="text/javascript">
		alert('비밀번호 불일치');
		history.go(-1);
	</script>
<%		
	}
%>
