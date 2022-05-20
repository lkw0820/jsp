<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="shoes.ShoesDAO" %>
<%@ page import="shoes.Shoes" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;" charset="UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<title>Insert title here</title>
</head>
<body>
	<%	request.setCharacterEncoding("utf-8");
		int day = Integer.parseInt(request.getParameter("day"));
	%>
	<jsp:include page="header.jsp"/>
	<table width="500">
			<%
				ShoesDAO shoesDAO = new ShoesDAO();
				ArrayList<Shoes> list = shoesDAO.shoesinfo(day);
				for(int i=0;i<list.size();i++){
				/* String[] infoa = info.split(","); */
			%>
		<thead>
				<%if(list.get(i).getImage()!=null){
						
				%>
					<tr>
						<td>이미지</td>
						<td colspan="2"><img alt="<%=list.get(i).getImage() %>" src="imagefile2/<%=list.get(i).getImage() %>" width="400" height="300"></td>
					</tr>
				<%
					}
				%>
			<tr>
				<th style="background-color: #eeeeee; text-align:center;">이름</th>
				<th style="background-color: #eeeeee; text-align:center;">가격</th>
				<th style="background-color: #eeeeee; text-align:center;">사이트</th>
				<th style="background-color: #eeeeee; text-align:center;">방법</th>
			</tr>
		</thead>
		<tbody>
			
			<tr style="text-align:center;">
				<td><%=list.get(i).getName() %></td>
				<td><%=list.get(i).getPrice() %></td>
				<td><a href="http://www.<%=list.get(i).getSite() %>.com"><%=list.get(i).getSite() %></a></td>
				<td><%=list.get(i).getMethod() %></td>
			</tr>
			<tr>
				<td colspan=4 >-----------------------------------------------------------------------------------------------------------</td>
			</tr>

			<%
				}
			%>
		</tbody>
	</table>
	<input type="button" class="btn btn-primary pull-right" onclick="location.href='calendar.jsp'" value="돌아가기">
	
	
	<%-- <%=infoa[0] %><br>
	<%=infoa[1] %><br>
	<a href="http://www.<%=infoa[2] %>.com"><%=infoa[2] %></a><br>
	<%=infoa[3] %><br>
	 --%>
	
	
	<hr>
	<jsp:include page="/footer.jsp"/>
</body>
</html>