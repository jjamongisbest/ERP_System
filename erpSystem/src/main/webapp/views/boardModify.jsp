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
</head>
<c:import url="header" />
<body>

<%

int id = Integer.valueOf(request.getParameter("id"));


BoardDAO boardDao = BoardDAO.getInstance();

Board board = boardDao.getBoardById(id);

int categoryId = board.getCategoryId();

String title = board.getTitle();
String main = board.getMain();

BoardCategoryDAO boardCategoryDao = BoardCategoryDAO.getInstance();

String name = boardCategoryDao.getCategoryNameById(categoryId);

%>
	<section>

		<h1><%=name %> 수정</h1>

		<form method="POST" action="../service">
			<input type="hidden" name="command" value="boardModify">
			<input type="hidden" name="categoryId" id="categoryId" value=<%=categoryId %>>
			<input type="hidden" name="id" id="id" value=<%=id %>>

			<table>
				<tr>
					<th>Title</th>
					<td><input type="text" id="title" name="title"
						value="<%=title != null ? title : ""%>"
						<%=title == null ? "autofocus" : ""%>></td>
				</tr>
				<tr>
					<th>Content</th>
					<td><input id="main" name="main"
						value="<%=main != null ? main : ""%>"
						<%=main == null ? "autofocus" : ""%>></td>
				</tr>


			</table>

			<input type="button" onclick="boardCheckModify(form)" value="수정하기">

		</form>

	</section>

	<script src="resources/boardCheck.js"></script>
</body>
<c:import url="footer" />
</html>