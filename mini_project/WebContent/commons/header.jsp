<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String user_id2 = (String)session.getAttribute("user_id");
%>
<!-- jQuery -->
<!-- <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
 -->
 <%-- <script src="${pageContext.request.contextPath}/resources/common/js/jquery-3.3.1.min.js" ></script> --%>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
<!-- Bootstrap theme -->
<%-- <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap-theme.min.css"> --%>
<!-- common CSS -->
<link rel="stylesheet" href="<c:url value='/resources/common/css/common.css'/>" >

<nav class="navbar navbar-expand-xl navbar-dark bg-dark">
  <a class="navbar-brand" href="#">인공지능 AI</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExample06" aria-controls="navbarsExample06" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarsExample06">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="main.jsp"> Home <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="calender.jsp">달력</a>
      
      <li class="nav-item">
        <a class="nav-link" href="bbs.jsp">게시판</a>  
      
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="dropdown06" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Dropdown</a>
        <div class="dropdown-menu" aria-labelledby="dropdown06">
          <a class="dropdown-item" href="bbs.jsp">Action</a>
          <a class="dropdown-item" href="bbs.jsp">Another action</a>
          <a class="dropdown-item" href="bbs.jsp">Something else here</a>
        </div>
      </li>
    </ul>
    <form class="form-inline my-2 my-md-0">	
      <input class="form-control" type="text" placeholder="Search">
    </form>
  </div>
</nav>