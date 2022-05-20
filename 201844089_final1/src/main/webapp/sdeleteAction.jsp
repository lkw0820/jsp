<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="shoes.ShoesDAO" %>
<%@page import="java.io.PrintWriter"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	ShoesDAO shoesDAO = new ShoesDAO();
	int result = shoesDAO.deleteinfo();
	if(result==-1){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('DB오류')");
		script.println("history.back()");
		script.println("</script>");
	}else{
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('정리 완료')");
		script.println("history.back()");
		script.println("</script>");
	}

%>

</body>
</html>