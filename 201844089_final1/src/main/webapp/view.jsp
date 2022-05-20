<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.io.PrintWriter" %>

<%@ page import="bbs.Bbs" %>
<%@ page import="bbs.BbsDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;" charset="UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<title>Insert title here</title>
</head>
<body>
	<%
	
		String userID = null;
		if(session.getAttribute("userID")!=null){
			userID = (String) session.getAttribute("userID");
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
		
		
	%>
<jsp:include page="header.jsp"/>
	<div class="container">
		<div class="row">
				<table class="table table-striped" style="text-align: center; border:1px solid #dddddd">
					<thead>
						<tr>
							<th colspan="3" style="background-color: #eeeeee; text-align:center;">게시판 글보기</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td style="width: 20%;">글 제목</td>
							<td colspan="2"><%=bbs.getBbsTitle().replaceAll(" ","&nbsp;").replaceAll("<","&lt;").replaceAll(">","&gt;").replaceAll("\n","<br>") %></td>
						</tr>
						<tr>
							<td>작성자</td>
							<td colspan="2">
						<%
							if(bbs.getAnonymous()== 1){
						%>
							익명
						<%
							}else{
						%>
							<%=bbs.getUserID() %>
						<%
							}
						%>
							</td>
						</tr>
						<tr>
							<td>작성일자</td>
							<td colspan="2"><%=bbs.getBbsDate().substring(0,11)+ bbs.getBbsDate().substring(11,13) + "시" + bbs.getBbsDate().substring(14,16) + "분"%></td>
						</tr>
						<tr>
							<td>내용</td>
							<td colspan="2" style="min-height: 200px; text-align: left"><%=bbs.getBbsContent().replaceAll(" ","&nbsp;").replaceAll("<","&lt;").replaceAll(">","&gt;").replaceAll("\n","<br>") %></td>
						</tr>
 				 		<%if(bbs.getImage()!=null){
						
						%>
						<tr>
							<td>이미지</td>
							<td colspan="2"><img alt="<%=bbs.getImage() %>" src="imagefile/<%=bbs.getImage() %>" width="400" height="300"></td>
						</tr>
						<%
						}
						%>
					</tbody>
				</table>
				<a href="bbs.jsp" class="btn btn-primary pull-right">목록</a>
				<%
					if(userID != null && userID.equals(bbs.getUserID())){
				%>
						<a href="update.jsp?bbsID=<%=bbsID %>" class="btn btn-primary pull-right">수정</a>
						<a onclick="return confirm('정말로 삭제하시겠습니까?')" href="deleteAction.jsp?bbsID=<%=bbsID %>" class="btn btn-primary pull-right">삭제</a>
				<%
					}
				%>
				
		</div>
	</div>
	<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
	
	<hr>
	<jsp:include page="/footer.jsp"/>

</body>
</html>