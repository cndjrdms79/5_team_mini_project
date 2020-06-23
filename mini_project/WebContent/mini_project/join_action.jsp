<%@page import="user.UserDAO"%>
<%@page import="user.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
	String user_id = request.getParameter("user_id");	
	String user_pw = request.getParameter("user_pw");	
	String user_name = request.getParameter("user_name");
	String user_birthdate = request.getParameter("user_birthdate");
	String user_gender = request.getParameter("user_gender");
	String user_email = request.getParameter("user_email");
	String user_phone = request.getParameter("user_phone");
	String user_addr = request.getParameter("user_addr");
	
	UserDTO userDTO = new UserDTO();
	userDTO.setUser_id(user_id);
	userDTO.setUser_pw(user_pw);
	userDTO.setUser_name(user_name);
	userDTO.setUser_birthdate(user_birthdate);
	userDTO.setUser_gender(user_gender);
	userDTO.setUser_email(user_email);
	userDTO.setUser_phone(user_phone);
	userDTO.setUser_addr(user_addr);
	
	UserDAO userDAO = UserDAO.getInstance();
	boolean result = userDAO.join(userDTO);
	

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
<% if (result){ %>
	<script type="text/javascript">
		alert('회원가입에 성공했습니다.');
		location.href="login.jsp";
	</script>
<% }else{ %>
	<script type="text/javascript">
		alert('이미 존재하는 아이디 입니다.');
		location.href='javascript:history.back()';
	</script>
<%} %>



</body>
</html>