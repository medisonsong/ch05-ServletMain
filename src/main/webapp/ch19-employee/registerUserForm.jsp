<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사원등록</title>
<link rel="stylesheet" href="style.css">
<script type="text/javascript" src="<%= request.getContextPath() %>/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	let count = 0;
	
	$('#confirm_id').click(function(){
		if($('#id').val().trim()==''){
			alert('아이디를 입력하세요');
			$('#id').val('').focus();
			return;
		}
		
		//서버통신
		$.ajax({
			url:'confirmId.jsp',
			type:'post',
			data:{id:$('#id').val()},
			dataType:'json',
			success:function(param){
				if(param.result == 'idDuplicated'){
					count = 0;
					$('#id_signed').text('아이디 중복').css('color', 'red');
					$('#id').val('').focus();
				}else if(param.result == 'idNotFound'){
					count = 1;
					$('#id_signed').text('사용 가능 아이디').css('color', 'green');
				}else{
					count = 0;
					alert('아이디 중복체크 오류 발생');
				}
			},
			error: function(){
				count = 0;
				alert('네트워크 오류 발생');
			}
		}); //통신
	});
		
	$('#register_form #id').keydown(function(){
		count = 0;
		$('#id_signed').text('');
	}); //end of keydown
	
	
	$('#register_form').submit(function(){
		if($('#id').val().trim()==''){
			alert('아이디를 입력하세요');
			$('#id').val('').focus();
			return false;
		}
		if(count==0){
			alert('아이디 중복체크 필수');
			return false;
		}
		if($('#name').val().trim()==''){
			alert('이름을 입력하세요.');
			$('#name').val('').focus();
			return false;
		}
		if($('#passwd').val().trim()==''){
			alert('비밀번호를 입력하세요.');
			$('#passwd').val('').focus();
			return false;
		}
		if($('#salary').val().trim()==''){
			alert('급여를 입력하세요.');
			$('#salary').val('').focus();
			return false;
		}
		if($('#job').val().trim()==''){
			alert('업무를 입력하세요.');
			$('#job').val('').focus();
			return false;
		}
	
	});
});
</script>
</head>
<body>
<div class="page-main">
	<h1>사원등록</h1>
	<form action="registerUser.jsp" method="post" id="register_form">
		<ul>
			<li>
				<label for="id">아이디</label>
				<input type="text" name="id" id="id" size="7" maxlength="12" autocomplete="off">
				<input type="button" id="confirm_id" value="ID중복체크">
				<span id="id_signed"></span>
			</li>
			<li>
				<label for="name">이름</label>
				<input type="text" name="name" id="name" maxlength="10">
			</li>
			<li>
				<label for="passwd">비밀번호</label>
				<input type="password" name="passwd" id="passwd" maxlength="12">
			</li>
			<li>
				<label for="salary">급여</label>
				<input type="number" name="salary" id="salary" min="1" max="99999999">
			</li>
			<li>
				<label for="job">업무</label>
				<input type="text" name="job" id="job" maxlength="12">
			</li>
		</ul>
		<div>
			<input type="submit" value="등록">
			<input type="button" value="홈으로" onclick="location.href='main.jsp'">
		</div>
	</form>
</div>
</body>
</html>