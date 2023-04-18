<%@page import="customer.Customer"%>
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
<link rel="stylesheet" href="../resources/regist.css">
</head>
<c:import url="header" />
<body>

	<%
	CustomerGradeDAO customerGradeDao = CustomerGradeDAO.getinstance();
	CustomerGrade customerGrade = customerGradeDao.getCustomerGradeById(1);
	int gradeId = customerGrade.getGradeId();

	CustomerDAO customerDao = CustomerDAO.getinstnace();
	int id = customerDao.getCustomerId();
	String password = "";
	String name = "";
	String address = "";
	String phone = "";
	String url = "regist";

	Customer customer = (Customer) session.getAttribute("log");
	if (customer != null) {
		id = customer.getId();
		password = customer.getPassword();
		name = customer.getName();
		address = customer.getAddress();
		phone = customer.getPhone();
		url = "customerlog";
	}
	%>
	<section>
	
		<form method="POST" action="../service">
		<h1>회원정보 입력</h1>
			<input type="hidden" name="command" value="<%=url%>"> 
			<input type="hidden" id="gradeId" name="gradeId" value=<%=gradeId%>>

			<div class="inform">
				<p>아이디</p>
				<input type="text" id="id" name="id" value=<%=id%> readonly>
			</div>
			<div class="inform">
				<p>비밀번호</p>
				<input type="text" id="password" name="password"
					value="<%=password != null ? password : ""%>"
					<%=password == null ? "autofocus" : ""%>
					>
			</div>
			<div class="inform">
				<p>이름</p>
				<input type="text" id="name" name="name"
					value="<%=name != null ? name : ""%>"
					<%=name == null ? "autofocus" : ""%>>
			</div>
			<div class="inform">
				<p>주소</p>
				<input type="text" id="address" name="address"
					value="<%=address != null ? address : ""%>"
					<%=address == null ? "autofocus" : ""%>>
			</div>
			<div class="inform">
				<p>핸드폰 번호</p>
				<input type="text" id="phone" name="phone"
					value="<%=phone != null ? phone : ""%>"
					<%=password == null ? "autofocus" : ""%>>
			</div>
			<div class="inform">
				<p>성별</p>
				<select id="gender" name="gender">
					<option value="Male">남자</option>
					<option value="Female">여자</option>
				</select>
			</div>
			<input type="button" value="등록" onclick="checkValues(form)">
		</form>


	</section>
	<script src="resources/registCheck.js"></script>

</body>
<c:import url="footer" />
</html>