<%@page import="java.util.ArrayList"%>
<%@page import="boardCategory.controller.BoardCategoryDAO"%>
<%@page import="boardCategory.BoardCategory"%>
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

	BoardCategoryDAO boardcateDao = BoardCategoryDAO.getInstance();
	ArrayList<BoardCategory> list = boardcateDao.getBoardCategoryAll();
	%>
	<div class="container">
		<div class="header">
			<a class="logo" href="index.jsp"> <img
				src="../resources/images/banner2.jpg">
			</a> <a class="banner" href="index.jsp"> <img
				src="../resources/images/banner.jpg">
			</a>
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
							<c:choose>
								<c:when test="${sessionScope.log.getId() != 99999 }">
									<li><a id="mypage"
										href="mypage?custid=<%=customer.getId()%>"> 마이페이지</a></li>
								</c:when>
								<c:otherwise>
									<li><a id="adminpage"
										href="adminpage"> 관리자페이지</a></li>
								</c:otherwise>
							</c:choose>
							<li><a id="logout" onclick="sendCommand('logout')">로그아웃</a></li>
							<li><a id="basket" onclick="send('order')">장바구니</a></li>
						</c:otherwise>
					</c:choose>

					<%
					for (BoardCategory target : list) {
					%>
					<li><a href="board?cate=<%=target.getId()%>"><%=target.getName()%></a></li>
					<%
					}
					%>
					<li><form method="POST" action="../service">
							<input type="hidden" name="command" value="product">
							<section class="search-box">
								<input type="text" name="keyword" placeholder="주문할 것 pickka!">
								<button type="submit">Search</button>
							</section>
						</form>
					</li>
				</ul>
			</nav>
		</section>

	</div>

	<script src="resources/validation.js"></script>
</body>
</html>