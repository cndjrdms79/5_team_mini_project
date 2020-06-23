<%@page import="user.UserDAO"%>
<%@page import="user.UserDTO"%>
<%@page import="util.Cookies"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="org.apache.commons.codec.digest.DigestUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	
	String user_id = request.getParameter("user_id");	// request.getParameter user_id 요청
	String user_pw = request.getParameter("user_pw");	// request.getParameter user_pw 요청
	user_pw = DigestUtils.sha512Hex(user_pw);			// user_pw를 암호화 하여 user_pw 안에 넣기
	
	UserDTO userDTO = new UserDTO();
	userDTO.setUser_id(user_id);
	userDTO.setUser_pw(user_pw);
	
	UserDAO userDAO = UserDAO.getInstance();
	int result = userDAO.loginCheck(user_id, user_pw);

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" type="image/png" href="/favicon.png">
<title>Insert title here</title>
</head>
<body>

<%	 
		boolean save_id = false;
		if(request.getParameter("save_id") != null){
			save_id=true;
		}
		
		if (result == 1) {	// user_id와 user_pw가 일치한 경우
			Cookies cookie = new Cookies(request);	
			response.addCookie(cookie.createCookie("user_id", user_id, "/" , save_id ? 60*60*24*30 : 0));
			session.setAttribute("user_id", userDTO.getUser_id());
			response.sendRedirect("main.jsp");
			return;
	 } else {		// user_id와 user_pw 가 틀린경우	%>

	<script type="text/javascript">   // alert : 화면에 메세지 박스 가뜸
		alert('아이디 혹은 비밀번호가 틀립니다.');
		location=history.back();	// 전 페이지로 돌아감.
	</script>
<% } %>

</body>
</html>