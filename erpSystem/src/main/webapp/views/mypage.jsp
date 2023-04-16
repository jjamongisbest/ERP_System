<%@page import="boardCategory.controller.BoardCategoryDAO"%>
<%@page import="customer.controller.CustomerDAO"%>
<%@page import="customer.Customer"%>
<%@page import="salesOrder.SalesOrder"%>
<%@page import="java.util.ArrayList"%>
<%@page import="salesOrder.controller.SalesOrderDAO"%>
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
<title>Mypage</title>
</head>
<link rel="stylesheet" href="../resources/mypage.css">
<c:import url="header" />
<body>

	<%
	int userId = Integer.parseInt(request.getParameter("custid"));

	CustomerDAO custdao = CustomerDAO.getinstnace();
	BoardDAO boarddao = BoardDAO.getInstance();
	OrderProductDAO orderdao = OrderProductDAO.getInstance();
	SalesOrderDAO salesdao = SalesOrderDAO.getInstance();
	BoardCategoryDAO catedao = BoardCategoryDAO.getInstance();

	Customer customer = custdao.getCustomerById(userId);
	Board board = boarddao.getBoardById(userId);
	ArrayList<SalesOrder> list = salesdao.getSalesOrderByCustomerID(userId);
	ArrayList<Board> blist = boarddao.getBoardByCustomerId(userId);
	%>

	<div class="container">

	<div class="cust_info">
		<section>
			<h2><%=customer.getName()%>(<%=customer.getId()%>)님
			</h2>
			<p>
				전화번호 :
				<%=customer.getPhone()%></p>
			<p>
				이메일 :
				<%=customer.getAddress()%></p>
		</section>
	</div>


	<div class="my-order">
		<div class="order-thead">
			<div style="width: 25%">주문코드</div>
			<div class="product-name" style="width: 25%">주문일자</div>
			<div style="width: 25%">결제금액</div>
			<div style="width: 25%">주문상세</div>
		</div>
		<div class="order-tbody">
			<%
			if (list != null) {
			%>
			<%
			for (SalesOrder target : list) {
			%>
			<div><%=target.getId()%></div>
			<div><%=target.getDate()%></div>
			<div><%=target.getTotal()%></div>
			<div>
				<%
				if (target.getStatus().equals("Y")) {
				%>
				배송완료
				<%
				} else {
				%>
				배송중
				<%
				}
				%>
			</div>
			<%
			}
			%>
			<%
			} else {
			%>
			<div>주문 내역이 없습니다.</div>
			<%
			}
			%>
		</div>
	</div>

	<div class="my-board">
		<div class="board-thead">
			<div style="width: 25%">등록일자</div>
			<div style="width: 60%">제목</div>
			<div style="width: 15%">게시판</div>
		</div>
		<div class="board-tbody">
			<% if(board != null) {%>
			<% for (Board target : blist) { %>
			<div><%=target.getReigisteredDate() %></div>
			<div><%=target.getTitle() %></div>
			<div><%=catedao.getCategoryNameById(target.getCategoryId()) %></div>
			<%} %>
			<%} else { %>
			<div>작성 내역이 없습니다.</div>
			<%} %>
		</div>
	</div>
	
	<div class="button">
	<input type="button" value="회원탈퇴" onclick="location.href='dropcustomer'">
	</div>
	
	</div>

</body>
<c:import url="footer" />
</html>