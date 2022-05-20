<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<%@page import="java.io.PrintWriter"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String userID = (String) session.getAttribute("userID");
	String oldpw = request.getParameter("oldPw");
	String newpw = request.getParameter("newPw");
	String newpw1 = request.getParameter("newPw1");
	
	if(oldpw==null || newpw==null || newpw1==null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('입력하지 않은 항목이 있습니다.')");
		script.println("history.back()");
		script.println("</script>");
	}else{
		if(newpw.equals(newpw1)){
			UserDAO userDAO = new UserDAO();
			int result = userDAO.changePw(userID, oldpw, newpw);
			if(result==-2){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('DB오류')");
				script.println("history.back()");
				script.println("</script>");
			}else if(result==-1){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('현재 비밀번호가 틀렸습니다.')");
				script.println("history.back()");
				script.println("</script>");
			}else{
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('비밀번호가 변경되었습니다.')");
				script.println("location.href = 'myInfo.jsp'");
				script.println("</script>");
			}
		}else{
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('새비밀번호와 새비밀번호 확인이 일치 하지 않습니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
	}
	
%>


</body>
</html>