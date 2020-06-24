<%@page import="board.BoardDAO"%>
<%@page import="board.BoardDTO"%>
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
<link rel="icon"type="image/png" href="/favicon.png">
<title>게시물 삭제</title>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&display=swap" rel="stylesheet">
<style type="text/css">
body {
		font-family: 'Nanum Pen Script', cursive;
		font-size:25px;
	 }
</style>
</head>
<body>
<form action="delete_action.jsp" method="post">
<table>
	<caption>게시물 삭제</caption>
<tr>
	<th>글번호</th>
	<td><%=boardDTO.getNo() %>
		<input type="hidden" name="no"
		value="<%=boardDTO.getNo() %>" /></td>
</tr>
<tr>
	<th>제목</th>
	<td><%=boardDTO.getTitle() %>
		<input type="hidden" name="title"
		value="<%=boardDTO.getTitle()  %>" /></td>
</tr>
<tr>
	<th></th>
	<td>
		<button type="submit">완료</button>
		<button type="submit">초기화</button>
	</td>
</tr>
</table>
</form>
</body>
</html>