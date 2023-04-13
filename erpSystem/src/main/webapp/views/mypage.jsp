<%@page import="customer.controller.CustomerDAO"%>
<%@page import="customer.Customer"%>
<%@page import="sales_order.SalesOrder"%>
<%@page import="java.util.ArrayList"%>
<%@page import="sales_order.controller.SalesOrderDAO"%>
<%@page import="orderProduct.OrderProduct"%>
<%@page import="board.Board"%>
<%@page import="orderProduct.controller.OrderProductDAO"%>
<%@page import="board.controller.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<c:import url="header"/>
<body>

	<%
	int userId = Integer.parseInt(request.getParameter("custid"));
	
	CustomerDAO custdao = CustomerDAO.getinstnace();
	BoardDAO boarddao = BoardDAO.getInstance();
	OrderProductDAO orderdao = OrderProductDAO.getInstance();
	SalesOrderDAO salesdao = SalesOrderDAO.getInstance();
	
	Customer customer = custdao.getCustomerById(userId);
	Board board = boarddao.getBoardById(userId);
	ArrayList<SalesOrder> list = salesdao.getSalesOrderByCustomerID(userId);
	%>



</body>
<c:import url="footer"/>
</html>