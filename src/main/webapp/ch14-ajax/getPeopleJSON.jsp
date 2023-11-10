<%@ page language="java" contentType="text/plain; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ include file="dbInfo.jspf" %>
[<% 
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = null;
	
	try{
		//JDBC 수행 1단계 : 드라이버 로드
		Class.forName(driverName);
		//JDBC 수행 2단계 : Connection 객체 생성
		conn = DriverManager.getConnection(jdbcUrl,dbId,dbPass);
		
		//SQL문 작성 
		sql = "SELECT * FROM people ORDER BY id asc";
		
		//JDBC 수행 3단계 : PreparedStatement 객체 생성
		pstmt = conn.prepareStatement(sql);
		
		//JDBC 수행 4단계 : SQL문 실행
		rs = pstmt.executeQuery();
		
		while(rs.next()){
			String id = rs.getString("id");
			String name = rs.getString("name");
			String job = rs.getString("job");
			String address = rs.getString("address");
			String blood_type = rs.getString("blood_type");
			
			// ,로 이어질 수 있게
			if(rs.getRow()>1){ //행 수를 알아냄
				out.print(",");
			}
%>
			{
				"id":"<%= id %>", <%-- ""가 없으면 인식 못하기 때문에 %=도 "로 감싸줌 --%>
				"name":"<%= name %>",
				"job":"<%= job %>",
				"address":"<%= address %>",
				"blood_type":"<%= blood_type %>"
			}
<%
		}
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		if(rs!=null) try{rs.close();} catch(SQLException e){}
		if(pstmt!=null) try{pstmt.close();} catch(SQLException e){}
		if(conn!=null) try{conn.close();} catch(SQLException e){}
	}
%>]