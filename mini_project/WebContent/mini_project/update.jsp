<%@page import="board.BoardDTO"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../commons/header.jsp" %> 
<%	
	long no = Long.parseLong(request.getParameter("no"));
	BoardDAO boardDAO = BoardDAO.getInstance();	
	BoardDTO boardDTO = boardDAO.getView(no);
	String fileName = request.getParameter("fileName");
	String orgfileName = request.getParameter("orgfileName");
%>

<br><h2>게시글수정 화면</h2><br/>
<body>
<div align="center">
<form action="update_action.jsp" method="post">
<table>
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
	<th>파일</th>
	<td>	<!-- download.jsp 파일로 저장된 파일의 이름을 넘겨줌 -->
		<a href="download.jsp?fileName=<%=fileName%>"><%=orgfileName %></a><br></td>
</tr>
<tr>
	<th></th>
	<td>
		<button type="submit">완료</button>
		<button type="reset">초기화</button>
	</td>
</tr>
</table>
</form>
</div>
</body>
</html>