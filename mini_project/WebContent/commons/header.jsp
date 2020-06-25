<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String user_id2 = (String)session.getAttribute("user_id");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" type="image/png" href="/favicon.png">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&display=swap" rel="stylesheet">

<!-- Required meta tags -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
	integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
	crossorigin="anonymous">
	
<style type="text/css">
body {
   font-family: 'Nanum Pen Script', cursive;
   font-size: 25px;

/*     margin: 0;  */
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
<title>인공지능 AI</title>
</head>
<body>

<h1 align="center"><b>인공지능 AI</b></h1>
   <nav>
      <ul class="nav-container">
         <li class="nav-item"><a href="main.jsp">출결관리 웹페이지</a></li>
         <li class="nav-item"><a href="calendar.jsp">달력</a></li>
         <li class="nav-item"><a href="bbs.jsp">게시판</a></li>
   <% if(user_id2 != null){ %>
         <li class="nav-item"><a href="logout.jsp">로그아웃</a></li> 
   <%} else {%>
         <li class="nav-item"><a href="login.jsp">접속하기</a></li>
      </ul>
   <%  }   %>
   </nav><br/>