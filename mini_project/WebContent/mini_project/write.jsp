<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String user_id = (String)session.getAttribute("user_id");
%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon"type="image/png" href="/favicon.png">
<title>글쓰기</title>
	<!-- Required meta tags -->
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">

<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="style.css">
<style type="text/css">
body {
	font-family: 'Nanum Pen Script', cursive;
	font-size: 25px;

/*  	margin: 0;  */
	margin-left: auto;
	margin-right: auto;
	text-align: center;
}

.nav-container {
	display: flex;
	flex-direction: row;
	width: 100%;
	margin: 0;
	padding: 0;
	background-color: lightseagreen;
	list-style-type: none;
}

.nav-item {
	padding: 15px;
	cursor: pointer;
}

.nav-item a {
	text-align: center;
	test-decoration: none;
	color: white;
	padding: 15px;
}

.nav-item:nth-child(1) {
	background-color: skyblue;
}

.nav-item:hover {
	background-color: grey;
}
</style>
</head>
<body>
	<h1>
		<b>인공지능 AI</b>
	</h1>
	<nav>
		<ul class="nav-container">
			<li class="nav-item"><a href="main.jsp">출결관리 웹페이지</a></li>
			<li class="nav-item"><a href="calendar.jsp">달력</a></li>
			<li class="nav-item"><a href="bbs.jsp">게시판</a></li>
			<% if(user_id != null){ %>
			<li class="nav-item"><a href="logout.jsp">로그아웃</a></li>

			<%} else {%>
			<li class="nav-item"><a href="login.jsp">접속하기</a></li>
		</ul>
		<%  }  %>
	</nav><br/>

	<div class="container">
		<div class="row">
			<form action="write_action.jsp" method="post">
				<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<td colspan="2" style="background-color: #eeeeee; text-align: center; ">게시판 글쓰기 화면</td>
					</tr>
				</thead>
				<tbody>	
					<tr>
						<th>제목</th>
						<td><input type="text" class="form-control" placeholder="글 제목" name="title" maxlength="50" required="required" /></td>
					</tr>
					<tr>
						<th>내용</th>
						<td><textarea class="form-control" placeholder="글 내용" maxlength="2048" name="content"
								required="required" style="height: 350px; width: 1050px;"></textarea></td>
					</tr>
				</tbody>
				</table>
				<div align="right"><input type="submit" class="btn btn-info pull-right" value="글쓰기"></div>
					
			</form>
		</div>
	</div>
</body>
</html>