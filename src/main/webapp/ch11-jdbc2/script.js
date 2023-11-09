window.onload=function(){
	let myForm = document.getElementById('myForm');
	//이벤트 연결
	myForm.onsubmit=function(){
		let items = documen.querySelectorAll('input[type="text"],input[type="number"],textarea');
		for(let i=0; i<items.length; i++){
			if(items[i].value.trim()==''){
				let label = document.querySelector('label[for="'+ items[i].id +'"]');
				alert(label.textContent + '항목은 필수입력');
				items[i].value = '';
				items[i].focus();
				return false;
			}
		}
	};
};