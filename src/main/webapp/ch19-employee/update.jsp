<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kr.story.dao.StoryDAO"%>
<%@ page import="kr.story.vo.StoryVO"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="storyVO" class="kr.story.vo.StoryVO" />
<jsp:setProperty property="*" name="storyVO" />
<%
	StoryDAO dao = StoryDAO.getInstance();

%>
