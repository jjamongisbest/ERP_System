<%@page import="product.contoroller.ProductDAO"%>
<%@page import="product.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page import="salesOrder.SalesOrder"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../resources/order.css">
<title>Insert title here</title>
</head>
<body>
	<%
	SalesOrder order = (SalesOrder) session.getAttribute("cart");
	HashMap<Integer, Integer> map = order.getCart();
	ArrayList<Product> list = new ArrayList<>(map.size());
	ProductDAO productDao = ProductDAO.getInstance();

	for (Integer id : map.keySet())
		list.add(productDao.getProductById(id));

	int total = order.getTotalPrice(list);
	%>
	<section class="order">
		<h3 class="titles">
			<c:out value="${sessionScope.log.getName() }" />
			님의 장바구니
		</h3>


		<%
			if (!list.isEmpty()) {
			%>
		<table class="tbl">
			<thead class="orderhead">
				<tr>
					<td>no.</td>
					<td>상품명</td>
					<td>수량</td>
					<td>가격</td>
					<td>취소</td>
				</tr>
			</thead>
			<tbody>
				<%
				for (int i = 0; i < list.size(); i++) {
					Product product = list.get(i);
					int quantity = map.get(product.getId());
				%>

				<tr>
					<td><%=i + 1%></td>
					<td><%=product.getName()%></td>
					<td><%=quantity%></td>
					<td><%=product.getPrice() * quantity%></td>
					<td>
						<button onclick="dropItem('<%=product.getId()%>')" class="drop">취소</button>
					</td>
				</tr>
				<%
				}
				%>
			</tbody>
		</table>
		<%
		} else {
		%>
		<p class="tung">장바구니가 비어있습니다</p>
		<%
		}
		%>

		<p class="total">
			총 주문금액 :
			<c:out value="<%=total%>" />
		<p>
		<form method="POST" action="../service" class="ord">
			<input type="hidden" name="command" value="order">
			<div class="but">
				<input type="submit" value="주문하기" class="button">
			</div>
		</form>
	</section>
	<script src="../resources/validation.js"></script>
</body>
</html>