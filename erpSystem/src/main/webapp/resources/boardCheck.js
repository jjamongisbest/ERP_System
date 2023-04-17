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

function boardCheckModify(htmlForm) {
	let url = "boardmodify?";

	const title = document.getElementById("title").value;
	const main = document.getElementById("main").value;
	const categoryId = document.getElementById("categoryId").value;
	const id = document.getElementById("id").value;


	let check = true;

	if (title !== "") { url += "&title=" + title; }
	if (main !== "") { url += "&main=" + main; }
	if (categoryId !== "") {}
	if (id !== "") {}

	if (title === "") {
		alert('제목 입력해주세요.');
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
function boardCheckDelete(htmlForm){
	
	const id = document.getElementById("id").value;
	const categoryId = document.getElementById("categoryId").value;
	
	var UP;
	UP = confirm("정말 삭제하시겠습니까?");
	
	if(UP){
		alert("삭제되었습니다.");
		htmlForm.submit()
	}
	
	
}

