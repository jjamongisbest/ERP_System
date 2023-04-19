<%@page import="productCategory.controller.ProductCategoryDAO"%>
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
	String result = (String) request.getAttribute("result");

	@SuppressWarnings("unchecked")
	List<Product> list = (List<Product>) request.getAttribute("searchProduct");
	int cnt = 0;
	%>

	<div class="product-list">
		<h2 id="name"><%=result%></h2>
		<div class="lists">
				<%
					for (Product target : list) {
					%>
				
				<div class="cards">
						<div class="card"
							onclick="location.href='../service?command=productdetail&productId=<%=target.getId()%>'">
							<img src="<%=target.getImageUrl()%>" width="200" height="200">
						</div>
						<div class="inform">
							<a href='../service?command=productdetail&productId=<%=target.getId()%>' class="product">
							<%=target.getName()%></a>
							<p><%=target.getPrice()%>원
							</p>
							<p>
								수량:<%=target.getStock()%>개
							</p>
						</div>	
				</div>
				<%
					}
					%>		
		</div>
		<%
		if (list.size() < 1) {
		%>
		<img src="../resources/images/emptyCart.jpg">
		<%
		}
		%>
	</div>

</body>

</html>