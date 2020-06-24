<%@page import="board.BoardDTO"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String user_id = (String)session.getAttribute("user_id");
	
	long no = Long.parseLong(request.getParameter("no"));
	BoardDAO boardDAO = BoardDAO.getInstance();	
	BoardDTO boardDTO = boardDAO.getView(no);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" type="image/png" href="/favicon.png">
<title>게시물 수정</title>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&display=swap" rel="stylesheet">
<style type="text/css">
body {
		font-family: 'Nanum Pen Script', cursive;
		font-size:25px;
     }
</style>
</head>
<body>
<form action="update_action.jsp" method="post">
<table>
<caption>게시물 수정</caption>
<tr>
	<th>글번호</th>
	<td><%=boardDTO.getNo() %>
		<input type="hidden" name="no" 
		value="<%=boardDTO.getNo() %>" /></td>
</tr>
<tr>
	<th>제목</th>
	<td><input type="text" name="title" 
		value="<%=boardDTO.getTitle() %>"  required="required"/></td>
</tr>
<tr>
	<th>내용</th>
	<td><textarea rows="8" cols="60" name="content"  required="required"><%=boardDTO.getContent() %></textarea></td>
</tr>
<tr>
	<th></th>
	<td>
		<button type="submit">완료</button>
		<button type="reset">초기화</button>
	</td>
</tr>
</table>
</body>
</html>