<%@page import="customer.Customer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/header.css">
</head>
<body>

	<%
	Customer customer = (Customer) session.getAttribute("log");
	%>
	<div class="container">
		<div class="header">
			<section class="logo">
				<img src="../resources/images/banner2.jpg">
			</section>
			<section class="banner">
				<img src="../resources/images/banner.jpg">
			</section>
		</div>
		<section class="nav-list">
			<nav>
				<ul>
					<c:choose>
						<c:when test="${empty sessionScope.log}">
							<li><a id="regist" href="regist">회원가입</a></li>
							<li><a id="login" href="login">로그인</a></li>
						</c:when>
						<c:otherwise>
							<li><a id="mypage"
								href="mypage?custid=<%=customer.getId()%>"> 마이페이지</a></li>
							<li><a id="logout" onclick="sendCommand('logout')">로그아웃</a></li>
						</c:otherwise>
					</c:choose>
					<li><a href="announce">공지사항</a></li>
					<li><a href="inquiry">1:1문의</a></li>
					<li><a href="review">후기글</a></li>
					<li><form>
							<section class="search-box">
								<input type="text" placeholder="주문할 것 pickka!">
								<button type="submit">Search</button>
							</section>
						</form></li>
				</ul>
			</nav>
		</section>

	</div>

	<script src="resources/validation.js"></script>
</body>
</html>