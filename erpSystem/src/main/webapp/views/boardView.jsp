<%@page import="customer.Customer"%>
<%@page import="boardCategory.controller.BoardCategoryDAO"%>
<%@page import="board.Board"%>
<%@page import="board.controller.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/boardView.css">
</head>
<body>


	<%
	int boardId = Integer.valueOf(request.getParameter("id"));

	BoardDAO boardDao = BoardDAO.getInstance();

	Board board = boardDao.getBoardById(boardId);
	int categoryId = board.getCategoryId();

	BoardCategoryDAO boardCategoryDao = BoardCategoryDAO.getInstance();
	String category = boardCategoryDao.getCategoryNameById(board.getCategoryId());
	%>


	<section class="board">
		<h1><%=category%></h1>
		<table>
			<thead>
				<tr>
					<th class="title"><%=board.getTitle()%></th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th class="nav">글쓴이 : <%=board.getWriter()%>|등록일 : <%=board.getRegisteredDate()%>
					</th>
				</tr>
				<tr>
					<th class="main"><%=board.getMain()%></th>
				</tr>

			</tbody>

		</table>

		<%
		Customer customer = (Customer) session.getAttribute("log");

		if (customer != null) {
			int customerId = board.getWriter();

			if (customerId == customer.getId()) {
		%>
		<div class="click">
			<form method="POST" action="../?content=boardmodify">
				<input type="hidden" name="id" value=<%=boardId%>>
				<div>
					<input type="submit" value="수정하기">
				</div>
			</form>
			<form method="POST" action="../service">
				<input type="hidden" name="command" value="boardDelete"> <input
					type="hidden" name="id" id="id" value=<%=boardId%>> <input
					type="hidden" name="categoryId" id="categoryId"
					value=<%=categoryId%>>
				<div>
					<input type="button" value="삭제하기" onclick="boardCheckDelete(form)">
				</div>
			</form>
		</div>
		<%
		}

		}
		%>

	</section>

	<script src="resources/boardCheck.js"></script>
</body>

</html>