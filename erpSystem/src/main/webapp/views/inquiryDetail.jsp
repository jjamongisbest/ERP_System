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


%>


<h1>1:1 문의</h1>

<section>
<div><%=board.getTitle() %></div>
<div><h5>글쓴이 : <%=board.getWriter() %><br>등록일 : <%=board.getReigisteredDate() %></h5></div>
<br>
<br>
<div><%=board.getMain() %></div>

</section>

</body>
<c:import url="footer" />
</html>