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
<title>regist</title>
<link rel="stylesheet" href="../resources/regist.css">
</head>
<body>




	<section class="regist-box">
		<form method="POST" action="../service">
			<h1 id="info-title">회원정보 입력</h1>
			<input type="hidden" name="command" value="regist">
			<c:choose>
				<c:when test="${not empty gradeId}">
					<input type="hidden" id="gradeId" name="gradeId" value="${gradeId}">

				</c:when>
				<c:otherwise>
					<input type="hidden" id="gradeId" name="gradeId"
						value="${param.gradeId}">
				</c:otherwise>
			</c:choose>
			<table class="table">
				<tr>
					<th id="th">아이디</th>
					<td id="td"><c:choose>
							<c:when test="${not empty id}">
								<input type="text" id="id" name="id" value="${id}" readonly>
							</c:when>
							<c:otherwise>
								<input type="text" id="id" name="id" value="${param.id}"
									readonly>
							</c:otherwise>
						</c:choose></td>
				</tr>
				<tr>
					<th id="th">비밀번호</th>
					<td id="td"><input type="text" id="password" name="password"
						value="${not empty param.password ? param.password : ''}"
						${empty param.password ? 'autofocus' : ''}></td>
				</tr>
				<tr>
					<th id="th">이름</th>
					<td id="td"><input type="text" id="name" name="name"
						value="${not empty param.name ? param.name : ''}"
						${empty param.name ? 'autofocus' : ''}></td>
				</tr>
				<tr>
					<th id="th">주소</th>
					<td id="td"><input type="text" id="address" name="address"
						value="${not empty param.address ? param.address : ''}"
						${empty param.address ? 'autofocus' : ''}></td>
				</tr>
				<tr>
					<th id="th">핸드폰 번호</th>
					<td id="td"><input type="text" id="phone" name="phone"
						value="${not empty param.phone ? param.phone : ''}"
						${empty param.phone ? 'autofocus' : ''}></td>
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
			</div>
		</form>
	</section>
	<script src="resources/registCheck.js"></script>
</body>
</html>