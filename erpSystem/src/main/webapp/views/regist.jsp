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
<body>

<%
CustomerGradeDAO customerGradeDao = CustomerGradeDAO.getinstance();


%>

<section>
<form method="POST" action="../service">
<input type="hidden" name="command" value="regist">

<div>
<p>아이디</p>
<input type="text" id="id" name="id" value=<%= %> >
</div>
<div>
<p>비밀번호</p>
<input type="text" id="password" name="password" value=<%= %> >
</div>
<div>
<p>이름</p>
<input type="text" id="name" name="name" value=<%= %> >
</div>
<div>
<p>주소</p>
<input type="text" id="address" name="address" value=<%= %> >
</div>
<div>
<p>핸드폰 번호</p>
<input type="text" id="phone" name="phone" value=<%= %> >
</div>
<div>
<p>성별</p>
<input type="text" id="gender" name="gender" value=<%= %> >
</div>

</form>


</section>

</body>
</html>