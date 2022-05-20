<%@page import="java.util.ArrayList"%>
<%@page import="shoes.ShoesDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
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
<%
	ShoesDAO shoesDAO = new ShoesDAO();
	ArrayList<String> list = shoesDAO.showimg();
	Date nowTime = new Date();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 mm월 dd일 a hh:mm:ss"); /* a는 오전 오후 표시 */
	
%>
	<jsp:include page="header.jsp"/>
	<div class="container">
		<div class="jumbotron">
			<table border="1" style="text-align:center; margin:auto;">
			
		<%
			if(list.size()!=0){
		%>
			<tr>
				<td colspan="3"><h3>오늘 발매하는 신발</h3></td>
			</tr>
			<tr>
		<%
				if(list.size()>3){
					for(int i=0; i<3;i++){
		%>
						<td>
							<img id="image" alt="<%=list.get(i) %>" src="imagefile2/<%=list.get(i) %>" width="350" height="300">
						</td>
		<%
					}
				}else{
					for(int i=0; i<list.size();i++){
		%>
						<td>
							<img id="image" alt="<%=list.get(i) %>" src="imagefile2/<%=list.get(i) %>" width="350" height="300">
						</td>
		<%
					}
				}
			}
		%>
			</tr>
				<tr>
					<td colspan="3">
						<p style="text-align:center;">현재 접속시간 : <%=sdf.format(nowTime) %></p>
					</td>
				</tr>
			</table>
		</div>
	</div>
	<hr>
	<jsp:include page="/footer.jsp"/>
	<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>