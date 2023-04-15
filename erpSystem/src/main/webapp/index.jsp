<%@page import="util.DBManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:import url="header"/>

<%
System.out.println(session.getAttribute("log"));
%>

<h1>hello world!</h1>
<c:import url="searchproduct"/>

<c:import url="main"/>


</body>
</html>