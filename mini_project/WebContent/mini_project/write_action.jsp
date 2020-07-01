<%@page import="java.util.Enumeration"%>
<%@page import="com.sun.jmx.snmp.Enumerated"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.util.UUID"%>
<%@page import="java.io.File"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="board.BoardDAO"%>
<%@page import="board.BoardDTO"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String contentType = request.getContentType();
	String uploadPath = "C:/dev64/upload";
	String user_id = (String)session.getAttribute("user_id");
	boolean result = true;
	
	// 추가!
	String fileInput = "";
	String file_name= "";  		
	String content_type = "";
	File fileObj = null;
	String originalFilename =""; 
	String fileExtend = "";
	String file_volume="";
	

	
	try {
		MultipartRequest multi = new MultipartRequest( 
				request, 
				uploadPath, 
				50 * 1024 * 1024, 
				"utf-8", 
				new DefaultFileRenamePolicy() 
		);
		
		// 추가 line 
	    Enumeration files = multi.getFileNames();

		// 파일 이름 DB저장
	     while(files.hasMoreElements()) {
	          fileInput = (String)files.nextElement();               				 // 파일인풋 이름
	          file_name = multi.getFilesystemName(fileInput);            			 // 파일명
	          if (file_name != null) {
	               content_type = multi.getContentType(fileInput);                   		 // 콘텐트타입    
	               fileObj = multi.getFile(fileInput);                               // 파일객체
	               originalFilename = multi.getOriginalFileName(fileInput);          // 초기 파일명
	               fileExtend = file_name.substring(file_name.lastIndexOf(".")+1);   // 파일 확장자
	               file_volume = String.valueOf(fileObj.length());                      // 파일크기
	          }
	     }
	          

// 		long file_volume = Long.parseLong(multi.getParameter("file_volume"));	// 추가 line

		
		
		String title = multi.getParameter("title");
		String content = multi.getParameter("content");
		
		BoardDTO boardDTO = new BoardDTO();
		boardDTO.setUser_id(user_id);
		boardDTO.setTitle(title);
		boardDTO.setContent(content);
		
		// 추가
		boardDTO.setFile_name(file_name);
		boardDTO.setFile_volume(file_volume);
		boardDTO.setContent_type(content_type);
		
		BoardDAO boardDAO = BoardDAO.getInstance();
		result = boardDAO.writeBoard(boardDTO);
		
	} catch (Exception e) {
		e.printStackTrace();
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

<% if(user_id == null) {%>
	<script type="text/javascript">
	alert('먼저 로그인 해주세요.');
	location.href='../login.jsp';
	</script>
<% } %>

<!-- 문제 1 -->
<% if (result == false) { %>
	<script type="text/javascript">
	alert('글쓰기에 실패했습니다');
	location.href='javascript:history.back()';
	</script> 
<% } else { %>
	<script type="text/javascript">
	alert('글쓰기 성공!')
	location.href='bbs.jsp';
	</script>
<% } %>

</body>
</html>