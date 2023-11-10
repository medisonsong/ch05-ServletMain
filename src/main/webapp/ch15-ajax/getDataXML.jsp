<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ include file="dbInfo.jspf" %>
<?xml version="1.0" encoding="UTF-8"?>
<items>
<%
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
		sql = "SELECT * FROM item ORDER BY code DESC";
		
		//JDBC 수행 3단계 : PreparedStatement 객체 생성
		pstmt = conn.prepareStatement(sql);
		
		//JDBC 수행 4단계 : SQL문 실행
		rs = pstmt.executeQuery();
		
		//JDBC 수행 4단계 : 
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		if(rs!=null) try{rs.close();} catch(SQLException e){}
		if(pstmt!=null) try{pstmt.close();} catch(SQLException e){}
		if(conn!=null) try{conn.close();} catch(SQLException e){}
	}
%>
</items>