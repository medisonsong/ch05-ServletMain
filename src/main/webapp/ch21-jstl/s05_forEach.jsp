<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>forEach 태그</title>
</head>
<body>

<h4>1부터 100까지 홀수의 합</h4>
<c:set var="sum" value="0"/>
<c:forEach var="i" begin="1" end="100" step="2"> <%-- 1~100까지 2씩 증가 --%>
	<c:set var="sum" value="${sum + i}"/> <%-- 여기서 sum에 누적 후 위에 있는 var sum에 다시 저장해야함 --%>
</c:forEach>
결과 = ${sum}


<%-- 구구단 --%>
<h4>구구단 : 5단</h4>
<ul>
	<c:forEach var="i" begin="1" end="9"> <%-- i값이 page에 저장이 됨 / step 기본값=1 --%>
		<li>5 * ${i} = ${5 * i}</li>
	</c:forEach>
</ul>


<%-- 배열정보 읽어오기 // 확장 for문과 닮아있음 --%>
<h4>int형 배열</h4>
<c:set var="intArray" value="<%= new int[]{10,20,30,40,50} %>"/>
<c:forEach var="i" items="${intArray}" begin="2" end="4" varStatus="status"> <%-- i=배열명 / begin-end를 통해 읽어올 범위도 지정 가능--%>
	${status.index} - ${status.count} - [${i}]<br>
</c:forEach>
<%-- forEach >> 반복 정보, 인덱스 정보 모두 제공 
반복 정보 varStatus="status" > ${status.count}
인덱스 정보 				   > ${status.index}
--%>


<%-- hashmap에 접근해 정보읽기 
자바는 k를 알아내서 하나하나 빼냈는데 jstl은 한번에 k/v를 읽어올 수 있음 --%>
<h4>Map</h4>
<%
	HashMap<String,String> mapData = new HashMap<String,String>();

	mapData.put("name", "홍길동"); //key, value의 쌍으로 넣음
	mapData.put("job", "경찰");
%>
<c:set var="map" value="<%= mapData %>"/>
<c:forEach var="i" items="${map}">
	${i.key} = ${i.value}<br>
</c:forEach>

</body>
</html>