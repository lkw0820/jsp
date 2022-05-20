<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;" charset="UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<title>Insert title here</title>
</head>
<script type="text/javascript"> /* db에서 오류생기는 것보다 여기서 오류를 잡아준다 */
	function check(){
		if(!frm.anonymous.value){
			alert("익명 유무 선택");
			return false;
		}
		if(!frm.bbsTitle.value){
			alert("제목을 입력하세요");
			return false;
		}
		if(!frm.bbsContent.value){
			alert("내용을 입력하세요");
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
				script.println("alert('로그인 필요')");
				script.println("location.href = 'login.jsp");
				script.println("</script>");
		}
	%>
	<jsp:include page="header.jsp"/>
	<div class="container">
		<div class="row">
			<form action="writeAction.jsp" method="post" name="frm" onsubmit="return check()" enctype="multipart/form-data">
				<table class="table table-striped" style="text-align: center; border:1px solid #dddddd">
					<thead>
						<tr>
							<th colspan="2" style="background-color: #eeeeee; text-align:center;">게시판 글쓰기</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><input type="text" class="form-control" placeholder="글 제목" name="bbsTitle" maxlength="50"></td>
						</tr>
						<tr>
							<td style="text-align: left;">
								<input type="radio" name="anonymous" value="false"/>실명<br>
								<input type="radio" name="anonymous" value="true"/>익명<br>
								<input type="file" name="image">
							</td>
						</tr>
						<tr>
							<td><textarea class="form-control" placeholder="글 내용" name="bbsContent" maxlength="2048" style="height: 350px"></textarea></td>
						</tr>
					</tbody>
				</table>
				<input type="submit" class="btn btn-primary pull-right" value="글쓰기">
			</form>
			
		</div>
	</div>
	<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
	
	<hr>
	<jsp:include page="/footer.jsp"/>

</body>
</html>