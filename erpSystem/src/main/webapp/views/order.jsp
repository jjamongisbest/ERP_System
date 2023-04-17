<%@page import="util.MoneyManager"%>
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
<title>Insert title here</title>
</head>
<body>
	<%
	SalesOrder order = (SalesOrder) application.getAttribute("basket");
	HashMap<Integer, Integer> map = order.getBasket();
	ArrayList<Product> list = new ArrayList<>(map.size());
	ProductDAO productDao = ProductDAO.getInstance();

	for (Integer id : map.keySet())
		list.add(productDao.getProductById(id));

	int total = order.getTotalPrice(list);
	%>
	<c:import url="header" />
	<h3>
		<c:out value="${sessionScope.log.getName() }" />
		님의 장바구니
	</h3>
	<table>

		<%
		if (!list.isEmpty()) {
		%>
		<tr>
			<td>no.</td>
			<td>상품명</td>
			<td>수량</td>
			<td>가격</td>
			<td>취소</td>
		</tr>

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
				<button onclick="dropItem('<%=product.getId()%>')">취소</button>
			</td>
		</tr>
		</table>
		<%
			}
		} else {
		%>
		<p>장바구니가 비어있습니다</p>
		<%
		}
		%>
	<h3>
		총 결제 금액
		<c:out value="<%=total%>" />
	</h3>
	<form method="POST" action="../service">
		<input type="hidden" name="command" value="order"> <input
			type="submit" value="주문하기">
	</form>
</body>
</html>