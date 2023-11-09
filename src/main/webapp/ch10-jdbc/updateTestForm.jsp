<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %> <%-- 날짜 수정은 안할거라 date는 import x --%>
<%@ include file="dbInfo.jspf" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글수정</title>
<link rel="stylesheet" href="style.css" type="text/css">
<script type="text/javascript" src="script.js"></script>
</head>
<body>
<div class="page-main">
	<h2>글수정</h2>
<%			//전송된 데이터를 읽고 데이터를 연동하는 순서
	int num = Integer.parseInt(request.getParameter("num"));

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = null;
	
	try{
		//JDBC 수행 1단계 : 드라이버 로드
		Class.forName(driverName);
		
		//JDBC 수행 2단계 : Connection 객체 생성
		conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
		
		//SQL문 작성
		sql = "SELECT * FROM tboard WHERE num=?";
				
		//JDBC 수행 3단계 : PreparedStatement 객체 생성
		pstmt = conn.prepareStatement(sql);
		
		//?에 데이터 바인딩
		pstmt.setInt(1, num);
		
		//JDBC 수행 4단계 : SQL문을 테이블에 반영하고 결과행들을 ResultSet에 담음
		rs = pstmt.executeQuery();
		if(rs.next()){
			//비밀번호는 뽑아내봤자 password라 안보임 그래서 세개만 뽑음
			String name = rs.getString("name");
			String title = rs.getString("title");
			String content = rs.getString("content");
%>
	<form id="myForm" action="updateTest.jsp" method="post">
		<%-- 한 행을 통째로 update하는데 num은 필수고, 값을 임의로 수정하면 안되니까 숨겨서 보낼거임 --%>
		<input type="hidden" name="num" value="<%= num %>">
		<ul>
			<li>
				<label for="name">이름</label>
				<input type="text" name="name" id="name" value="<%= name %>" size="20" maxlength="10">
			</li>
			<li>
				<label for="title">제목</label>
				<input type="text" name="title" id="title" value="<%= title %>" size="30" maxlength="50">
			</li>
			<li>
				<label for="passwd">비밀번호</label>
				<input type="password" name="passwd" id="passwd" size="20" maxlength="10">
			</li>
			<li>
				<label for="content">내용</label>
				<%-- textarea는 >< 사이에 공백/ 줄바꿈이 다 반영되기 때문에 주의해야함 --%>
				<textarea rows="5" cols="40" name="content" id="content"><%= content %></textarea> 
			</li>
		</ul>
		<div class="align-center">
			<input type="submit" value="수정">
			<input type="button" value="목록" onclick="location.href='selectTest.jsp'">
		</div>
	</form>

<%			
		}else{
			
%>
	<div class="result-display">
		<div class="align-center">
			수정할 글 정보 호출 실패!<br>
			<input type="button" value="게시판 목록" onclick="location.href='selectTest.jsp'">
		</div>
	</div>
				
<%		

		}
	}catch(Exception e){
		
%>		
	<div class="result-display">
		<div class="align-center">
			오류 발생! 수정할 글 정보 호출 실패!<br>
			<input type="button" value="게시판 목록" onclick="location.href='selectTest.jsp'"> 
		</div>
	</div>
<%		
		e.printStackTrace();
	}finally{
		//자원정리
		if(rs!=null) try{rs.close();} catch(SQLException e){}
		if(pstmt!=null) try{pstmt.close();} catch(SQLException e){}
		if(conn!=null) try{conn.close();} catch(SQLException e){}
	}

%>
</div>
</body>
</html>