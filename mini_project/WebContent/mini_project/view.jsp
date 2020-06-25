<%@page import="java.util.List"%>
<%@page import="board.BoardDAO"%>
<%@page import="board.BoardDTO"%>
<%@page import="user.UserDAO"%>
<%@page import="user.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
   long no = Long.parseLong(request.getParameter("no"));
   String user_id = (String)session.getAttribute("user_id");

   BoardDAO boardDAO = BoardDAO.getInstance();
   BoardDTO boardDTO = boardDAO.getView(no);
%>
<%@ include file = "../commons/header.jsp" %>

<br/>
<h2 align="center">글 상세보기</h2>
<body>
	<%
		if (boardDTO != null) {
	%>
	<div align="center">
		<table class="table table-table-striped" border="1" style="text-align: center">
			<tr>
				<th style="text-align: center">제목 <%=boardDTO.getTitle()%></th>
			</tr>
			<tr>
				<th style="text-align: right">작성자/<%=boardDTO.getUser_id()%>&nbsp; 작성일/<%=boardDTO.getRegdate()%></th>
			</tr>
			<tr>
				<td>내용</td>
			</tr>
			<tr>
				<td><%=boardDTO.getContent()%></td>
			</tr>
		</table>
		
		<br /> <a href="bbs.jsp" class="btn btn-info pull-right"><span style="color: white;">목록</span></a>
		<% if (user_id != null && user_id.equals(boardDTO.getUser_id())) { %>
			<a href="update.jsp?no=<%=boardDTO.getNo()%>" class="btn btn-info pull-right"><span style="color: white;">수정</span></a> 
			<a onclick="return confirm('정말로 삭제하시겠습니까?')" href="delete_action.jsp?no=<%=boardDTO.getNo()%>" class="btn btn-info pull-right"><span style="color: white;">삭제</span></a>
		<%
			}
		}
		%>
	</div>


<!-- 댓글기능! -->
	<div id="disqus_thread"></div>
	<script>
		(function() { // DON'T EDIT BELOW THIS LINE
			var d = document, s = d.createElement('script');
			s.src = 'https://dumptruck-5.disqus.com/embed.js';
			s.setAttribute('data-timestamp', +new Date());
			(d.head || d.body).appendChild(s);
		})();
	</script>
	<noscript>
		Please enable JavaScript to view the <a
			href="https://disqus.com/?ref_noscript">comments powered byDisqus.</a>
	</noscript>

</body>
</html>