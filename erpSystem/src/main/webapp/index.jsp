<%@page import="salesOrder.SalesOrder"%>
<%@page import="util.DBManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<section class="frame">
		<c:choose>
			<c:when test="${empty sessionScope.init}">
				<c:import url="/service">
					<c:param name="command" value="getmain" />
				</c:import>
			</c:when>
			<c:otherwise>
				<c:import url="main" />
			</c:otherwise>
		</c:choose>
	</section>
</body>
</html>