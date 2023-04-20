<%@page import="org.apache.jasper.tagplugins.jstl.core.Param"%>
<%@page import="java.util.ArrayList"%>
<%@page import="productCategory.controller.ProductCategoryDAO"%>
<%@page import="productCategory.ProductCategory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
			<c:import url="category" />
			<img id="category-img" src="../resources/images/salesBanner.jpg">
		</div>
		<div class="main-banner">

			<c:choose>
				<c:when test="${not empty param.content }">
					<c:import url="${param.content }" />
				</c:when>
				<c:when test="${not empty requestScope.content }">
					<c:import url="${requestScope.content }" />
				</c:when>
				<c:otherwise>
					<img id="event-banner" src="../resources/images/event-banner.jpg">
				</c:otherwise>
			</c:choose>
		</div>
	</div>
	<script src="../resources/validation.js"></script>
</body>
<c:import url="footer" />
</html>