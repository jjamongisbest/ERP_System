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
	CustomerGradeDAO customerGradeDao = CustomerGradeDAO.getinstance();

	CustomerGrade customerGrade = customerGradeDao.getCustomerGradeById(1);

	int gradeId = customerGrade.getGradeId();

	CustomerDAO customerDao = CustomerDAO.getinstnace();
	int id = customerDao.getCustomerId();
	
	String password = request.getParameter("password");
	String name = request.getParameter("name");
	String address = request.getParameter("address");
	String phone = request.getParameter("phone");
	String gender = request.getParameter("gender");
	
	%>

	<section>
		<form method="POST" action="../service">
			<input type="hidden" name="command" value="regist"> 
			<input type="hidden" id="gradeId" name="gradeId" value=<%=gradeId%>>

			<div>
				<p>아이디</p>
				<input type="text" id="id" name="id" value=<%=id%> readonly>
			</div>
			<div>
				<p>비밀번호</p>
				<input type="text" id="password" name="password" value="<%=password != null ? password : ""%>"
						<%=password == null ? "autofocus" : ""%>>
			</div>
			<div>
				<p>이름</p>
				<input type="text" id="name" name="name" value="<%=name != null ? name : ""%>"
						<%=name == null ? "autofocus" : ""%>>
			</div>
			<div>
				<p>주소</p>
				<input type="text" id="address" name="address" value="<%=address != null ? address : ""%>"
						<%=address == null ? "autofocus" : ""%>>
			</div>
			<div>
				<p>핸드폰 번호</p>
				<input type="text" id="phone" name="phone" value="<%=phone != null ? phone : ""%>"
						<%=password == null ? "autofocus" : ""%>>
			</div>
			<div>
				<p>성별</p>
				<input type="text" id="gender" name="gender" value="<%=gender != null ? gender : ""%>"
						<%=gender == null ? "autofocus" : ""%>>
			</div>

			<input type="button" value="등록" onclick="checkValues(form)">

		</form>


	</section>
	<script src="resources/registCheck.js"></script>
</body>
<c:import url="footer"/>
</html>