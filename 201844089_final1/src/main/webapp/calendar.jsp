<%@page import="java.io.PrintWriter"%>
<%@ page import="cal.Calendar" %>
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
<%request.setCharacterEncoding("utf-8"); %>
<script type="text/javascript"> /* db에서 오류생기는 것보다 여기서 오류를 잡아준다 */
	function check(){
		if(!frm.name.value){
			alert("이름을 입력하세요");
			return false;
		}
		if(!frm.price.value){
			alert("가격을 입력하세요");
			return false;
		}
		if(!frm.site.value){
			alert("사이트를 입력하세요");
			return false;
		}
		if(!frm.method.value){
			alert("방법을 입력하세요");
			return false;
		}
		if(!frm.image.value){
			alert("방법을 입력하세요");
			return false;
		}
		return true;
		
	}
	</script>
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
%>
<jsp:include page="header.jsp"/>
	<%

		Date date = new Date();
		int year = date.getYear() +1900;
		int month = date.getMonth() +1;

	
		try{
			year = Integer.parseInt(request.getParameter("year"));
			month = Integer.parseInt(request.getParameter("month"));
			
			if(month>=13){
		year++;
		month =1;
			}else if(month <=0){
		year--;
		month =12;
			}
		}catch(Exception e){
			
		}
	%>

<table width ="700" align ="center" border ="1" cellpadding="5" cellspacing="0">
	<tr>
		<th>
		<input type="button" value="이전 달" onclick="location.href='?year=<%=year%>&month=<%=month-1%>'">
		</th>
		<th id = "title" colspan = "5">
		<%=year%>년  <%=month%>월
		</th>
		<th>
		<input type="button" value="다음 달" onclick="location.href='?year=<%=year%>&month=<%=month+1%>'">
		</th>
	</tr>
	<tr>
		<td bgcolor="red" style="color:white" width ="100">일</td>
		<td width ="100">월</td>
		<td width ="100">화</td>
		<td width ="100">수</td>
		<td width ="100">목</td>
		<td width ="100">금</td>
		<td bgcolor="blue" style="color:white" width ="100">토</td>
	</tr>
	

	<tr>
	<%
			int first = Calendar.weekDay(year, month, 1);		
			int start = 0 ;
			start = month ==1? Calendar.lastDay(year-1, 12)- first : Calendar.lastDay(year, month-1)- first;
			for(int i= 1; i<= first; i++){
		if(i==1){

			out.println("<td>"+(month ==1? 12 : month-1)+"/"+ ++start +"</td>");
		}else{
			out.println("<td>"+(month ==1? 12 : month-1)+"/"+ ++start +"</td>");
			
		}
			}
			for(int i = 1; i <= Calendar.lastDay(year, month); i++){
		switch(Calendar.weekDay(year, month, i)){
			case 0 :
	%>
				<td><a href="shoesInfo.jsp?day=<%=i %>"> <%=i %> </a></td>
	<%			
				break;
			case 6 :
	%>
				<td><a href="shoesInfo.jsp?day=<%=i %>"> <%=i %> </a></td>
	<%
				break;
			default :
	%>
				<td><a href="shoesInfo.jsp?day=<%=i %>"> <%=i %> </a></td>
	<%
				break;
		}
		if(Calendar.weekDay(year, month, i) == 6 && i != Calendar.lastDay(year, month)){
			out.println("</tr><tr>");			
		}
			}
			if(Calendar.weekDay(year, month, Calendar.lastDay(year, month)) !=6){
		for(int i = Calendar.weekDay(year, month, Calendar.lastDay(year, month))+1; i < 7; i++){
			out.println("<td></td>");	
		}
			}
	%>
	</tr>
	
</table>
<%
	if(userID.equals("root")){ 
%>
	<div class="container">
		<div class="jumbotron">
			<form action="shoesInsertAction.jsp" method="post" name="frm" enctype="multipart/form-data">
			<div>
				<input type="text" placeholder="날짜" name="day">
			</div>
			<div>
				<input type="text" placeholder="신발 이름" name="name">
			</div>
			<div>
				<input type="text" placeholder="가격" name="price">
			</div>
			<div>
				<input type="text" placeholder="사이트" name="site" style="ime-mode:disable"> <!-- 영어로만 입력 -->
			</div>
			<div>
				<input type="radio" name="method" value="선착순"/>선착순<br>
				<input type="radio" name="method" value="응모"/>응모<br>
				<input type="file" name="image">
			</div>
			<input type="button" class="btn btn-primary pull-right" onclick="location.href='sdeleteAction.jsp'"value="정리">
			<input type="submit" class="btn btn-primary pull-right" value="추가">
			
		</form>
		</div>
	</div>
<%
	 } 
%>
	<hr>
	<jsp:include page="/footer.jsp"/>
	<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>