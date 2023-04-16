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
HashMap<Integer,Integer> map = order.getBasket();
ArrayList<Product> list = new ArrayList<>(map.size());
ProductDAO productDao = ProductDAO.getInstance();

System.out.println(map);



for(Integer id : map.keySet())
	list.add(productDao.getProductById(id));

System.out.println("list is " +list);
String total = order.getTotalPrice(list);
%>
<c:import url="header" />
<h3>
	<c:out value="${sessionScope.log.getName() }"/>님의 장바구니
</h3>
<table>
	<tr>
		<td>no.</td>
		<td>상품명</td>
		<td>수량</td>
		<td>가격</td>
		<td>취소</td>
	</tr>
<c:forEach items="<%=list %>" var="product" varStatus="cnt">
	<tr>	
		
		<c:set var="quantity" value=""/>
		<td>${cnt.count}</td>
		<td>${product.name}</td>
		<td>${quantity}</td>
		<td>${MoneyManager.multipleMoney(product.price, quantity}</td>
		<td>
			<button onclick="취소 구혀여여연">취소</button>
		</td>
	</tr>
</c:forEach>
</table>
<form method="POST" action="../service">
	<input type="hidden" name="command" value="order">
	<input type="submit" value="주문하기">
</form>
</body>
</html>