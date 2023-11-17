<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EL의 내장객체</title>
</head>
<body>
<%
	pageContext.setAttribute("msg", "봄");
	request.setAttribute("msg2", "여름");
	session.setAttribute("msg3", "가을");
	application.setAttribute("msg4", "겨울");
	
	//내장객체 외에 다른걸 보려면 데이터를 세팅해야함 애초에 위 네개의 jsp 영역에 있는 것들을 읽기 위해 만들어진 거라서 
	String str = "겨울왕국";
	
%>
page 영역 : <%= pageContext.getAttribute("msg") %>, ${pageScope.msg}, ${msg}<br> <%-- 내장객체 생략 가능하기 때문에 ${변수명} 가능 --%>
request 영역 : <%= request.getAttribute("msg2") %>, ${requestScope.msg2}, ${msg2}<br>
session 영역 : <%= session.getAttribute("msg3") %>, ${sessionScope.msg3}, ${msg3}<br>
application 영역 : <%= application.getAttribute("msg4") %>, ${applicationScope.msg4}, ${msg4}<br>
str의 값 : <%= str %>, ${str}<br> <%-- 영역에 저장되어 있지 않아서 값을 빼내지 못함 --%>
</body>
</html>