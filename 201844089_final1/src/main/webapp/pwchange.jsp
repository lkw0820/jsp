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
		<form action="pwchangeAction.jsp" method="post">
			<h3 style="text-align: center;">로그인 화면</h3>
			<div class="form-group">
				<input type="password" class="form-control" placeholder="현재 비밀번호" name="oldPw" maxlength="20">
			</div>
			<div class="form-group">
				<input type="password" class="form-control" placeholder="새 비밀번호" name="newPw" maxlength="20">
			</div>
			<div class="form-group">
				<input type="password" class="form-control" placeholder="새 비밀번호 확인" name="newPw1" maxlength="20">
			</div>
			<div class="form-group">
				<input type="submit" class="form-control" value="변경">
			</div>
		</form>
		</div>
	</div>
	
	
	<hr>
	<jsp:include page="/footer.jsp"/>
	
	<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</body>
</html>