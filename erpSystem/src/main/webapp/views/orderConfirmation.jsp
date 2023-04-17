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
</head>
<c:import url="header" />
<body>
	<%
	SalesOrderDAO salesOrderDao = SalesOrderDAO.getInstance();
	ArrayList<SalesOrder> list = salesOrderDao.getSalesOrderByCustomerID();

	String vpage = request.getParameter("vpage");
	if (vpage == null) {
		vpage = "1";
	}

	int selPage = Integer.parseInt(vpage);
	int total = salesOrderDao.getTotalCountByCategory();
	int lastPage = (int) Math.ceil((double) total / 10);
	%>
	<section>
		<formmethod="POST" action="../service">
			<table>
				<tr>
					<td>주문번호</td>
					<td>구매아이디</td>
					<td>결제금액</td>
					<td>주문일자</td>
					<td>결제상태</td>
				</tr>
				<%
				for (SalesOrder salesOrder : list) {
				%>
				<tr>
					<td><%=salesOrder.getId()%></td>
					<td><%=salesOrder.getCustomerId()%></td>
					<td><%=salesOrder.getTotal()%></td>
					<td><%=salesOrder.getDate()%></td>
					<td><a onclick="checkValues('<%=salesOrder.getId()%>')"
						><%=salesOrder.getStatus()%></a></td>
				</tr>

				<%
				}
				%>
			</table>
		</form>
		<div style="width: 600px; text-align: center; margin-top: 10px;">

			<%
			for (int i = 1; i <= lastPage; i++) {
			%>
			<a href="orderConfirmation?vpage=<%=i%>"><%=i%></a>
			<%
			}
			%>

		</div>
	</section>

</body>
<script src="resources/orderConfirmation.js"></script>
<c:import url="footer" />
</html>