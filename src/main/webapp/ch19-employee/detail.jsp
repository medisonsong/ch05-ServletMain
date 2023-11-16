<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kr.story.dao.StoryDAO"%>
<%@ page import="kr.story.vo.StoryVO"%>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	StoryDAO dao = StoryDAO.getInstance();
	StoryVO storyVO = dao.getStory(num);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 글 상세</title>
<link rel="stylesheet" href="style.css">
</head>
<body>
<div class="page-main">
	<h1>게시판 글 상세</h1>
	<ul>
		<li>글번호 : <%= storyVO.getNum() %></li>
		<li>제목 : <%= storyVO.getTitle() %></li>
		<li>작성자 : <%= storyVO.getId() %></li>
	</ul>
	<hr size="1" noshade="noshade" width="100%">
	<p>
		<%= storyVO.getContent() %>
	</p>
	<div class="align-right">
		작성일 : <%= storyVO.getReg_date() %>
		<input type="button" value="수정" onclick="location.href='updateForm.jsp?num=<%= storyVO.getNum() %>'">
		<input type="button" value="삭제" onclick="location.href='deleteForm.jsp?num=<%= storyVO.getNum() %>'">
		<input type="button" value="목록" onclick="location.href='list.jsp'">
	</div>
</div>
</body>
</html>