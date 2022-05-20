<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;" charset="UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="header.jsp"/>
	<div class="container">
		<div class="jumbotron">
		<form action="loginAction.jsp" method="post">
			<h3 style="text-align: center;">로그인 화면</h3>
			<div class="form-group"> <!-- div: 영역을 나누는것 placeholder: 택스트창에 써있는 글씨 -->
				<input type="text" class="form-control" placeholder="아이디" name="userID" maxlength="20">
			</div>
			<div class="form-group">
				<input type="password" class="form-control" placeholder="비밀번호" name="userPassword" maxlength="20">
			</div>
			<div class="form-group">
				<input type="submit" class="form-control" value="로그인">
			</div>
		</form>
		</div>
	</div>
	<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
	
	<hr>
	<jsp:include page="/footer.jsp"/>
</body>
</html>