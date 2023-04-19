<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>
	<img src="${requestScope.targetProduct.getImageUrl()}">
	<br>
	<c:out value="상품 이름 : ${requestScope.targetProduct.getName() }" /><br>
	<c:out value="상품 가격 : ${requestScope.targetProduct.getPrice() }" /><br>
	<c:out value="공급처 : ${requestScope.targetProduct.getPipeLine() }" /><br>
	<c:out value="분류 : ${requestScope.productCategory.getName() }" />
		
	<c:set var="max" value="${requestScope.targetProduct.getStock()}" />
	<form method="POST" action="<c:url value='../service'/>">
		<input type="hidden" name="command" value="basket">
		<c:set var="product" value="${requestScope.targetProduct}" scope="session"/>
		<c:set var="category" value="${requestScope.productCategory}" scope="session"/>
		<input type="number" name="count" value="1" min="0" max="${max}" required>
		<c:choose>
			<c:when test="${empty sessionScope.log }">
				<input type="button" value="장바구니 추가" onclick="send('login')">
				<input type="button" value="바로구매" onclick="send('login')">
			</c:when>
			<c:otherwise>
				<input type="submit" name="choose" value="장바구니 추가" onclick="insertCart()">
				<input type="submit" name="choose" value="바로구매">
			</c:otherwise>
		</c:choose>
	</form>
	<script src="../resources/validation.js"></script>
</body>

</html>