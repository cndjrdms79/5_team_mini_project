<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
      }
</style>
<title>메인화면</title>
</head>
<body>

<%
		String user_name = (String)session.getAttribute("user_name");
		String user_id = (String)session.getAttribute("user_id");
%>

<% if(user_id != null){ %>
	<script type="text/javascript">
		alert('<%=user_name + "(" + user_id +") 님이 로그인 하셨습니다."%>');
	</script>
	
	main 입니다... <br/>	
	<a href="logout.jsp">로그아웃</a>
	 
<% } else { %>
<script type="text/javascript">
	alert('먼저 로그인을 하셔야합니다.');
	location.href='login.jsp';
</script>
<% } %>

</body>
</html>