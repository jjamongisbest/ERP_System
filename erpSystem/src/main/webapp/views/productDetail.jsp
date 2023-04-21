<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../resources/productDetail.css">
</head>

<body>
	<c:set var="product" value="${requestScope.targetProduct}"
		scope="session" />
	<c:set var="category" value="${requestScope.productCategory}"
		scope="session" />
	<c:set var="max" value="${requestScope.targetProduct.getStock()}" />

	<div class="product-detail-container">
		<img src="${requestScope.targetProduct.getImageUrl()}"
			class="product-img">

		<div class="detail-info">
<<<<<<< HEAD
			<span class="product-name"> <c:out
					value="상품 이름 : ${requestScope.targetProduct.getName() }" />
			</span> <span class="product-price"> <c:out
					value="상품 가격 : ${requestScope.targetProduct.getPrice() }" />
			</span>


			<!-- !!!아래는 지은 코드 수정!!! 이전 버전 깃 확인하세요 -->

			<form id="cartForm">
				<input type="hidden" name="product" value="${product}"> <input
					type="hidden" name="category" value="${category}"> <span>
					<c:out value="제조회사 : ${requestScope.targetProduct.getPipeLine()}" />
				</span> <span> <c:out
						value="분류 : ${requestScope.productCategory.getName()}" />
				</span> <input type="number" name="count" value="1" min="0" max="${max}"
					required>
				<c:choose>
					<c:when test="${empty sessionScope.log}">
						<input type="button" value="장바구니 추가" onclick="send('login')">
						<input type="button" value="바로구매" onclick="send('login')">
					</c:when>
					<c:otherwise>
						<input type="button" value="장바구니 추가" onclick="addToCart()">
						<input type="button" value="바로구매" onclick="buyNow()">
					</c:otherwise>
				</c:choose>
			</form>

=======
			<span class="product-name"> 
				<c:out value="상품 이름 : ${requestScope.targetProduct.getName() }" />
			</span> 
			<span class="product-price">
				<c:out value="상품 가격 : ${requestScope.targetProduct.getPrice() }" />
			</span>
			<span>
				<c:out value="제조회사 : ${requestScope.targetProduct.getPipeLine() }" />
			</span>
			<span>
				<c:out value="분류 : ${requestScope.productCategory.getName() }" />
			</span>
			<form method="POST" action="<c:url value='../service'/>">
				<input type="hidden" name="command" value="basket"> <input
					type="hidden" name="product" value="${product }"> <input
					type="hidden" name="category" value="${category }"> <input
					type="number" name="count" value="1" min="0" max="${max}" required>
				<c:choose>
					<c:when test="${empty sessionScope.log }">
						<input type="button" value="장바구니 추가" onclick="send('login')">
						<input type="button" value="바로구매" onclick="send('login')">
					</c:when>
					<c:otherwise>
						<input type="submit" name="choose" value="장바구니 추가"
							onclick="insertCart()">
						<input type="submit" name="choose" value="바로구매">
					</c:otherwise>
				</c:choose>
			</form>
>>>>>>> refs/remotes/origin/main
		</div>
	</div>
	<script src="../resources/validation.js"></script>
</body>

</html>