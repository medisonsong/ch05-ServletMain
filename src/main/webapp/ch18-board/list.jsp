<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kr.board.dao.BoardDAO" %>
<%@ page import="kr.board.vo.BoardVO" %>
<%@ page import="java.util.List" %>
<%
	BoardDAO dao = BoardDAO.getInstance();

	List<BoardVO> list = null;
	list = dao.getList(1, 10); //임의로 가짜 데이터 넣음 (list=arraylist)
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 목록</title>
<link rel="stylesheet" href="style.css">
</head>
<body>
<div class="page-main">
	<h1>게시판 목록</h1>
	<div class="align-right">
		<input type="button" value="글쓰기" onclick="location.href='writeForm.jsp'">
	</div>
	<!-- 목록 출력 시작 -->
	<table>
		<tr>
			<th>글번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>
		</tr>
<%
	//루프 돌면서 출력
	for(BoardVO boardVO : list){ //arraylist로부터 boardVO를 뽑아냄 (get메서드 사용)
%>
		<tr>
			<td><%= boardVO.getNum() %></td>
			<td><a href="detail.jsp?num=<%= boardVO.getNum() %>"><%= boardVO.getTitle() %></a></td>
			<td><%= boardVO.getName() %></td>
			<td><%= boardVO.getReg_date() %></td>
		</tr>
<%		
	}
%>		
	</table>
	<!-- 목록 출력 끝 -->
</div>
</body>
</html>