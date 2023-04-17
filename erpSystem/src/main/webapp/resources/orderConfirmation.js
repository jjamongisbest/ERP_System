/**
 * 
 */
function checkValues(orderId) {
	
	let url = `../service?command=orderConfirmation&salesOrderId=${orderId}`;
	
	


	var UP;
	UP = confirm("배송 처리 하시겠습니까?");


	if (UP) {
		location.href = url;
	}
	
}