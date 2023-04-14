<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<c:import url="header" />
<body>
	<img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRwCgJHYjahGUbGoTxda45yy-VwyECKbM_E2w&usqp=CAU">
	<br>
	<c:out value="${requestScope.targetProduct.getName() }" /><br>
	<c:out value="${requestScope.targetProduct.getPrice() }" /><br>
	<c:out value="${requestScope.targetProduct.getPipeLine() }" /><br>
	<c:out value="${requestScope.productCategory.getName() }" />
	
	<c:set var="prodcuct" value="${requestScope.targetProduct.getStock()}" />
	<c:set var="max" value="${requestScope.targetProduct.getStock()}" />
	<form method="POST" action="../service">
		<input type="hidden" name="command" value="basket">
		<input type="number" name="count" value="0" min="0" max="${max}" required>
		<c:choose>
			<c:when test="${empty sessionScope.log }">
				<input type="button" value="장바구니 추가" onclick="send('login')">
				<input type="submit" value="바로구매" onclick="send('login')">
			</c:when>
			<c:otherwise>
				<c:out value="${sessionScope.log }"/>
				<input type="button" value="장바구니 추가" onclick="insertBasket()">
				<input type="submit" value="바로구매" onclick="insertBasket('')">
			</c:otherwise>
		</c:choose>
	</form>
	<script src="../resources/validation.js"></script>
</body>
<c:import url="footer" />
</html>