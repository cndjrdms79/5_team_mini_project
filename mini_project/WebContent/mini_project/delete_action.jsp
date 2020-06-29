<%@page import="java.io.IOException"%>
<%@page import="java.io.File"%>
<%@page import="board.BoardDAO"%>
<%@page import="board.BoardDTO"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String user_id = (String)session.getAttribute("user_id");
	long no = Long.parseLong(request.getParameter("no"));
	
	BoardDTO boardDTO = new BoardDTO();
	boardDTO.setNo(no);
	boardDTO.setUser_id(user_id);
	
	
	
	BoardDAO boardDAO = BoardDAO.getInstance();
	String fileName = boardDAO.getView(no).getFile_name();
	
	try {
		File file = new File("C:/dev64/upload/" + fileName);
		file.delete();
	} catch(Exception e) {}
	
	boolean result = boardDAO.deleteBoard(boardDTO);
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
<script type="text/javascript">
<% if(result) { %>
	alert('<%=no%>번 게시물이 삭제되었습니다.');
	location.href='bbs.jsp?no=<%=no%>';
<% } else	  { %>
	alert('게시물 삭제 권한이 없습니다');
	location.href='bbs.jsp';
<% }	%>
</script>
</body>
</html>