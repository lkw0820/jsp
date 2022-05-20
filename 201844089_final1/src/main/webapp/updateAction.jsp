<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bbs.BbsDAO" %>
<%@ page import="bbs.Bbs" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%request.setCharacterEncoding("utf-8"); %>
	<%
		String fileSave = "/imagefile";
		String real = application.getRealPath(fileSave);
		int max = 1024*1024*10;
		MultipartRequest mr = new MultipartRequest(request, real, max,"utf-8",
			new DefaultFileRenamePolicy());
		String anonymous = mr.getParameter("anonymous");
		String bbsTitle = mr.getParameter("bbsTitle");
		String bbsContent = mr.getParameter("bbsContent");
		String image = mr.getFilesystemName("image");
		int avalue=0;
		if(anonymous.equals("true")){
			avalue = 1;
		}
		
		String userID = null;
		if(session.getAttribute("userID")!= null){
			userID = (String)session.getAttribute("userID");
		}
		int bbsID = 0;
		if(request.getParameter("bbsID") != null){
			bbsID = Integer.parseInt(request.getParameter("bbsID"));
		}
		if(bbsID == 0){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않음')");
			script.println("location.href = 'bbs.jsp");
			script.println("</script>");
		}
		 Bbs bbs = new BbsDAO().getBbs(bbsID);
		if(!userID.equals(bbs.getUserID())){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('권한이 없습니다.')");
			script.println("location.href = 'bbs.jsp");
			script.println("</script>");
		}else{
			/* if(request.getParameter("bbsTitle") == null || request.getParameter("bbsContent") == null || 
					request.getParameter("bbsTitle").equals("") ){
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('입력하지 않은 항목이 있습니다.')");
					script.println("history.back()");
					script.println("</script>");
				}else{ */
					BbsDAO bbsDAO = new BbsDAO();
					int result = bbsDAO.update(bbsID, bbsTitle, bbsContent, avalue, image);
						if(result == -1){
							PrintWriter script = response.getWriter();
							script.println("<script>");
							script.println("alert('글 수정 오류')");
							script.println("history.back()");
							script.println("</script>");
						}
						else{
							PrintWriter script = response.getWriter();
							script.println("<script>");
							script.println("alert('게시물 수정이 성공하였습니다.')");
							script.println("location.href = 'bbs.jsp'");
							script.println("</script>");
						}
					}
				/* } */
	%>

</body>
</html>