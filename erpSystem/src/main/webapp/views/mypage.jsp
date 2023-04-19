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
<body>

	<%
	Customer customer = (Customer) session.getAttribute("log");

	int userId = customer.getId();

	CustomerDAO custdao = CustomerDAO.getInstance();
	BoardDAO boarddao = BoardDAO.getInstance();
	OrderProductDAO orderdao = OrderProductDAO.getInstance();
	SalesOrderDAO salesdao = SalesOrderDAO.getInstance();
	BoardCategoryDAO catedao = BoardCategoryDAO.getInstance();

	ArrayList<SalesOrder> list = salesdao.getSalesOrderByCustomerID(userId);
	ArrayList<Board> blist = boarddao.getBoardByCustomerId(userId);
	%>

	<div class="container1">

		<h2 class="pagename">MYPAGE</h2>

		<div class="cust_info">
			<ul>
				<li><h4 class="cust_name"><%=customer.getName()%>(<%=customer.getId()%>)님
					</h4></li>
				<li>전화번호 : <%=customer.getPhone()%></li>
				<li>이메일 : <%=customer.getAddress()%></li>
			</ul>
		</div>

		<h5>내 주문내역</h5>
		<div class="my-order">
			<table>
				<tr class="thead">
					<td>주문코드</td>
					<td>주문일자</td>
					<td>결제금액</td>
					<td>주문상세</td>
				</tr>
				
					<%
					if (list != null) {
					%>
					<%
					for (SalesOrder target : list) {
					%>
				<tr class="order-tbody">
					<td><%=target.getId()%></td>
					<td><%=target.getDate()%></td>
					<td><%=target.getTotal()%></td>
					<td>
						<%
						if (target.getStatus().equals("Y")) {
						%> 결제완료 <%
						} else if (target.getStatus().equals("D")) {
						%> 배송중 <%
						} else {
						%> 결제 전 <%
						}
						%>
					</td>
					<%
					}
					%>
					<%
					} else {
					%>
					<td>주문 내역이 없습니다.</td>
					<%
					}
					%>
				</tr>
			</table>
		</div>

		<h5>등록 게시글</h5>
		<div class="my-board">
			<table>
				<tr class="thead">
					<td>등록일자</td>
					<td>제목</td>
					<td>게시판</td>
				</tr>
					<%
					if (blist != null) {
					%>
					<%
					for (Board target : blist) {
					%>
				<tr class="board-tbody">
					<td><%=target.getReigisteredDate()%></td>
					<td><%=target.getTitle()%></td>
					<td><%=catedao.getCategoryNameById(target.getCategoryId())%></td>
					<%
					}
					%>
					<%
					} else {
					%>
					<td>작성 내역이 없습니다.</td>
					<%
					}
					%>
				</tr>
			</table>
		</div>

		<div class="button-container">
			<input class = "button" type="button" value="정보수정" onclick="location.href='../?content=regist'">
			<input class = "button" type="button" value="회원탈퇴" onclick="location.href='../?content=dropcustomer'">
		</div>
	</div>


</body>

</html>