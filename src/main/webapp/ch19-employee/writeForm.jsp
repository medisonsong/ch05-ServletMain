<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기</title>
<link rel="stylesheet" href="style.css">
<script type="text/javascript">
window.onload = function(){
	let myForm = document.getElementById('write_form');
	
	myForm.onsubmit = function(){
		let items = document.querySelectorAll('')
	};
};
</script>
</head>
<body>
<div class="page-main">
	<h1>글쓰기</h1>
	<form id="write_form" action="write.jsp" method="post">
		<ul>
			<li>
				<label for="title">제목</label>
				<input type="text" name="title" id="title" size="30" maxlength="50">
			</li>
			<li>
				<label for="title">이름</label>
				<input type="text" name="name" id="name" size="10" maxlength="10">
			</li>
			<li>
				<label for="title">비밀번호</label>
				<input type="password" name="passwd" id="passwd" size="10" maxlength="12">
			</li>
			<li>
				<label for="title">내용</label>
				<textarea rows="5" cols="40" name="content" id="content"></textarea>
			</li>
		</ul>
		<div class="align-center">
			<input type="submit" value="글쓰기">
			<input type="button" value="목록" onclick="location.href='list.jsp'">
		</div>
	</form>
</div>
</body>
</html>