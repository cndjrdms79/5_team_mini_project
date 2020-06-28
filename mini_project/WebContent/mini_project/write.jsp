<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../commons/header.jsp" %>
 
<script type="text/javascript" src="../se2/js/HuskyEZCreator.js" charset="utf-8"></script>
<br/>

	<div class="container">
		<div class="row">
			<form name="write_form" action="write_action.jsp" method="post">
				<table class="table table-striped table-dark"  style="text-align: center;">
				<thead>
					<tr>
						<td colspan="2" style="background-color: #343a40; text-align: center;">게시판 글쓰기 화면</td>
					</tr>
				</thead>
				<tbody style="background-color: #ffffff;">	
					<tr style="background-color: white;">
						<th><span span style="color:black" >제목</span></th>
						<td><input type="text" class="form-control" placeholder="글 제목" name="title" maxlength="50" required="required" /></td>
					</tr>
					<tr>
						<th width="100">내용</th>
						<td width="1100"><textarea class="form-control" placeholder="글 내용" name="content" id="content"
								required="required" style="height: 350px; width: 1000px;"></textarea>
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
					<tr style="background-color: #343a40;">
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
				
				<div align="right"><button type="button" onclick="goaction()" class="btn btn-dark">글쓰기</button></div>
					
			</form>
		</div>
	</div>
</body>
</html>