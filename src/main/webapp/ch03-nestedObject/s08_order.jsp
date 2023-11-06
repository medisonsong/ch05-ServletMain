<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap"%>
<%
	//전송된 데이터 인코딩 처리
	request.setCharacterEncoding("utf-8");

	//가격정보
	HashMap<String,Integer> map = new HashMap<String,Integer>();
	map.put("가방",200000);
	map.put("신발",100000);
	map.put("옷",50000);
	map.put("식사권",150000);
	
	//배송비 변수
	int delivery_fee = 5000;
	
	//합계
	int sum = 0;
	//해시맵을 사용해도 되고 배열을 사용해도 됨
	//선생님은 해시맵으로 풀어주셨음
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 구매</title>
</head>
<body>
이름 : <%= request.getParameter("name") %><br>
배송희망일 : <%= request.getParameter("order_date") %><br>
구매 상품 : 
<%
	String[] items = request.getParameterValues("item");	
	if(items!=null){
	for(int i=0; i<items.length; i++){
		sum += map.get(items[i]); //상품 가격 누적
		if(i>0) out.println(",");
%>
			<%= items[i] %>
<%
		} // end of for
	if(sum < 300000) sum += delivery_fee;
	else delivery_fee=0;
%>	
	<br>
	배송비 : <%= String.format("%,d원", delivery_fee) %><br>
	총구매 비용(배송비 포함) : <%= String.format("%,d원", sum) %><br>
<% 
	}
%>
</body>
</html>