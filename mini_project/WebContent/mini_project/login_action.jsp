<%@page import="util.Cookies"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="org.apache.commons.codec.digest.DigestUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String user_id = request.getParameter("user_id");	// request.getParameter user_id 요청
	String user_pw = request.getParameter("user_pw");	// request.getParameter user_pw 요청
	user_pw = DigestUtils.sha512Hex(user_pw);			// user_pw를 암호화 하여 user_pw 안에 넣기
	String user_name = null;
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

	Connection conn = null;
	PreparedStatement pstmt = null;	
	ResultSet rs = null;
	
	StringBuffer sql = new StringBuffer();
	sql.append(" select user_id, user_name");
	sql.append(" from   t_user");
	sql.append(" where  user_id=? and user_pw=?");
	
	try{
		Class.forName("oracle.jdbc.OracleDriver");				   // 드라이버
		conn = DriverManager.getConnection(						   // DriverManager.getConnection
				"jdbc:oracle:thin:@localhost:1521:xe","mini","mini");  // 접속url, id, pw
		pstmt = conn.prepareStatement(sql.toString());	
		pstmt.setString(1, user_id);		// '?' 의 개수와 숫자를 맞춰 줘야 한다.!!!			
		pstmt.setString(2, user_pw);			
		rs = pstmt.executeQuery();			     	   // 쿼리 수행
				
		
		if (rs.next()) {	// user_id와 user_pw가 일치한 경우

			Cookies cookie = new Cookies(request);	
			response.addCookie(cookie.createCookie("user_id", user_id, "/" , save_id ? 60*60*24*30 : 0));

			user_name = rs.getString("user_name");
			session.setAttribute("user_id", user_id);
			session.setAttribute("user_name", user_name);
			
			response.sendRedirect("main.jsp");
			return;
			
		} else {		// user_id와 user_pw 가 틀린경우
%>
<script type="text/javascript">   // alert : 화면에 메세지 박스 가뜸
	alert('아이디 혹은 비밀번호가 틀립니다.');
	location=history.back();	// 전 페이지로 돌아감.
</script>
<% 
		}	
	} catch(Exception e) {
		e.printStackTrace();
	}finally {
		if(rs   != null) try{rs.close();}catch(Exception e){}
		if(pstmt != null) try{pstmt.close();}catch(Exception e){}
		if(conn != null) try{conn.close();}catch(Exception e){}
	}
%>
</body>
</html>