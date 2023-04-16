<%@page import="customer.Customer"%>
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
	%>


	<h1>공지사항</h1>

	<section>
		<div><%=board.getTitle()%></div>
		<div>
			<h5>
				글쓴이 :
				<%=board.getWriter()%><br>등록일 :
				<%=board.getReigisteredDate()%></h5>
		</div>
		<br> <br>
		<div><%=board.getMain()%></div>

		<%
		Customer customer = (Customer)session.getAttribute("log");
		
		if(customer != null){
			int customerId = customer.getId();
			
			if(customerId == 99999){
				 %>
			<form method="POST" action="boardmodify">
				<input type="hidden" name="id" value=<%=id %>>
				<div>
					<input type="submit" value="수정하기">
				</div>
			</form>
			<form method="POST" action="../service">
				<input type="hidden" name="command" value="boardDelete"> <input
					type="hidden" name="id" id="id" value=<%=id %>> <input
					type="hidden" name="categoryId" id="categoryId"
					value=<%=categoryId %>>
				<div>
					<input type="button" value="삭제하기" onclick="boardCheckDelete(form)">
				</div>
			</form>

			<%
			}
			
		}
		
		
		%>




	</section>


	<script src="resources/boardCheck.js"></script>
</body>

</html>