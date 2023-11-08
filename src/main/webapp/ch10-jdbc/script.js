window.onload=function(){
	let myForm = document.getElementById('myForm');
	//이벤트 연결
	myForm.onsubmit=function(){
		let items = document.querySelectorAll('input[type="text"],input[type="password"],textarea'); //선택자는 쉼표로 나열할 수 있음
		
		//루프 돌면서 처리
		for(let i=0; i<items.length;i++){
			if(items[i].value.trim() == ''){
				let label = document.querySelector('label[for="' + items[i].id + '"]');
				alert(label.textContent + ' 항목은 필수입력'); //아이디 항목 비밀번호 항목 이렇게 띄워서 표시하려고
				items[i].value = '';
				items[i].focus();
				return false;
			}
		}
	};
};