
function checkValues(htmlForm) {
	let url = "../?content=regist";

	const id = document.getElementById("id").value;
	const password = document.getElementById("password").value;
	const name = document.getElementById("name").value;
	const address = document.getElementById("address").value;
	const phone = document.getElementById("phone").value;
	const gender = document.getElementById("gender").value;
	const gradeId = document.getElementById("gradeId").value;

	let check = true;
	

	if (id !== "") { url += "&id=" + id; }
	if (password !== "") { url += "&password=" + password; }
	if (name !== "") { url += "&name=" + name; }
	if (address !== "") { url += "&address=" + address; }
	if (phone !== "") { url += "&phone=" + phone; }
	if (gender !== "") { url += "&gender=" + gender; }
	if (gradeId !== "") { url += "&gradeId=" + gradeId; }

	if (id === "") {
		alert('아이디를 입력해주세요.');
		check = false;
	}
	else if (password === "") {
		alert('비밀번호를 입력해주세요.');
		check = false;
	}
	else if (name === "") {
		alert('이름을 입력해주세요.');
		check = false;
	}
	else if (address === "") {
		alert('주소를 입력해주세요.');
		check = false;
	}
	else if (phone === "") {
		alert('번호를 입력해주세요.');
		check = false;
	}
	else if (gender === "") {
		alert('성별을 입력해주세요.');
		check = false;
	}

	if (check === true) {
		htmlForm.submit();	
	}
}

function findAddr() {
		new daum.Postcode({
        	oncomplete: function(data) {
            	// 사용자 주소를 받아올 변수를 정의한다.
                var addr = '';
                
                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우(R)
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }
                
                // 부모창의 주소칸에 받아온 주소를 넣는다.
                

                $("#address").val(addr);
                
        	}
     	}).open();
	}
	
	