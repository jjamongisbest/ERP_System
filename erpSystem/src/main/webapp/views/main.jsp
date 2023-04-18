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
<c:import url="header" />
<body>

	<%
	ProductCategoryDAO dao = ProductCategoryDAO.getInstance();
	ArrayList<ProductCategory> list = dao.getProductCategoryList();
	%>

	<div class="container">
		<div class="category-list">
			<c:import url="category"/>
		</div>
		<div class="main-banner">
			<img id="img" src="../resources/images/salesBanner.jpg">
			<%-- <c:import url="${requestScope.content }"/> --%>
		</div>
	</div>

</body>
<c:import url="footer"/>
</html>