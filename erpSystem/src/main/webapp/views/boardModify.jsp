<%@page import="boardCategory.controller.BoardCategoryDAO"%>
<%@page import="boardCategory.BoardCategory"%>
<%@page import="board.Board"%>
<%@page import="board.controller.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/boardWrite.css">
</head>
<body>

	<%
	int id = Integer.valueOf(request.getParameter("id"));

	BoardDAO boardDao = BoardDAO.getInstance();

	Board board = boardDao.getBoardById(id);

	int categoryId = board.getCategoryId();

	String title = board.getTitle();
	String main = board.getMain();
	main = main.replace("<br>", "\r\n");

	BoardCategoryDAO boardCategoryDao = BoardCategoryDAO.getInstance();

	String name = boardCategoryDao.getCategoryNameById(categoryId);
	%>
	
	<section>

		<h1><%=name%>
			수정
		</h1>

		<form method="POST" action="../service">
			<div class="write">
				<input type="hidden" name="command" value="boardModify"> <input
					type="hidden" name="categoryId" id="categoryId"
					value=<%=categoryId%>> <input type="hidden" name="id"
					id="id" value=<%=id%>>

				<table>
					<tr>
						<th>Title</th>
						<td><input type="text" id="title" name="title"
							value="<%=title != null ? title : ""%>"
							<%=title == null ? "autofocus" : ""%>></td>
					</tr>
					<tr>
						<th>Content</th>
						<td><textarea id="main" name="main"><%=main%></textarea></td>
					</tr>

				</table>
			</div>
			<div class="butt">
				<input type="button" onclick="boardCheckModify(form)" value="수정"
					class="button">
			</div>
		</form>

	</section>

	<script src="resources/boardCheck.js"></script>

</body>
</html>