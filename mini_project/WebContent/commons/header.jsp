<%@page import="user.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String user_id2 = (String)session.getAttribute("user_id");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.6/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>

<link rel="stylesheet" type="text/css" href="main.css">
<style>
body{
		background-image: url('http://getwallpapers.com/wallpaper/full/a/5/d/544750.jpg');
		background-size: cover;
		background-repeat: no-repeat;
		background-opacity: 0.9;
		height: 100%;
		color: white;
	}

</style>

<title>덤프트럭</title>
</head>
<body>
<!-- 홈,게시판 접근 -->
	<nav class="navbar navbar-expand-xl navbar-dark bg-dark">
		<a class="navbar-brand" href="main.jsp">인공지능 AI</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExample06" aria-controls="navbarsExample06" aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarsExample06">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item"><a class="nav-link" href="calendar.jsp"> 달력 <span class="sr-only">(current)</span></a></li>
				<li class="nav-item"><a class="nav-link" href="bbs.jsp">게시판 <span class="sr-only">(current)</span></a></li>
		    </ul>
		    
         	<ul class="navbar-nav ml-auto">
				<!-- 로그인, 회원가입 -->
				<%if(user_id2 == null){ %>
				<li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="#" id="dropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">접속하기</a>
					<div class="dropdown-menu" aria-labelledby="dropdown">
						<a class="dropdown-item " href="login.jsp">로그인</a> 
						<a class="dropdown-item" href="join.jsp">회원가입</a> 
					</div>
					</li>
				<%} else{ %>
				<li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="#" id="dropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">회원관리</a>
					<div class="dropdown-menu" aria-labelledby="dropdown">
						<a class="dropdown-item" href="logout.jsp">로그아웃</a>
						<a class="dropdown-item" href="user_info.jsp?user_id=<%=user_id2%>">회원정보</a>
					</div>
					</li>
				<%} %>
			</ul>
		</div>
	</nav>