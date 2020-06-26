<%@page import="util.Cookies"%>
<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../commons/header.jsp" %> 

<%
	// cookies class를 만들어두고 불러와 사용! src 파일 참고
	String user_id="";
	Cookies cookies = new Cookies(request);
	if(cookies.exists("user_id")){
		user_id = cookies.getValue("user_id");
	}
%>
<br/><br/><br/>
<div align="center">
<form action="login_action.jsp" method="post">
<table>

<!-- required: 무조건 입력되어야 실행가능, autofocus: 화면시작시 커서위치 -->

<tr>
	<td>아이디</td>
	<td><input type = "text" name ="user_id" value="<%=user_id %>"
		       autofocus="autofocus" required="required" placeholder="ID" maxlength="20"/></td>  
</tr>

<tr>
	<td>비밀번호</td>
	<td><input type = "password" name ="user_pw" required="required" placeholder="Password"/ maxlength="20"></td>
</tr>

<tr>
	<th> </th>
	<td>
	<input type="checkbox" name ="save_id" <%if(!user_id.equals("")){ %>
													checked="checked" 
												 <% } %> />아이디저장<br/><br/>
	<input type="submit" class="btn btn-dark" value="로그인" />
	<input type="button" class="btn btn-dark" value="회원가입" onclick="location.href='join.jsp'" />
    </td>
</tr>
</table>
</form>
</div>
</body>
</html>