<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ include file="dbInfo.jspf" %> <%-- 같은 경로라서 파일명만 명시 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 등록 처리</title>
<link rel="stylesheet" href="style.css" type="text/css">
</head>
<body>
<%
	//전송된 데이터 인코딩 처리
	request.setCharacterEncoding("utf-8");
	//전송된 데이터 반환 받기
	String name = request.getParameter("name");
	String title = request.getParameter("title");
	String passwd = request.getParameter("passwd");
	String content = request.getParameter("content");
	
	//DB연동 
	Connection conn = null;
	PreparedStatement pstmt = null;
	String sql = null;
	
	//db연동때는 자원정리까지 해야해서 try~catch 실행
	try{
		//JDBC 수행 1단계 : 드라이버 로드
		Class.forName(driverName);
		//JDBC 수행 2단계 : Connection 객체 생성
		conn = DriverManager.getConnection(jdbcUrl,dbId,dbPass);
		
		//SQL문 작성 (insert 작업)
		sql = "INSERT INTO tboard (num,name,title,passwd,content,reg_date) VALUES (tboard_seq.nextval,?,?,?,?,SYSDATE)"; // num-sequence,reg_date-sysdate, 나머지 입력데이터  
		
		//JDBC 수행 3단계 : PreparedStatement 객체 생성
		pstmt = conn.prepareStatement(sql);
		
		//?에 데이터 바인딩
		pstmt.setString(1, name);
		pstmt.setString(2, title);
		pstmt.setString(3, passwd);
		pstmt.setString(4, content);
		
		//JDBC 수행 4단계 : sql문 실행
		pstmt.executeUpdate();
%>
		<%-- UI 처리 --%>
		<div class="result-display">
			<div class="align-center">
				글 등록 성공!<br>
				<input type="button" value="목록보기" onclick="location.href='selectTest.jsp'">
			</div>
		</div>
<%
	}catch(Exception e){
%>
		<%-- 예외 발생 시 영역만 보여주지 않고 예외가 발생했다는 것을 알려주기 위해 html 처리 --%>
		<div class="result-display">
			<div class="align-center">
				오류 발생! 글 등록 실패!<br>
				<input type="button" value="글쓰기" onclick="location.href='insertTestForm.jsp'">
			</div>
		</div>
<%		
		e.printStackTrace();
	}finally{
		//자원정리
		if(pstmt!=null) try{pstmt.close();} catch(SQLException e){}
		if(conn!=null) try{conn.close();} catch(SQLException e){}
	}
%>
</body>
</html>