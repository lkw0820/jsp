<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bbs.BbsDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8"); 
	String fileSave = "/imagefile";
	String real = application.getRealPath(fileSave);
	int max = 1024*1024*10;
	MultipartRequest mr = new MultipartRequest(request, real, max,"utf-8",
			new DefaultFileRenamePolicy());
	String image = mr.getFilesystemName("image");
	String anonymous = mr.getParameter("anonymous");
	String bbsTitle = mr.getParameter("bbsTitle");
	String bbsContent = mr.getParameter("bbsContent");
	int avalue=0;
	if(anonymous.equals("true")){
		avalue = 1;
	}

	String userID = null;
	if(session.getAttribute("userID")!= null){
		userID = (String)session.getAttribute("userID");
	}
		
	BbsDAO bbsDAO = new BbsDAO();
	int result = bbsDAO.write(bbsTitle, userID, bbsContent, avalue, image);
	if(result == -1){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('글쓰기 오류')");
		script.println("history.back()");
		script.println("</script>");
	}
	else{
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('게시물 작성 성공하였습니다.')");
		script.println("location.href = 'bbs.jsp'");
		script.println("</script>");
	}
				
	%>

</body>
</html>