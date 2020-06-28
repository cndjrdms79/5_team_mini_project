<%@page import="user.UserDAO"%>
<%@page import="user.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String user_id = (String)session.getAttribute("user_id");
	String user_name = (String)session.getAttribute("user_name");
// 	String user_pw = request.getParameter("user_pw");
	
	UserDTO userDTO = new UserDTO();
	userDTO.setUser_id(user_id);
// 	userDTO.setUser_pw(user_pw);
	
	UserDAO userDAO = UserDAO.getInstance();
	boolean result = userDAO.deleteUser(userDTO);
%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" type="image/png" href="/favicon.png">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&display=swap" rel="stylesheet">
<style type="text/css">
	 body {
        font-family: 'Nanum Pen Script', cursive;
        font-size: 25px;
      }
</style>
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
<% 
if(result){
	session.invalidate(); // 세션을 날림
%>
	alert('<%= user_id + "(" + user_name + ")님이 정상적으로 회원탈퇴가 되었습니다. 이용해주셔서 감사합니다!" %>');
	location.href='main.jsp';
<% } else { %>
	alert('회원탈퇴에 실패했습니다.');
	location.href='javascript:history.back()';
<% } %>
</script>
</body>
</html>