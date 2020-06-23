<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
		String user_id = (String)session.getAttribute("user_id");
%>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" type="image/png" href="/favicon.png">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&display=swap" rel="stylesheet">
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

.nav-item:nth-child(5) {
}

.nav-item:hover {
	background-color: grey;
}
</style>
<title>메인화면</title>
</head>
<body>

<h1><b>인공지능 AI</b></h1>
	<nav>
		<ul class="nav-container">
			<li class="nav-item"><a href="main.jsp">출결관리 웹페이지</a></li>
			<li class="nav-item"><a href="calendar.jsp">달력</a></li>
			<li class="nav-item"><a href="bbs.jsp">게시판</a></li>
	<% if(user_id != null){ %>
		<script type="text/javascript">
			alert('<%=user_id + " 님이 로그인 하셨습니다."%>');
		</script>
			<li class="nav-item"><a href="logout.jsp">로그아웃</a></li> 
	
	<%} else {%>
			<li class="nav-item"><a href="login.jsp">접속하기</a></li>
			
 			
		</ul>
	<%  }   %>
	</nav>

<h3><strong>ANU 인공지능</strong></h3>
	<p>
		이 웹 사이트는 스마트팩토리 인공지능 개발자 양성과정 전용 웹사이트며 교육생 출결관리 및 정보공유 사이트 입니다.<br/>
		기능으로는 회원가입, 로그인, 게시판, 출결관리 등이 있습니다. 많은 이용 부탁드립니다.
	</p>	




  
</body>
</html>