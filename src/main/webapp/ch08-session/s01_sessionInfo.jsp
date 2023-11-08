<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
	Date time = new Date();
	SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>세션 정보</title>
</head>
<body>
세션 ID : <%= session.getId() %><br>
세션 생성 시간 : <%= session.getCreationTime() %><br> <%-- 기본값: long타입으로 출력 --%>
<%
	time.setTime(session.getCreationTime());
%>
세션 생성 시간 : <%= sf.format(time) %><br>

최근 접근 시간 : <%= session.getLastAccessedTime() %><br>
<%
	time.setTime(session.getLastAccessedTime());
%>
최근 접근 시간 : <%= sf.format(time) %><br>


<%-- web.xml에서 세션 유지시간 설정 가능 --%>
<%-- 1800(30분) -> 3000(50분)으로 변경됨 --%>

세션 유지 시간 변경하기 (기본 세션 유지 시간은 30분임)<br>
<%
	//web.xml에 50분으로 지정된 상태임
	//JSP에서 셋팅한 정보가 현재 세션에 우선 반영됨 (JSP > web.xml)
	session.setMaxInactiveInterval(60*20); // 초단위로 입력
%>

세션 유지 시간 : <%= session.getMaxInactiveInterval() %>초<br> <%-- 기본값: 초단위 --%>
<%-- 3000(50분) -> 1200(20분) 으로 변경됨
근데 별로 좋은 방법은 아님 페이지마다 지정해야 하는데 어떤건 jsp 어떤건 xml 지정되면 헷갈림
사실 세션은 안건드리는게 제일 좋음
 --%>
</body>
</html>