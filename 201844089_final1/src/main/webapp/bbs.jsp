<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.io.PrintWriter" %>
<%@ page import="bbs.BbsDAO" %>
<%@ page import="bbs.Bbs" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;" charset="UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<title>게시판</title>
</head>
<body>
	<%
		String userID = null;
		if(session.getAttribute("userID")!=null){
			userID = (String) session.getAttribute("userID");
		}
		if(userID == null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인 하세요')");
			script.println("history.back()");
			script.println("</script>");
		}
		int pageNumber = 1;
		if(request.getParameter("pageNumber")!=null){
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		}
	%>
<jsp:include page="header.jsp"/>
	
	<div class="container">
		<div class="row">
		<a href="write.jsp" class="btn btn-primary pull-right">글쓰기</a>
			<table class="table table-striped" style="text-align: center; border:1px solid #dddddd">
				<thead>
					<tr>
						<th style="background-color: #eeeeee; text-align:center;">번호</th>
						<th style="background-color: #eeeeee; text-align:center;">제목</th>
						<th style="background-color: #eeeeee; text-align:center;">작성자</th>
						<th style="background-color: #eeeeee; text-align:center;">작성일</th>
					</tr>
				</thead>
				<tbody>
					<%
						BbsDAO bbsDAO = new BbsDAO();
						ArrayList<Bbs> list = bbsDAO.getList(pageNumber);
						for(int i=0; i < list.size(); i++){
						
					%>
					<tr>
						<td><%= list.get(i).getBbsID() %></td>
						<td><a href="view.jsp?bbsID=<%= list.get(i).getBbsID() %>"><%= list.get(i).getBbsTitle() %></a></td>
						<td>
						<%
							if(list.get(i).getAnonymous()== 1){
						%>
							익명
						<%
							}else{
						%>
							<%= list.get(i).getUserID() %>
						<%
							}
						%>
						</td>
						<td><%= list.get(i).getBbsDate().substring(0,11)+ list.get(i).getBbsDate().substring(11,13) + "시" + list.get(i).getBbsDate().substring(14,16) + "분"%></td>
					</tr>
					<%
						}
					%>
				</tbody>
			</table>
		</div>
	</div>
	<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
	
	<hr>
	<jsp:include page="/footer.jsp"/>

</body>
</html>