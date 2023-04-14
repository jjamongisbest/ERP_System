<%@page import="product.Product"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form method="POST" action="../service">
		<input type="hidden" name="command" value="product"> <input
			type="text" name="keyword" required placeholder="상품을 검색해주세요">
		<input type="submit" value="검색">
	</form>
	<c:if test="${not empty searchProduct}">
		<table>
			<tr>
				<td>상품명</td>
				<td>가격</td>
				<td>수량</td>
			</tr>
			<c:forEach var="items" items="${searchProduct}">
				<tr>
					<td><c:out value="${items.name }" /></td>
					<td><c:out value="${items.price }" /></td>
					<td><c:out value="${items.stock }" /></td>
				</tr>
			</c:forEach>
		</table>
	</c:if>
</body>
</html>