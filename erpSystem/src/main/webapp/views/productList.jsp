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
<c:import url="header" />
<body>

	<%
	ProductDAO dao = ProductDAO.getInstance();
	ArrayList<Product> list = dao.getProductList();
	%>

	<div class="container">
		<%for (Product target : list) { %>
		<div class="card">
			<img src="../resources/images/noimage.jpg" width="200" height="200">
			<h3><a href="product"><%= target.getName() %></a></h3>
			<p><%= target.getPrice() %>원</p>
			<p> 수량: <%= target.getStock() %> 개</p>		
		</div>
		<%} %>
	</div>

</body>
<c:import url="footer" />
</html>