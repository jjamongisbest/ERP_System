
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
	if (name !== "") {url += "&name=" + name;}
	if (address !== "") {url += "&address=" + address;}
	if (phone !== "") {url += "&phone=" + phone;}
	if (gender!== "") {url += "&gender=" + gender;}
	if (gradeId!== "") {url += "&gender=" + gradeId;}
	
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

	if (check === false) {
		location.href = url;
	}
	else {
		htmlForm.submit();
	}
}