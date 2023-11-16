<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kr.story.dao.StoryDAO"%>
<%@ page import="kr.story.vo.StoryVO"%>
<%@ page import="java.util.List" %>
<%@ page import="kr.util.PagingUtil" %>

<%
	//선택한 페이지 번호
	String pageNum = request.getParameter("pageNum");

	if(pageNum==null){
		pageNum = "1";
	}
	
	int rowCount = 10;
	int pageCount = 10;
	int currentPage = Integer.parseInt(pageNum);
	
	StoryDAO dao = StoryDAO.getInstance();
	int count = dao.getCount();
	
	PagingUtil util = new PagingUtil(currentPage, count, rowCount, pageCount, "list.jsp");
	
	List<StoryVO> list = null;
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
	for(StoryVO storyVO : list){
%>		
	<tr>
		<td><%= storyVO.getNum() %></td>
		<td><a href="detail.jsp?num=<%= storyVO.getNum() %>"><%= storyVO.getTitle() %></a></td>
		<td><%= storyVO.getSnum() %></td>
		<td><%= storyVO.getReg_date() %></td>
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