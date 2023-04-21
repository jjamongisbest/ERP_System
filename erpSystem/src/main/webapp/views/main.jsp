<%@page import="boardCategory.BoardCategory"%>
<%@page import="boardCategory.controller.BoardCategoryDAO"%>
<%@page import="customer.Customer"%>
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
	// 카테고리
	ProductCategoryDAO dao = ProductCategoryDAO.getInstance();
	ArrayList<ProductCategory> list = dao.getProductCategoryList();
	
	Customer customer = (Customer) session.getAttribute("log");
	
	// 헤더
	BoardCategoryDAO boardcateDao = BoardCategoryDAO.getInstance();
	ArrayList<BoardCategory> alist = boardcateDao.getBoardCategoryAll();
	
	request.setAttribute("catelist", list);

	pageContext.setAttribute("list", alist);
	%>
	<div class="container">
		<div class="category-list">
			<c:import url="category" />
			<img id="category-img" src="../resources/images/salesBanner.jpg">
		</div>
		<div class="main-banner">

			<c:choose>
				<c:when test="${not empty param.content }">
					<%System.out.println("파라미터 임"); %>
					<c:import url="${param.content }" />
				</c:when>
				<c:when test="${not empty requestScope.content }">
					<%System.out.println("리쿠ㅐ스트임"); %>
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