<%@page import="user.UserDAO"%>
<%@page import="user.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String user_id = (String)session.getAttribute("user_id");
	
	String user_name = request.getParameter("user_name");
	String user_birthdate = request.getParameter("user_birthdate");
	String user_gender = request.getParameter("user_gender");
	String user_email = request.getParameter("user_email");
	String user_phone = request.getParameter("user_phone");
	String user_postcode = request.getParameter("user_postcode");
	String user_addr = request.getParameter("user_addr");
	String user_detailaddr = request.getParameter("user_detailaddr");
	String user_extraaddr = request.getParameter("user_extraaddr");
	
	UserDTO userDTO = new UserDTO();
	userDTO.setUser_id(user_id);
	userDTO.setUser_name(user_name);
	userDTO.setUser_birthdate(user_birthdate);
	userDTO.setUser_gender(user_gender);
	userDTO.setUser_email(user_email);
	userDTO.setUser_phone(user_phone);
	userDTO.setUser_postcode(user_postcode);
	userDTO.setUser_addr(user_addr);
	userDTO.setUser_detailaddr(user_detailaddr);
	userDTO.setUser_extraaddr(user_extraaddr);
	
	UserDAO userDAO = UserDAO.getInstance();
	boolean result = userDAO.updateUser(userDTO);
	
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
<% if(result){ %>
	alert('회원정보가 수정되었습니다.');
	location.href='user_info.jsp?user_id=<%=user_id%>';
<% } else { %>
	alert('회원정보 수정 권한이 없습니다.');
	location.href='javascript:history.back()';
<% } %>
</script>
</body>
</html>