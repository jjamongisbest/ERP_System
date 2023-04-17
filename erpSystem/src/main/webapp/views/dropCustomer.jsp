<%@page import="customerGrade.CustomerGrade"%>
<%@page import="customerGrade.controller.CustomerGradeDAO"%>
<%@page import="customer.controller.CustomerDAO"%>
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
	<section>
		<form action="../service" method="POST">
		<input type="hidden" name="command" value="dropCustomer"> 
		<label for="password">비밀번호:</label> <input type="text" id="password"
			name="password"> <input type="button" value="로그인"
			onclick="checkValues(form)">
		<%
		if (request.getAttribute("message") != null) {
		%>
		<p>${message}</p>
		<%
		}
		%>
		</form>
	</section>
	<script src="resources/dropCustomer.js"></script>
</body>
<c:import url="footer" />
</html>