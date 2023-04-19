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
<link rel="stylesheet" href="../resources/dropCustomer.css">
</head>

<body>
	<section class="drop">
		<form action="../service" method="POST" class="login">
			<input type="hidden" name="command" value="dropCustomer">
			<h2 id="title">회원탈퇴</h2>
			<label for="password">비밀번호:</label>
			<input type="text" id="password"name="password">
			<input type="button" value="탈퇴" onclick="checkValues(form)">
			
			<c:set var="message" value="${requestScope.message }"/>
			<c:if test="${message }">
				<p>${message}</p>				
			</c:if>
			
		</form>
	</section>
	<script src="resources/dropCustomer.js"></script>
</body>

</html>