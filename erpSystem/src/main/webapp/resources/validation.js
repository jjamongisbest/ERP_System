function sendCommand(command) {
	location.href = `../service?command=${command}`
}

function insertCart() {
	alert("장바구니에 추가되었습니다.");
}

function send(page) {
	if (page === "login"){
		alert("로그인 후 이용가능");
	location.href = `../?content=${page}`;
	}
	else{
	location.href = `../service?command=${page}`;		
	}
}

function dropItem(productId) {
	alert("삭제되었습니다.");
	location.href = `../service?command=dropitem&target=${productId}`;
}

document.querySelector('form').addEventListener('submit', function(e) {
	var keyword = document.querySelector('form[name=search] input[name="keyword"]').value;
	if (keyword.trim() === '') {
		e.preventDefault();
		alert('검색어를 입력하세요');
	}
});



