<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Date" %>
<%@ include file="dbInfo.jspf" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 상세 정보 보기</title>
<link rel="stylesheet" href="style.css" type="text/css">
</head>
<body>
<%
	int num = Integer.parseInt(request.getParameter("num"));

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = null;

	try{
		Class.forName(driverName);
		conn=DriverManager.getConnection(jdbcUrl, dbId, dbPass);
		
		sql = "SELECT * FROM product WHERE num=?";
		
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, num);
		
		rs = pstmt.executeQuery();
		if(rs.next()){
			String name = rs.getString("name");
			int price = rs.getInt("price");
			int stock = rs.getInt("stock");
			String origin = rs.getString("origin");
			String reg_date = rs.getString("reg_date");
%>
	<div class="page-main">
		<h2>상품 정보</h2>
			<ul>
				<li>글번호 : <%= num %></li>
				<li>상품명 : <%= name %></li>
				<li>가격 : <%= String.format("%,d원",price) %></li>
				<li>재고 : <%= String.format("%,d개",stock) %></li>
				<li>원산지 : <%= origin %></li>
				<li>등록일 : <%= reg_date %></li>
			</ul>
		<hr width="100%" size="1" noshade="noshade">
		<div class="align-right">
			<input type="button" value="수정" onclick="location.href='updateTestForm.jsp?num=<%= num %>'">
			<input type="button" value="삭제" onclick="location.href='deleteTestForm.jsp?num=<%= num %>'">
			<input type="button" value="상품 목록" onclick="location.href='selectTest.jsp'">
		</div>	
	</div>
<%		
		}else{
%>
		<div class="result-display">
			<div class="align-center">
				상품 정보가 없습니다.<br>
				<input type="button" value="상품 목록" onclick="location.href='selectTest.jsp'">
			</div>
		</div>
<%			
		}
	}catch(Exception e){
%>
		<div class="result-display">
			<div class="align-center">
				오류 발생! 상품 정보 호출 실패!<br>
				<input type="button" value="상품 목록" onclick="location.href='selectTest.jsp'">
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