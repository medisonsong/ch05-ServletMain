<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스크립트 - 선언부,스크립트릿,표현식</title>
</head>
<body>
<h2>배열의 내용 출력 - 선언부,스크립트릿</h2>
<%!
	//선언부: 변수 선언, 메서드 선언
	String[] str = {"JSP가","정말","재미","있다"};
%>
<table border="1">
	<tr>
		<th>배열의 인덱스</th>
		<th>배열의 내용</th>
	</tr>
<%
	//스크립트릿: 변수 선언, 연산, 제어문, 출력
	for(int i=0; i<str.length; i++){
		out.println("<tr>");
		out.println("<td>" + i + "</td>"); //인덱스 명시
		out.println("<td>" + str[i] + "</td>"); //내용 명시
		out.println("</tr>");
	}
%>
</table>

<br>

<h2>배열의 내용 출력 - 선언부,스크립트릿,표현식</h2>
<table border="1">
	<tr>
		<th>배열의 인덱스</th>
		<th>배열의 내용</th>
	</tr>
	
<%-- //java영역과 html 영역을 완전히 분리시킴 --%>
<% 
	for(int i=0; i<str.length; i++){ //java영역
%>		
	<tr>
		<td><%= i %></td>
		<td><%= str[i] %></td>
	</tr>
<%
	}
%>
</table>


<br>

<h2>배열의 내용 출력</h2>
<table border="1">
	<tr>
		<th>배열의 내용</th> <%--확장for문은 인덱스가 없어서 내용만 명시--%>
	</tr>
<%
	for(String s : str){
%>
	<tr>
		<td><%= s %></td>
	</tr>
<%
	}
%>
</table>
</body>
</html>

<%--

1) servlet 방식으로 출력 (권장x)
2) 스크립트 요소를 모두 이용해서 for문으로 출력
3) 확장 for문으로 출력

+메서드를 만들어도 이 jsp 파일 안에서만 사용할 수 있고 다른 파일에서는 사용하지 못함 --> 재활용성이 없음
-------------------------------------------------------
<h2>배열의 내용 출력 - 선언부,스크립트릿,표현식</h2> 아래 구문 보면
java 영역과 html 영역을 분리시켜서 이어줌
tag가 스크립트릿 영역 밖에 있더라도 java 영역의 루프를 같이 돌면서 html 태그 내용을 출력함
<tr>
	<td>인덱스</td>
	<td>인덱스의 값</td>
</tr>
이것처럼 한 코드 구문에 선언부, 스크립트릿, 표현식을 모두 사용할 수 있음

=======================================================

문자열 하나만 명시할 때 out.println() 을 사용하는데 (써블릿에서 사용했던 방법)
반복문을 쓰거나 문자열이 길어질 때에는 jsp의 선언부, 스크립트릿, 표현식을 쓰는 방법을 권장함

--%>