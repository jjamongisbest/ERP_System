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
<c:import url="header" />
<body>

	<%
	int categoryId = Integer.parseInt(request.getParameter("cate"));

	String vpage = request.getParameter("vpage");
	if (vpage == null) {
		vpage = "1";
	}

	int selPage = Integer.parseInt(vpage);

	BoardDAO boardDao = BoardDAO.getInstance();
	int total = boardDao.getTotalCountByCategory(categoryId);

	int lastPage = (int) Math.ceil((double) total / 10);

	ArrayList<Board> list = boardDao.getPostsPerPage(categoryId, selPage);

	BoardCategoryDAO boardCategoryDao = BoardCategoryDAO.getInstance();
	String category = boardCategoryDao.getCategoryNameById(categoryId);
	%>


	<section class="board">
		
			<h1><%=category%></h1>
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
					<%
					for (Board board : list) {
					%>
					<tr>
						<td><%=board.getId()%></td>
						<td><a href="boardview?id=<%=board.getId()%>" class="titles"><%=board.getTitle()%></a></td>
						<td><%=board.getWriter()%></td>
						<td><%=board.getReigisteredDate()%></td>
					</tr>
					<%
					}
					%>
				</tbody>
			</table>
			<div style="margin-top: 10px;" class="page">

				<%
				for (int i = 1; i <= lastPage; i++) {
				%>
				<a href="board?vpage=<%=i%>&cate=<%=categoryId%>"><%=i%></a>
				<%
				}
				%>

			</div>
			<div class="notice-header">

				<%
				if (session.getAttribute("log") != null) {
					Customer customer = (Customer) session.getAttribute("log");
					if (categoryId == 11) {

						if (customer.getId() == 99999) {
				%>
				<a href="boardwrite?categoryId=<%=categoryId%>" class="write">글쓰기</a>
				<%
				}
				} else {
				%>
				<a href="boardwrite?categoryId=<%=categoryId%>" class="write">글쓰기</a>
				<%
				}
				}
				%>
			</div>
		
	</section>


</body>


</html>