<%@page import="board.BoardDTO"%>
<%@page import="user.UserDAO"%>
<%@page import="user.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String user_id = request.getParameter("user_id");	
	String user_pw = request.getParameter("user_pw");	
	String title = request.getParameter("title");
	String user_name = request.getParameter("user_name");
	String regdate = request.getParameter("regdate");
	String user_email = request.getParameter("content");

	BoardDTO boardDTO = new BoardDTO();
	boardDTO.setUser_id(user_id);
	UserDTO userDTO = new UserDTO();
	userDTO.setUser_id(user_id);

	UserDAO userDAO = UserDAO.getInstance();
	int result = userDAO.loginCheck(user_id,user_pw);
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
<%		if(boardDTO != null) { %>
<table border="1">
	<caption>글 상세보기</caption>
<tr>
	<th>제목</th>
	<td><%=boardDTO.getTitle() %></td>
</tr>
<tr>
	<th>작성자</th>
	<td><%=userDTO.getUser_name() %></td>
</tr>
<tr>
	<th>작성일</th>
	<td><%=boardDTO.getRegdate() %></td>
</tr>
<tr>
	<th>내용</th>
	<td><%=boardDTO.getContent() %></td>
</tr>
</table><br/>
<a href="bbs.jsp">목록</a>
<a href="update.jsp?no=<%=boardDTO.getUser_id()%>">수정</a>
<a href="delete.jsp?no=<%=boardDTO.getUser_id()%>">삭제</a>
<%		} %>
</body>
</html>