/**
 * 
 */
function checkValues(htmlForm) {
	let url = "announcewrite?";

	const title = document.getElementById("title").value;
	const main = document.getElementById("main").value;
	const categoryId = document.getElementById("categoryId").value;


	let check = true;

	if (title !== "") { url += "&title=" + title; }
	if (main !== "") { url += "&main=" + main; }
	if (categoryId !== "") { url += "&categoryId=" + categoryId; }


	if (title === "") {
		alert('제목을 입력해주세요.');
		check = false;
	}
	else if (main === "") {
		alert('내용을 입력해주세요.');
		check = false;
	}

	if (check === false) {
		location.href = url;
	}
	else {
		htmlForm.submit()
	}
}
function reviewCheckValues(htmlForm) {
	let url = "reviewwrite?";

	const title = document.getElementById("title").value;
	const main = document.getElementById("main").value;
	const categoryId = document.getElementById("categoryId").value;


	let check = true;

	if (title !== "") { url += "&title=" + title; }
	if (main !== "") { url += "&main=" + main; }
	if (categoryId !== "") { url += "&categoryId=" + categoryId; }

	if (title === "") {
		alert('제목을 입력해주세요.');
		check = false;
	}
	else if (main === "") {
		alert('내용을 입력해주세요.');
		check = false;
	}

	if (check === false) {
		location.href = url;
	}
	else {
		htmlForm.submit()
	}
}
function inquiryCheckValues(htmlForm) {
	let url = "inquirywrite?";

	const title = document.getElementById("title").value;
	const main = document.getElementById("main").value;
	const categoryId = document.getElementById("categoryId").value;


	let check = true;

	if (title !== "") { url += "&title=" + title; }
	if (main !== "") { url += "&main=" + main; }
	if (categoryId !== "") { url += "&categoryId=" + categoryId; }

	if (title === "") {
		alert('제목을 입력해주세요.');
		check = false;
	}
	else if (main === "") {
		alert('내용을 입력해주세요.');
		check = false;
	}

	if (check === false) {
		location.href = url;
	}
	else {
		htmlForm.submit()
	}
}