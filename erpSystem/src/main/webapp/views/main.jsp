<%@page import="java.util.ArrayList"%>
<%@page import="productCategory.controller.ProductCategoryDAO"%>
<%@page import="productCategory.ProductCategory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/main.css">
</head>
<body>

	<%
	ProductCategoryDAO dao = ProductCategoryDAO.getInstance();
	ArrayList<ProductCategory> list = dao.getProductCategoryList();
	%>

	<div class="container">
		<div class="category-list">
			<%
			for (ProductCategory target : list) {
			%>
			<section class="box">
				<div class="list">
					<a href="productlist?code=<%=target.getId()%>"><%=target.getName()%></a>
				</div>
			</section>
			<%
			}
			%>
		</div>
		<div class="banner">
			<img src="../resources/images/salesBanner.jpg" width=100% height=600>
		</div>
		<div class="footer">
			<p>Copyright 2021. DDRRDDDD All pictures cannot be copied without
				permission.</p>
		</div>
	</div>

</body>
</html>