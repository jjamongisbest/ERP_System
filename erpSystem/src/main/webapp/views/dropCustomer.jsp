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
<c:import url="header"/>
<body>

	<%
	

	int id = Integer.valueOf(request.getParameter("id"));
	
	
	String password = request.getParameter("password");

	%>

	<section>
		<form method="POST" action="../service">
			<input type="hidden" name="command" value="regist"> 	

			<div>
				<p>아이디</p>
				<input type="text" id="id" name="id" value="<%=id != 0 ? id : ""%>"
						<%=id == 0 ? "autofocus" : ""%>>
			</div>
			<div>
				<p>비밀번호</p>
				<input type="text" id="password" name="password" value="<%=password != null ? password : ""%>"
						<%=password == null ? "autofocus" : ""%>>
			</div>
			<input type="button" value="등록" onclick="checkValues(form)">

		</form>


	</section>
	<script src="resources/registCheck.js"></script>
</body>
<c:import url="footer"/>
</html>