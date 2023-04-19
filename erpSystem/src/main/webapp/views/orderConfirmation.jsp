<%@page import="salesOrder.SalesOrder"%>
<%@page import="java.util.ArrayList"%>
<%@page import="salesOrder.controller.SalesOrderDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/orderConfirm.css">
</head>
<body>
	<%
	SalesOrderDAO salesOrderDao = SalesOrderDAO.getInstance();

	String vpage = request.getParameter("vpage");
	if (vpage == null) {
		vpage = "1";
	}

	int selPage = Integer.parseInt(vpage);
	int total = salesOrderDao.getTotalOrderCount();
	
	
	ArrayList<SalesOrder> list = salesOrderDao.getOrdersPerPage(selPage);
	int lastPage = (int) Math.ceil((double) total / 10);
	
	
	%>
	<section class="board">
		<form method="POST" action="../service">
			<h1>주문처리상태페이지</h1>
			<table>
				<thead>
					<tr>
						<td>주문번호</td>
						<td>구매아이디</td>
						<td>결제금액</td>
						<td>주문일자</td>
						<td>결제상태</td>
					</tr>
				</thead>
				<%
				for (SalesOrder salesOrder : list) {
				%>
				<tbody>
					<tr>
						<td><%=salesOrder.getId()%></td>
						<td><%=salesOrder.getCustomerId()%></td>
						<td><%=salesOrder.getTotal()%></td>
						<td><%=salesOrder.getDate()%></td>
						<td><a id="check-values"
							onclick="checkValues('<%=salesOrder.getId()%>','<%=salesOrder.getStatus()%>')">
								<%
								if (salesOrder.getStatus().equals("Y")) {
								%> 주문완료<%
								} else if (salesOrder.getStatus().equals("D")) {
								%> 배송중 <%
								} else {
								%> 결제전 <%
								}
								%>
						</a></td>
					</tr>
				</tbody>
				<%
				}
				%>
			</table>
		</form>
		<div style="width: 600px; text-align: center; margin-top: 30px;" class="number">
			
			<%
			for (int i = 1; i <= lastPage; i++) {
			%>
			<a href="../?content=orderconfirmation&vpage=<%=i%>"><%=i%></a>
			<%
			}
			%>
			
		</div>
	</section>

</body>
<script src="resources/orderConfirmation.js"></script>
</html>