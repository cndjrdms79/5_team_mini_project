<%@page import="board.BoardDTO"%>
<%@page import="java.util.List"%>
<%@page import="board.BoardDAO"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../commons/header.jsp" %> 
<%
	BoardDAO boardDAO = BoardDAO.getInstance();
	List<BoardDTO> list = boardDAO.board_selete();
	
%>
<br/><br/>
	<div class="container">
		<div class="row">
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd ">
				<thead>
					<tr>
						<th style="text-align: center">번호</th>
						<th style="text-align: center">제목</th>
						<th style="text-align: center">작성자</th>
						<th style="text-align: center">날짜</th>
					</tr>
				</thead>
				<tbody>
					<% for (BoardDTO boardDTO : list) { %>
					<tr>
						<td><%=boardDTO.getNo()%></td>
						<td><a href="view.jsp?no=<%=boardDTO.getNo()%>"><%=boardDTO.getTitle()%></a></td>
						<td><%=boardDTO.getUser_id()%></td>
						<td><%=boardDTO.getRegdate()%></td>
					</tr>
					<% } %>
				</tbody>
			</table>
			<br />
		
			<a href="write.jsp" class="btn btn-dark"><span style="color: white;">글쓰기</span></a><br />
			
		</div>
	</div>
</body>
</html>