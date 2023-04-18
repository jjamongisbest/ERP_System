<%@page import="java.util.ArrayList"%>
<%@page import="productCategory.controller.ProductCategoryDAO"%>
<%@page import="productCategory.ProductCategory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<title>Insert title here</title>
<body>
	<%
	ProductCategoryDAO dao = ProductCategoryDAO.getInstance();
	ArrayList<ProductCategory> list = dao.getProductCategoryList();
	%>
	<div class="category-list">
			<%
			for (ProductCategory target : list) {
			%>
			<div class="list">
				<a href="../service?command=product&code=<%=target.getId()%>"><%=target.getName()%></a>
			</div>
		<%
			}
			%>
	</div>
</body>
</html>