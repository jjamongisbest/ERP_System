function sendCommand(command){
	location.href = `../service?command=${command}`;
}

function insertBasket(){
     alert("장바구니에 추가되었습니다.");
  	location.href = '../service?command=basket';
}

function send(page){
	if(page === "login"){
		alert("로그인 후 이용가능");	
	}
	location.href = `/${page}`;
}

function dropItem(productId){
	alert("삭제되었습니다.");
	location.href=`../service?command=dropitem&target=${productId}`;
}
