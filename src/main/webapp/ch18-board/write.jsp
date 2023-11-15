<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kr.board.dao.BoardDAO" %>
<%
	//전송된 데이터 인코딩 처리
	request.setCharacterEncoding("utf-8");
%>
<%-- mvc 패턴은 model-1에서만 사용가능(usebean, setproperty) --%>
<jsp:useBean id="board" class="kr.board.vo.BoardVO"/> <%-- 자바빈 객체 생성 --%>
<jsp:setProperty property="*" name="board" /> <%-- setter를 찾아서 데이터 넣어줌(*- 모든 프로퍼티에 데이터 넣/ name=board-> 위 BoardVO 뜻함) --%>
<%
	//ip주소 알아내기 (client의 ip주소 저장)
	board.setIp(request.getRemoteAddr());

	BoardDAO dao = BoardDAO.getInstance();
	dao.insert(board); // useBean id="board"/ name="board"/ insert(board) 모두 다 같은 자바빈을 뜻함
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기 완료</title>
<link rel="stylesheet" href="style.css">
</head>
<body>
<div class="page-main">
	<h1>글쓰기 완료</h1>
	<div class="result-display">
		<div class="align-center">
			게시판에 글을 등록했습니다.<br>
			<button onclick="location.href='list.jsp'">목록</button>
		</div>
	</div>
</div>
</body>
</html>