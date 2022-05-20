<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;" charset="UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		UserDAO userDAO = new UserDAO();
		String userID = null;
		String userName = null;
		userID = (String) session.getAttribute("userID");
		userName = userDAO.myinfo(userID);
		
	%>
	<jsp:useBean id="user" class="user.User" scope="request"/>

<jsp:include page="header.jsp"/>
	<div class="container">
		<div class="jumbotron">
		<form method="post">
			<h3 style="text-align: center;">내정보</h3>
			<div class="form-group"> 
				ID : <%=userID %>
			</div>
			<div class="form-group">
				이름 : <%=userName %>
			</div>
			<div class="form-group" style="text-align : right;">
				<input type="button"  value="비밀번호 변경" onclick="location.href='pwchange.jsp'">
			</div>
		</form>
		</div>
	</div>		
	<hr>
	<jsp:include page="/footer.jsp"/>
</body>
</html>