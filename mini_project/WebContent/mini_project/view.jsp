<%@page import="java.util.List"%>
<%@page import="board.BoardDAO"%>
<%@page import="board.BoardDTO"%>
<%@page import="user.UserDAO"%>
<%@page import="user.UserDTO"%>
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
<%	if(boardDTO != null) { %>
<div align="center">
<table border="1">
	<caption>글 상세보기</caption>
<tr>
	<th>제목</th>
	<td><%=boardDTO.getTitle() %></td>
</tr>
<tr>
	<th>작성자</th>
	<td><%=boardDTO.getUser_id() %></td>
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
</div>
</body>
</html>