<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	boolean result = false;
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	StringBuffer sql = new StringBuffer();
	sql.append(" insert into T_BOARD(no, title, content)");
	sql.append(" values(T_BOARD_no_seq.nextval, ?, ?)");
	
	try {
			Class.forName("oracle.jdbc.OracleDriver");
			conn = DriverManager.getConnection(
					"jdbc:oracle:thin:@localhost:1521:xe", "mini", "mini");
		pstmt=conn.prepareStatement(sql.toString());
		pstmt.setString(1, title);
		pstmt.setString(2, content);
		if(pstmt.executeUpdate() > 0) {
			result = true;
		}
	} catch(Exception e) {
		e.printStackTrace();
	} finally {
		if(pstmt!=null)try{pstmt.close();}catch(Exception e) {}
		if(conn !=null)try{conn.close(); }catch(Exception e) {}		
	}
	

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon"type="image/png" href="/favicon.png">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&display=swap" rel="stylesheet">
<style type="text/css">
body {
		font-family: 'Nanum Pen Script', cursive;
		font-size:25px;
	 }
</style>
</head>
<body>
<script type="text/javascript">
<% if (result) { %> 
	location.href='bbs.jsp';
<% } else { %>
	alert('입력에 실패했습니다');
	location.href='javascript:history.back()';


<% } %>
</script>
</body>
</html>