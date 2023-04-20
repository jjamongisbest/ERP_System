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

	<%
	int categoryId = Integer.parseInt(request.getParameter("cate"));
	
	String vpage = request.getParameter("vpage");
	if (vpage == null)
		vpage = "1";

	int selPage = Integer.parseInt(vpage);

	BoardDAO boardDao = BoardDAO.getInstance();
	int total = boardDao.getTotalCountByCategory(categoryId);

	ArrayList<Board> list = boardDao.getPostsPerPage(categoryId, selPage);

	pageContext.setAttribute("list", list);
	%>
	
	<c:set var="categoryId" value="${param.cate}" />
	<c:set var="vpage" value="${param.vpage}" />
	<c:if test="${empty vpage}">
		<c:set var="vpage" value="1" />
	</c:if>
	<c:set var="boardDao"
		value="<%=board.controller.BoardDAO.getInstance()%>" />
		
	<c:set var="total"
		value="${boardDao.getTotalCountByCategory(categoryId)}" />
	<c:set var="lastPage" value="${Math.ceil(total/10)}" />
	
	<c:set var="boardCategoryDao"
		value="<%=boardCategory.controller.BoardCategoryDAO.getInstance()%>" />
	<c:set var="category"
		value="${boardCategoryDao.getCategoryNameById(categoryId)}" />
	<c:set var="customer" value="${sessionScope.log}" />

	<section class="board">

		<h1 id="h1">${category}</h1>
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
				<c:forEach items="${pageScope.list}" var="target">
					<tr>
						<td>${target.id}</td>
						<td><a href="../?content=boardview&id=${target.id}"
							class="titles">${target.getTitle()}</a></td>
						<td>${target.getWriter()}</td>
						<td>${target.getRegisteredDate()}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div style="margin-top: 10px;" class="page">
			<c:forEach begin="1" end="${lastPage}" var="page">
				<a href="../?content=board&vpage=${page}&cate=${categoryId}">${page}</a>
			</c:forEach>
		</div>
		<div class="notice-header">
			<c:if test="${not empty sessionScope.log}">
				<c:if test="${categoryId == 11}">
					<c:if test="${customer.getId() == 99999}">
						<a href="../?content=boardwrite&categoryId=${categoryId}"
							class="write">글쓰기</a>
					</c:if>
				</c:if>
				<c:if test="${categoryId != 11}">
					<a href="../?content=boardwrite&categoryId=${categoryId}"
						class="write">글쓰기</a>
				</c:if>
			</c:if>
		</div>
	</section>
</body>
</html>