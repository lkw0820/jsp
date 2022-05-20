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
		String userID = null;
		if(session.getAttribute("userID")!=null){
			userID = (String) session.getAttribute("userID");
		}
	%>
	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<a class="navbar-brand" href="main.jsp">신발정보 사이트</a>
		</div>
		<div class="collapse navbar-collapse">
			<ul class="nav navbar-nav">
				<li><a href="main.jsp">메인</a>
				<li><a href="bbs.jsp">게시판</a>
				<li><a href="calendar.jsp">캘린더</a>
			</ul>
			<%
				
				if(userID == null){
			%>	
				<ul class="nav navber_nav navbar-right">
					<li><a href="signup.jsp">회원가입</a>
				</ul>
				<ul class="nav navber_nav navbar-right">
					<li><a href="login.jsp">로그인</a>
				</ul>
			<% 		
				}else{
			%>
				<p align="right"> <%=userID %> 님 안녕하세요
				<ul class="nav navber_nav navbar-right">
					<li><a href="logoutAction.jsp">로그아웃</a>
				</ul>
				<ul class="nav navber_nav navbar-right">
					<li><a href="myInfo.jsp">내정보</a>
				</ul>
			<%
				}
			%>
			
			
		</div>
	</nav>
</body>
</html>