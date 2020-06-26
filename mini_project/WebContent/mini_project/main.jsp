<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String user_id = (String)session.getAttribute("user_id");
	String user_name = (String)session.getAttribute("user_name");
%>
<%@ include file = "../commons/header.jsp" %>
	<br/><br/>
	<body class="text-center">
	<div class="cover-container d-flex w-100 h-100 p-3 mx-auto flex-column">
	  <main role="main" class="inner cover">
	    <h1 class="cover-heading">ANU Machine Learning</h1><br/><br/>
	    <p class="lead">이 웹 사이트는 인공지능 개발자 양성과정 전용 웹사이트며<br/> 교육생 출결관리 및 정보공유 사이트 입니다.<br/>
			회원가입, 로그인, 게시판, 출결관리 등의 기능이 있습니다.<br/> 많은 이용 부탁드립니다.</p><br/>
	    <p class="lead">
	      <a href="login.jsp" class="btn btn-lg btn-dark">Start</a>
	    </p>
	
	  </main>
	</div>
<%@ include file="../commons/footer.jsp" %>
</body>
</html>    