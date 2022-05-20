<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="shoes.Shoes" %>
<%@ page import="shoes.ShoesDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<% 	request.setCharacterEncoding("utf-8"); 
	String fileSave = "/imagefile2";
	String real = application.getRealPath(fileSave);
	int max = 1024*1024*10;
	MultipartRequest mr = new MultipartRequest(request, real, max,"utf-8",
		new DefaultFileRenamePolicy());
	String image = mr.getFilesystemName("image");
	int day = Integer.parseInt(mr.getParameter("day"));
	String name = mr.getParameter("name");
	int price = Integer.parseInt(mr.getParameter("price"));
	String site = mr.getParameter("site");
	String method = mr.getParameter("method");
	ShoesDAO shoesDAO = new ShoesDAO();
	int result = shoesDAO.insert(day, name, price, site, method, image);
	if(result == -1){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('글쓰기 오류')");
		script.println("history.back()");
		script.println("</script>");
	}else{
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('게시물 작성 성공하였습니다.')");
		script.println("location.href = 'calendar.jsp'");
		script.println("</script>");
	}
%>

</body>
</html>