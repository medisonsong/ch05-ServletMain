<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Date" %> <%-- java.util이 아니라 java.sql.Date --%>
<%@ include file="dbInfo.jspf" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 상세 정보 보기</title>
<link rel="stylesheet" href="style.css" type="text/css">
</head>
<body>
<div class="page-main">
	<h2>글 상세정보</h2>
	<%-- pk(num)를 전달해서 한 건의 정보를 가져오려고 함 --%>
<%
	//get방식이라 setC 생략 가능
	
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
		
		//JDBC 수행 4단계 : SQL문 실행
		rs = pstmt.executeQuery();
		if(rs.next()){// pk라 명백하게 1건이기 때문에 행 안에 진입시키기만 하면됨 (num이 조작될 경우 else로 빠지게/ 고의로 num=234234 이렇게 칠때)
			String name = rs.getString("name");
			String title = rs.getString("title");
			String content = rs.getString("content");
			Date reg_date = rs.getDate("reg_date");
%>
		<ul>
			<li>글번호 : <%= num %></li>
			<li>제목 : <%= title %></li>
			<li>작성자 : <%= name %></li>
			<li>작성일 : <%= reg_date %></li>
		</ul>
		<hr width="100%" size="1" noshade="noshade">
		<p>
			<%= content %>
		</p>
		<hr width="100%" size="1" noshade="noshade">
		<div class="align-right">
			<%-- 하나의 글만 수정/ 삭제할 수 있게 get방식으로 param 넘기기 --%>
			<input type="button" value="수정" onclick="location.href='updateTestForm.jsp?num=<%= num %>'">
			<input type="button" value="삭제" onclick="location.href='deleteTestForm.jsp?num=<%= num %>'">
			<input type="button" value="게시판 목록" onclick="location.href='selectTest.jsp'">
		</div>
<%			
		}else{
%>
		<div class="result-display">
			<div class="align-center">
				글 상세 정보가 없습니다.<br>
				<input type="button" value="게시판 목록" onclick="location.href='selectTest.jsp'">				
			</div>
		</div>
<%
		}
	}catch(Exception e){
%>
		<%-- 에러가 났을 때 보여주기 위해서 UI 처리 --%>
		<div class="result-display">
			<div class="align-center">
				오류 발생! 글 상세 정보 호출 실패!<br>
				<input type="button" value="게시판 목록" onclick="location.href='selectTest.jsp'">	
			</div>
		</div>
<%
		e.printStackTrace();
	}finally{
		if(rs!=null) try{rs.close();} catch(SQLException e){}
		if(pstmt!=null) try{pstmt.close();} catch(SQLException e){}
		if(conn!=null) try{conn.close();} catch(SQLException e){}
	}
%>
</div>
</body>
</html>