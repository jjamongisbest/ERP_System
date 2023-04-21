<%@page import="boardCategory.controller.BoardCategoryDAO"%>
<%@page import="customer.Customer"%>
<%@page import="board.Board"%>
<%@page import="java.util.ArrayList"%>
<%@page import="board.controller.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/board.css">
</head>
<body>

	<c:set var="customer" value="${sessionScope.log}" />
	<section class="board">
		<h1 id="h1">${requestScope.category}</h1>
		<table>
			<thead>
				<tr>
					<th>No.</th>
					<th>Title</th>
					<th>Name</th>
					<th>Date</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${requestScope.boards}" var="board">
					<tr>
						<td>${board.id}</td>
						<td><a href="../?content=boardview&id=${board.id}"
							class="titles">${board.title}</a></td>
						<td>${board.writer}</td>
						<td>${board.registeredDate}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div style="margin-top: 10px;" class="page">
			<c:forEach begin="1" end="${requestScope.lastPage}" var="page">
				<a
					href="../service?command=boardlist&vpage=${page}&categoryId=${requestScope.categoryId}">${page}</a>
			</c:forEach>
		</div>
		<div class="notice-header">
			<c:if test="${not empty sessionScope.log}">
				<c:if test="${requestScope.categoryId == 11}">
					<c:if test="${custome.id == 99999}">
						<a
							href="../?content=boardwrite&categoryId=${requestScope.categoryId}"
							class="write">글쓰기</a>
					</c:if>
				</c:if>
				<c:if test="${requestScope.categoryId != 11}">
					<a
						href="../?content=boardwrite&categoryId=${requestScope.categoryId}"
						class="write">글쓰기</a>
				</c:if>
			</c:if>
		</div>
	</section>

</body>
</html>