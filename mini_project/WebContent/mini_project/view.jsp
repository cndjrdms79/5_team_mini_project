<%@page import="java.io.File"%>
<%@page import="java.util.List"%>
<%@page import="board.BoardDAO"%>
<%@page import="board.BoardDTO"%>
<%@page import="user.UserDAO"%>
<%@page import="user.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%	request.setCharacterEncoding("utf-8"); // 인코딩 타입 설정 %>
<%  // upload.jsp(hidden)로 부터 넘어온 값들을 구함

   long no = Long.parseLong(request.getParameter("no"));
   String user_id = (String)session.getAttribute("user_id");

   BoardDAO boardDAO = BoardDAO.getInstance();
   BoardDTO boardDTO = boardDAO.getView(no);
   
   
   String fileName = request.getParameter("fileName");
   String orgfileName = request.getParameter("orgfileName");
%>
<%@ include file = "../commons/header.jsp" %>

<br/><br/>
	<%
		if (boardDTO != null) {
	%>
	<div class="container">
		<div class="row">
			<table class="table table-striped table-dark"  style="text-align: center;">
				<thead>
					<tr>
						<th colspan="3" style="background-color: #343a40; text-align: center;"> 게시글 상세보기 </th>
					</tr>
				</thead>
				
				<!-- 글 상세보기 리스트! -->
				<tbody>
					<tr>
						<th style="width: 20%;">글 제목</th>
						<td colspan="2" style="text-align: left;"><%=boardDTO.getTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %></td>
					</tr>
					<tr>
						<th>작성자</th>
						<td colspan="2" style="text-align: left;"><%=boardDTO.getUser_id()%></td>
					</tr>
					<tr>
						<th>작성일</th>
						<td colspan="2" style="text-align: left;"><%=boardDTO.getRegdate() %></td>
					</tr>
					<tr>
						<th>내용</th>
						<td colspan="2" style= "min-height: 200px; text-align: left;"><%=boardDTO.getContent()%></td>
					</tr>
					<!-- download.jsp 파일로 저장된 파일의 이름을 넘겨줌 -->
					<%if(boardDTO.getFile_name() != null)  {%>
					<tr> 
						<th>파일</th>
						<td colspan="2" style="text-align: left;"><a href="download.jsp?fileName=<%=boardDTO.getFile_name()%>"><%=boardDTO.getFile_name() %><br>
						<% String contentType = boardDTO.getContent_type().substring(0,boardDTO.getContent_type().indexOf("/")); %>
						<% if (contentType.equals("image")) { %>
							<img src="download.jsp?fileName=<%=boardDTO.getFile_name()%>" style="max-width: 100%; height: auto;" />
						<% } else if (contentType.equals("audio")) { %>
							<audio controls autoplay>
							 <source src="download.jsp?fileName=<%=boardDTO.getFile_name()%>" type="audio/mpeg">
							Your browser does not support the audio element.
							</audio>
						<% }  %>
						
						
						</td>
					</tr>
					<% } %>
			</tbody>
		</table>
		
		<br /> <a href="bbs.jsp" class="btn btn-dark"><span style="color: white;">목록</span></a>
		<% if (user_id != null && user_id.equals(boardDTO.getUser_id())) { %>
			<a href="update.jsp?no=<%=boardDTO.getNo()%>" class="btn btn-dark"><span style="color: white;">수정</span></a> 
			<a onclick="return confirm('정말로 삭제하시겠습니까?')" href="delete_action.jsp?no=<%=boardDTO.getNo()%>" class="btn btn-dark"><span style="color: white;">삭제</span></a>
		<%
			}
		}
		%>
	</div>
</div>
<br/><br/><br/>
<!-- 댓글기능! -->
	<div class="container" id="disqus_thread"></div>
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