function sendCommand(command) {
	location.href = `../service?command=${command}`;
}

function insertCart() {
	alert("장바구니에 추가되었습니다.");
}

function send(page) {
	if (page === "login")
		alert("로그인 후 이용가능");

	location.href = `../?content=${page}`;
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


// 이하 장바구니 기능 

function addToCart() {
	const myForm = document.getElementById("cartForm");
	const product = myForm.product.value;
	const category = myForm.category.value;
	const count = myForm.count.value;

	const cookieValue = product + "|" + category + "|" + count;
	document.cookie = "cart=" + cookieValue;

	alert("장바구니에 추가되었습니다.");
}

// SalesOrderDTO 클래스 정의
export class SalesOrderDTO {
	constructor(product, category, count) {
		this.product = product;
		this.category = category;
		this.count = count;
	}
}

// SalesOrderDAO 클래스 정의
class SalesOrderDAO {
	static getInstance() {
		if (!SalesOrderDAO.instance) {
			SalesOrderDAO.instance = new SalesOrderDAO();
		}
		return SalesOrderDAO.instance;
	}

	createSalesOrder(salesOrderDTO, callback) {
		callback(true);
		 callback(false);
	}
}

export default SalesOrderDAO;


function buyNow() {
	const myForm = document.getElementById("cartForm");
	const product = myForm.product.value;
	const category = myForm.category.value;
	const count = myForm.count.value;

	const salesOrderDTO = new SalesOrderDTO(product, category, count);

	salesOrderDAO.createSalesOrder(salesOrderDTO, function(result) {
		if (result) {
			console.log("주문이 완료되었습니다.");
		} else {
			console.log("주문 처리에 실패했습니다.");

		}
	});
}

