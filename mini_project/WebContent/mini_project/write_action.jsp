<%@page import="board.BoardDAO"%>
<%@page import="board.BoardDTO"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String user_id = (String)session.getAttribute("user_id");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	
	BoardDTO boardDTO = new BoardDTO();
	boardDTO.setUser_id(user_id);
	boardDTO.setTitle(title);
	boardDTO.setContent(content);
	
	BoardDAO boardDAO = BoardDAO.getInstance();
	boolean result = boardDAO.writeBoard(boardDTO);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon"type="image/png" href="/favicon.png">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&display=swap" rel="stylesheet">
<style type="text/css">
body {
		font-family: 'Nanum Pen Script', cursive;
		font-size:25px;
	 }
</style>
</head>
<body>


<% if(user_id == null) {%>
	<script type="text/javascript">
	alert('먼저 로그인 해주세요.');
	location.href='login.jsp';
	</script>
<% } %>

<!-- 문제 1 -->
<% if (result == false) { %>
	<script type="text/javascript">
	alert('글쓰기에 실패했습니다');
	location.href='javascript:history.back()';
	</script> 
<% } else { %>
	<script type="text/javascript">
	alert('글쓰기 성공!')
	location.href='bbs.jsp';
	</script>
<% } %>

</body>
</html>