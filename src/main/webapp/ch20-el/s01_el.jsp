<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>표현언어(EL) 예제</title>
</head>
<body>
<table border="1" style="width:40%;">
	<tr>
		<th>표현식</th>
		<th>값</th>
	</tr>
	<tr>
		<td>\${2+5}</td> <%-- \넣어서 ${}를 일반문자로 바꿈 --%>
		<td>${2+5}</td> 
	</tr>
	<tr>
		<td>\${"10"+5}</td>
		<td>${"10"+5}</td>
	</tr>
	<tr>
		<td>\${"10"+"5"}</td>
		<td>${"10"+"5"}</td>
	</tr>
	<tr>
		<td>\${"십"+5}</td>
		<td>에러발생(EL에서의 +는 연산만)</td>
	</tr>
	<tr><%-- 자바에서는 정수 연산 외에는 다 에러였는데 여기선 정상출력됨(js와 비슷) --%>
		<td>\${4/5}</td>
		<td>${4/5}</td>
	</tr>
	<tr>
		<td>\${5/0}</td>
		<td>${5/0}</td> <%-- Infinity (js처럼 출력됨/에러가 안남- 그래서 가급적 나눗셈을 안하는게좋음) --%>
	</tr>
	<tr>
		<td>\${2+=5}</td>
		<td>${2+=5}(문자열로 연결)</td> 
	</tr>
	<tr>
		<td>\${"한국"+="서울"}</td>
		<td>${"한국"+="서울"}</td>
	</tr>
</table>
</body>
</html>
