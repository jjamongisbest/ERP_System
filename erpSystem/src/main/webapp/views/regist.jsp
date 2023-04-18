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
	<section class="regist-box">
		<form method="POST" action="../service">
<<<<<<< HEAD
			<h1 id="info-title">회원정보 입력</h1>
			<input type="hidden" name="command" value="<%=url%>"> <input
				type="hidden" id="gradeId" name="gradeId" value="<%=gradeId%>">
			<table class="table">
				<tr>
					<th id="th">성명</th>
					<td id="td"><input type="text" id="id" name="id" value=<%=id%>
						readonly></td>
				</tr>
				<tr>
					<th id="th">비밀번호</th>
					<td id="td"><input type="text" id="password" name="password"
						value="<%=password != null ? password : ""%>"
						<%=password == null ? "autofocus" : ""%>></td>
				</tr>
				<tr>
					<th id="th">이름</th>
					<td id="td"><input type="text" id="name" name="name"
						value="<%=name != null ? name : ""%>"
						<%=name == null ? "autofocus" : ""%>></td>
				</tr>
				<tr>
					<th id="th">주소</th>
					<td id="td"><input type="text" id="address" name="address"
						value="<%=address != null ? address : ""%>"
						<%=address == null ? "autofocus" : ""%>></td>
				</tr>
				<tr>
					<th id="th">핸드폰 번호</th>
					<td id="td"><input type="text" id="phone" name="phone"
						value="<%=phone != null ? phone : ""%>"
						<%=password == null ? "autofocus" : ""%>></td>
				</tr>
				<tr>
					<th id="th">성별</th>
					<td id="td"><select id="gender" name="gender">
							<option value="Male">남자</option>
							<option value="Female">여자</option>
					</select></td>
				</tr>
			</table>
			<div class="button">
				<input type="button" value="등록" onclick="checkValues(form)"
					class="regist">
=======
			<h1>회원정보 입력</h1>
			<input type="hidden" name="command" value=<%=url %>> <input
				type="hidden" id="gradeId" name="gradeId" value=<%=gradeId%>>

			<div class="inform">
				<p>아이디</p>
				<input type="text" id="id" name="id" value=<%=id%> readonly>
>>>>>>> refs/remotes/origin/#03_WooJongguk
			</div>
		</form>
	</section>

	<script src="resources/registCheck.js"></script>

</body>

</html>