<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kr.board.dao.BoardDAO" %>
<%@ page import="kr.board.vo.BoardVO" %>
<%@ page import="java.util.List" %>
<%@ page import="kr.util.PagingUtil" %>

<%
	//선택한 페이지 번호
	String pageNum = request.getParameter("pageNum"); // 쌤이 준 파일 사용할 경우에는 pageNum식별자가 정해져있음 이걸써야함
	
	//pageNum이 전송되지 않으면 1페이지로 처리 (처음엔 아무것도 없어서 pageNum==null임)
	if(pageNum == null){
		pageNum = "1";
	}
	
	//페이지 처리에 대한 설정정보 (int row/pageCount, currentPage)
	//1) 한 화면에 몇 개의 글(행, 레코드)를 보여줄 지 지정
	int rowCount = 10; //얘를 조정하면 얼마나 보일지 조정 가능
	//한 화면에 몇 개의 페이지 수를 보여줄 지 지정 (1~10 다음)
	int pageCount = 10;
	//현재 선택한 페이지 타입 변환(String -> int / 연산하기 위해)
	int currentPage = Integer.parseInt(pageNum);
	
	BoardDAO dao = BoardDAO.getInstance();
	int count = dao.getCount(); //총 레코드 수
	
	//페이지 처리
	PagingUtil util = new PagingUtil(currentPage, count, rowCount, pageCount, "list.jsp"); //마지막은 주소 호출

	List<BoardVO> list = null;
	if(count>0){
		list = dao.getList(util.getStartRow(), util.getEndRow());
	}
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
<%
	if(count==0){
%>	
	<div class="result-display">저장된 글이 없습니다.</div>
<%
	}else{
%>	
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
	<!-- 페이지 표시 시작 -->
	<div class="align-center">
		<%= util.getPage() %>
	</div>
	<!-- 페이지 표시 끝 -->
<%
	}
%>	
</div>
</body>
</html>