<%@page import="user.UserDAO"%>
<%@page import="user.UserDTO"%>
<%@page import="board.BoardDAO"%>
<%@page import="board.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	long no = Long.parseLong(request.getParameter("no"));
	String user_id = request.getParameter("user_id");	
	String user_pw = request.getParameter("user_pw");
	String title  = request.getParameter("title");
	String content= request.getParameter("content");
	
	BoardDTO boardDTO = new BoardDTO();
	boardDTO.setTitle(title);
	boardDTO.setContent(content);
	UserDTO userDTO = new UserDTO();
	userDTO.setUser_id(user_id);
	userDTO.setUser_pw(user_pw);
	
	UserDAO userDAO = UserDAO.getInstance();
	boolean result = userDAO.join(userDTO);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" type="image/png" href="/favicon.png">
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
<script type="text/javascript">
<% if (result) { %>
alert('<%=no%>번 글이 수정되었습니다.');
location.href='view.jsp?no=<%=no%>';
<% }%>
</script>
</body>
</html>