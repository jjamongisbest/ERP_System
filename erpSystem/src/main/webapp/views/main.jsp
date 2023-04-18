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
<c:import url="header"/>
<body>

	<%
	ProductCategoryDAO dao = ProductCategoryDAO.getInstance();
	ArrayList<ProductCategory> list = dao.getProductCategoryList();
	%>

	<div class="container">
		<div class="category-list">
			<c:import url="category"/>
			<img id="category-img" src="../resources/images/salesBanner.jpg">
		</div>
		<div class="main-banner">
			<img id="event-banner" src="../resources/images/event-banner.jpg">
			
			<%-- <c:import url="${requestScope.content }"/> --%>
			
		</div>
	</div>

</body>

</html>