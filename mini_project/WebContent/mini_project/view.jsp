<%@page import="java.util.List"%>
<%@page import="board.BoardDAO"%>
<%@page import="board.BoardDTO"%>
<%@page import="user.UserDAO"%>
<%@page import="user.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../commons/header.jsp" %>
<%
	long no = Long.parseLong(request.getParameter("no"));
	String user_id = (String)session.getAttribute("user_id");

	BoardDAO boardDAO = BoardDAO.getInstance();
	BoardDTO boardDTO = boardDAO.getView(no);

%>    

<br><h2>상세보기 화면</h2><br/>
<body>
<%	if(boardDTO != null) { %>
<div align="center">
<table border="1">
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

<% if(user_id != null && user_id.equals(boardDTO.getUser_id())){ %>
<a href="update.jsp?no=<%=boardDTO.getNo()%>">수정</a>
<a onclick="return confirm('정말로 삭제하시겠습니까?')" href="delete_action.jsp?no=<%=boardDTO.getNo()%>">삭제</a>
<%		
	}
}
%>
</div>
</body>
</html>