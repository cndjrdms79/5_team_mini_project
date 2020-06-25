<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   String user_id2 = (String)session.getAttribute("user_id");
%>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.6/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>
<body>
<!-- 홈,게시판 접근 -->
<nav class="navbar navbar-expand-xl navbar-dark bg-dark">
  <a class="navbar-brand" href="main.jsp">인공지능 AI</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExample06" aria-controls="navbarsExample06" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarsExample06">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="calender.jsp"> 달력 <span class="sr-only">(current)</span></a>
      </li>
       <li class="nav-item active">
        <a class="nav-link" href="bbs.jsp"> 게시판 <span class="sr-only">(current)</span></a>
      </li>
	  <li class="nav-item dropdown">
       <a class="nav-link dropdown-toggle" href="#" id="dropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Dropdown</a>
        <div class="dropdown-menu" aria-labelledby="dropdown">
          <a class="dropdown-item" href="bbs.jsp">게시판1</a>
          <a class="dropdown-item" href="bbs.jsp">게시판2</a>
          <a class="dropdown-item" href="bbs.jsp">게시판3</a>
        </div>
      </li>
      <li class="nav-item active">
        <a class="nav-link" href="logout.jsp"> 임시로그아웃 <span class="sr-only">(current)</span></a>
      </li>
<!-- 로그인, 회원가입 -->
	<li>
	      <form class="form-inline my-2 my-lg-0">
	     	  <input type="submit" class="btn btn-secondary " value="로그인" onclick="location.href='login_action.jsp'">
			  <input type="button" class="btn btn-secondary " value="회원가입" onclick="location.href='join.jsp'"/>
	   	  </form>
   	  </li>	
        <a class="nav-link" href="calendar.jsp"> 달력 <span class="sr-only">(current)</span></a>
      </li>
       <li class="nav-item active">
        <a class="nav-link" href="bbs.jsp"> 게시판 <span class="sr-only">(current)</span></a>
      </li>
     <li class="nav-item dropdown">
       <a class="nav-link dropdown-toggle" href="#" id="dropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Dropdown</a>
        <div class="dropdown-menu" aria-labelledby="dropdown">
          <a class="dropdown-item" href="bbs.jsp">게시판1</a>
          <a class="dropdown-item" href="bbs.jsp">게시판2</a>
          <a class="dropdown-item" href="bbs.jsp">게시판3</a>
        </div>
      </li>
      <li class="nav-item active">
        <a class="nav-link" href="logout.jsp"> 임시로그아웃 <span class="sr-only">(current)</span></a>
      </li>
<!-- 로그인, 회원가입 -->
   <li>
         <form class="form-inline my-2 my-lg-0">
             <input type="submit" class="btn btn-secondary " value="로그인" onclick="location.href='login_action.jsp'">
           <input type="button" class="btn btn-secondary " value="회원가입" onclick="location.href='join.jsp'"/>
           </form>
        </li>
    </ul>
  </div>
</nav>