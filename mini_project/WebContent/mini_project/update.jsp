<%@page import="board.BoardDTO"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../commons/header.jsp" %> 
<script type="text/javascript" src="../se2/js/HuskyEZCreator.js" charset="utf-8"></script>
<%	
	long no = Long.parseLong(request.getParameter("no"));
	BoardDAO boardDAO = BoardDAO.getInstance();	
	BoardDTO boardDTO = boardDAO.getView(no);
	
	
	String fileName = request.getParameter("fileName");
	String orgfileName = request.getParameter("orgfileName");
%>
<br/><br/>
	<div class="container">
		<div class="row">
			<form action="update_action.jsp" name="write_form" method="post">
				<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<td colspan="2" style="background-color: #eeeeee; text-align: center; ">게시글 수정 화면</td>
					</tr>
				</thead>
				<tbody>	
					<tr>
						<th>제목</th>
						<td>
							<input type="text" class="form-control" placeholder="글 제목" name="title" value="<%=boardDTO.getTitle() %>" maxlength="50" required="required" />
							<input type="hidden" name="no" value="<%=boardDTO.getNo() %>" />
						</td>
					</tr>
					<tr>
						<th width="100">내용</th>
						<td width="1100"><textarea class="form-control" placeholder="글 내용" name="content" id="content"
								required="required" style="height: 350px; width: 1000px;"><%=boardDTO.getContent() %></textarea>
								<script type="text/javascript">
									var oEditors = [];
									nhn.husky.EZCreator.createInIFrame({
										oAppRef : oEditors,
										elPlaceHolder : "content",
										sSkinURI : "../se2/SmartEditor2Skin.html",
										fCreator : "createSEditor2"
									});
								</script>
						</td>
					</tr>
				
					<tr>
						<th>파일</th>  
						<td><input type="file" name="file1"></td>
					</tr>
								
				</tbody>
				</table>
				
				<script type="text/javascript">
				 function goaction(){
					 oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);
					 document.write_form.submit();
				 }
				</script>
				
				<div align="right">
					<button type="reset" class="btn btn-info">초기화</button>
					<button type="button" onclick="goaction()" class="btn btn-info">글수정</button>
				</div>
					
			</form>
		</div>
	</div>
</body>
</html>