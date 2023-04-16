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
		<input type="hidden" name="command" value="orderConfirmation"> 
		<input type="text" name="keyword" required placeholder="회원아이디를 입력하세요">
		<input type="submit" value="검색">
	</form>
	<c:if test="${not empty searchOrder}">
		<table>
			<tr>
				<td>주문번호</td>
				<td>구매아이디</td>
				<td>결제금액</td>
				<td>결제상태</td>
			</tr>
			<c:forEach var="items" items="${searchOrder}">
				<tr>
					<td><a
						href="../service?command=productDetail&productId=${items.id}">
							<c:out value="${items.name}" />
					</a></td>
					<td><c:out value="${items.price }" /></td>
					<td><c:out value="${items.stock }" /></td>
				</tr>
			</c:forEach>
		</table>
	</c:if>

</body>
</html>