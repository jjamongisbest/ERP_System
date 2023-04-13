<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		<c:choose>
			<c:when test="${empty sessionScope.log}">
				<a id="regist" href="regist">회원가입</a>
				<a id="login" href="login">로그인</a>
			</c:when>
			<c:otherwise>
				<a id="mypage" href="myPage">마이페이지</a>
				<a id="logout" onclick="sendCommand('logout')">로그아웃</a>
			</c:otherwise>
		</c:choose>
	</div>
	<h1><a id="banner" href="/">발주사이트</a></h1>
	<script src="resources/validation.js"></script>
</body>
</html>