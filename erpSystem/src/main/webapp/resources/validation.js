function sendCommand(command){
	location.href = `../service?command=${command}`;
}

function insertBasket(){
     alert("장바구니에 추가되었습니다.");
  	//////////////////////
  	// 기능 추가 예정///////
  	/////////////////////
}

function send(page){
	if(page === "login"){
		alert("로그인 후 이용가능")		
	}
	location.href = `../${page}`;
}
