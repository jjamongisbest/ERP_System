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
</head>
<c:import url="header" />
<body>
	<%
	BoardDAO boardDao = BoardDAO.getInstance();
	ArrayList<Board> list = boardDao.getBoard(11);
	%>

	<section>
	<h1>공지사항</h1>
		<table>

			<tr>
				<td>No.</td>

				<td>Title</td>

				<td>Name</td>

				<td>Date</td>

			</tr>
			<%
			for (Board board : list) {
			%>
			<tr>
				<td><%=board.getId() %></td>
				<td><a href="announcedetail?id=<%=board.getId() %>"><%=board.getTitle() %></a></td>
				<td><%=board.getWriter() %></td>
				<td><%=board.getReigisteredDate() %></td>

			</tr>
			<%
			}
			%>


		</table>

		<%
		if(session.getAttribute("log") != null){
			Customer customer = (Customer)session.getAttribute("log");
			
			if(customer.getId()==99999){
				%>
		<a href="announcewrite">글쓰기</a>
		<%
			}
			%>

		<% 
		}
		%>



	</section>

</body>
<c:import url="footer" />
</html>