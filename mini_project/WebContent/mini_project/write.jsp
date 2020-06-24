<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../commons/header.jsp" %> 
<!DOCTYPE html>
<html>
<body>
	<div class="container">
		<div class="row">
			<form action="write_action.jsp" method="post">
				<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<td colspan="2" style="background-color: #eeeeee; text-align: center; ">게시판 글쓰기 화면</td>
					</tr>
				</thead>
				<tbody>	
					<tr>
						<th>제목</th>
						<td><input type="text" class="form-control" placeholder="글 제목" name="title" maxlength="50" required="required" /></td>
					</tr>
					<tr>
						<th>내용</th>
						<td><textarea class="form-control" placeholder="글 내용" maxlength="2048" name="content"
								required="required" style="height: 350px; width: 1050px;"></textarea></td>
					</tr>
				</tbody>
				</table>
				<div align="right"><input type="submit" class="btn btn-info pull-right" value="글쓰기"></div>
					
			</form>
		</div>
	</div>
</body>
</html>