<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="user" class="user.User" scope="page"/>
<jsp:setProperty name="user" property="userID"/>
<jsp:setProperty name="user" property="userPassword"/>
<jsp:setProperty name="user" property="userName"/>
<jsp:setProperty name="user" property="userPassword1"/>
	<%
		if(user.getUserID() == null || user.getUserPassword()==null 
			|| user.getUserPassword1()==null|| user.getUserName()==null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('입력하지 않은 항목이 있습니다.')");
			script.println("history.back()");
			script.println("</script>");
		}else{
			if(user.getUserPassword().equals(user.getUserPassword1())){
				UserDAO userDAO = new UserDAO();
				int result = userDAO.signup(user);
				if(result == -1){
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('이미 존재하는 아이디 입니다')");
					script.println("history.back()");
					script.println("</script>");
				}
				else{
					session.setAttribute("userID",user.getUserID());
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('회원가입이 성공하였습니다.')");
					script.println("location.href = 'main.jsp'");
					script.println("</script>");
				}
			}else{
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('비밀번호가 다릅니다.')");
				script.println("history.back()");
				script.println("</script>");
			}
		}
		
		
	%>

</body>
</html>