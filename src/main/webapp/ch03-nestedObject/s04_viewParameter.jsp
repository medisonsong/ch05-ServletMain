<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//전송된 데이터 인코딩 처리
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>요청 파라미터 출력</title>
</head>
<body>
<h2>request.getParameter()</h2> <!-- name/address -->
name 파라미터 = <%= request.getParameter("name") %><br>
address 파라미터 = <%= request.getParameter("address") %><br>

<h2>request.getParameterValues()</h2>
<%
	//배열을 받는거라 자바 영역 전개
	String[] values = request.getParameterValues("pet");

	if(values != null){
		for(int i=0; i<values.length; i++){
%>
			<%= values[i] %> <!-- 스크립트식 안에 표현식 사용 못해서 영역분리 -->
<%			
		}
	}
%>

</body>
</html>