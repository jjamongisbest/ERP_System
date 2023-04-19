<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="product.contoroller.ProductDAO"%>
<%@page import="product.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../resources/productList.css">
<title>productList</title>
</head>

<body>

	<%
	@SuppressWarnings("unchecked")
	List<Product> list = (List<Product>) request.getAttribute("searchProduct");
	%>

	<div class="product-list">
		<%
		for (Product target : list) {
		%>
		<div class="card" onclick="location.href='../service?command=productdetail&productId=<%=target.getId()%>'">
			<img src="<%=target.getImageUrl() %>" width="200" height="200">
			<h3><%=target.getName()%></h3>
			<p><%=target.getPrice()%>원</p>
			<p>수량:<%=target.getStock()%>개</p>
		</div>
		<%
		}
		%>
		<%if(list.size() < 1) {%>
			<img src="../resources/images/TUNG.jpg">
		<%} %>
	</div>

</body>

</html>