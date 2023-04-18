<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AdminPage</title>
<link rel="stylesheet" href="../resources/adminpage.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://www.gstatic.com/charts/loader.js"></script>
<!-- jQuery 라이브러리 로드 -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<c:import url="header" />
<body>

	<div class="container">
		<div class="button-container">
			<button type="button" id="btn">등급별 매출</button>
			<button type="button" id="btn2">월별 매출</button>
			<a href="orderconfirmation" class="sales">주문총확인</a>
		</div>

		<div id="column_chart_div1" style="width: 900px; height: 500px;"></div>
		
	</div>

	<script src="../resources/drawGraph.js"></script>
</body>
<c:import url="footer" />
</html>