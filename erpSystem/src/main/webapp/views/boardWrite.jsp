<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
String title = request.getParameter("title");
String main = request.getParameter("main");
int categoryId = Integer.parseInt(request.getParameter("categoryId"));
%>

<section>

		<h1>글쓰기</h1>

		<form method="POST" action="../service">
			<input type="hidden" name="command" value="board">
			<input type="hidden" name="categoryId" id="categoryId" value=<%=categoryId %>>

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

			<input type="button" onclick="checkValues(form)" value="등록">

		</form>

	</section>

	<script src="resources/boardCheck.js"></script>
</body>
</html>