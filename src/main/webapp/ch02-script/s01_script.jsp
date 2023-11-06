<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스크립트릿과 표현식</title>
</head>
<body>
<%
	//스크립트릿: 변수 선언, 연산, 제어문, 출력 (자바코드를 실행하는 장소)
	int sum = 0;
	for(int i=1; i<=100; i++){
		sum += i; //누적
	}
%>
<%-- 
JSP 주석
표현식 : 변수의 값 출력, 메서드의 결과값 출력, 연산의 결과값 출력

HTML 주석을 쓰면 페이지 소스보기에 보이기 때문에 바람직하진 않음
JSP 주석은 인코딩할 때 빠지기 때문에 이걸 쓰는 게 바람직함

페이지의 흐름을 명시할 때 제외하고 JSP 주석을 사용하는 게 좋음 (에러가 생길 수도 있기 때문)
--%>
1부터 100까지의 합은 <%= sum /*여러줄 주석 사용 가능, 한줄 주석은 오류*/ %>
</body>
</html>