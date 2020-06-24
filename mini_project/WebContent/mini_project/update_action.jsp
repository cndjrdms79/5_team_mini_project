<%@page import="board.BoardDAO"%>
<%@page import="board.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String user_id = (String)session.getAttribute("user_id");

	long no = Long.parseLong(request.getParameter("no"));
	String title  = request.getParameter("title");
	String content= request.getParameter("content");
	
	BoardDTO boardDTO = new BoardDTO();
	boardDTO.setNo(no);
	boardDTO.setTitle(title);
	boardDTO.setContent(content);
	
	BoardDAO boardDAO = BoardDAO.getInstance();
	boolean result = boardDAO.updateBoard(boardDTO);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" type="image/png" href="/favicon.png">
<title>게시글 수정</title>
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
alert('글이 수정되었습니다.');
location.href='view.jsp?no=<%=no%>';
<% } else      { %>
alert('응 안돼 돌아가');
location.href='javascript:history.back();';
<% }             %>
</script>
</body>
</html>