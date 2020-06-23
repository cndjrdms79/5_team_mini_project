<%@page import="util.Cookies"%>
<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	// cookies class를 만들어두고 불러와 사용! src 파일 참고
	String user_id="";
	Cookies cookies = new Cookies(request);
	if(cookies.exists("user_id")){
		user_id = cookies.getValue("user_id");
	}
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" type="image/png" href="/favicon.png">
<title>Login 화면</title>

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
	<h1><b>인공지능 AI</b></h1>
	<nav>
		<ul class="nav-container">
			<li class="nav-item"><a href="main.jsp">출결관리 웹페이지</a></li>
			<li class="nav-item"><a href="calendar.jsp">달력</a></li>
			<li class="nav-item"><a href="bbs.jsp">게시판</a></li>
			<li class="nav-item"><a href="login.jsp">접속하기</a></li>
		</ul>
	</nav>

<div align="center">
<form action="login_action.jsp" method="post">
<table>
	<caption><h3><b>로그인 화면</b></h3></caption>

<!-- required: 무조건 입력되어야 실행가능, autofocus: 화면시작시 커서위치 -->

<tr>
	<td>아이디</td>
	<td><input type = "text" name ="user_id" value="<%=user_id %>"
		       autofocus="autofocus" required="required" placeholder="ID" maxlength="20"/></td>  
</tr>

<tr>
	<td>비빌번호</td>
	<td><input type = "password" name ="user_pw" required="required" placeholder="Password"/ maxlength="20"></td>
</tr>

<tr>
	<th> </th>
	<td>
	<input type="submit" value="로그인" />
	<input type="button" value="회원가입" onclick="location.href='join.jsp'" />
	<input type="checkbox" name ="save_id" <%if(!user_id.equals("")){ %>
													checked="checked" 
												 <% } %> />아이디저장
												 
    </td>
</tr>
</table>
</form>
</div>
</body>
</html>