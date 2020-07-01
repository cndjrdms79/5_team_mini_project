<%@ page import="attendance.AttDAO"%>
<%@ page import="attendance.AttDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%  
   String id = request.getParameter("user_id");   
   String date = request.getParameter("date_format");
   
   AttDTO attDTO = new AttDTO();
   attDTO.setUser_id(id);
   attDTO.setAttendance(date);
   
   AttDAO attDAO = AttDAO.getInstance();
   boolean result = attDAO.check(attDTO);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" type="image/png" href="/favicon.png">
<title>Insert title here</title>
</head>
<body>
<% if(id == null) {%>
   <script type="text/javascript">
   alert('먼저 로그인 해주세요.');
   location.href='login.jsp';
   </script>
<% } %>
<% if (result == false) { %>
   <script type="text/javascript">
   alert('이미 출석하셨거나 잘못된 접근입니다.');
   location.href='javascript:history.back()';
   </script> 
<% } else { %>
   <script type="text/javascript">
   alert('출석체크 성공')
   location.href='javascript:history.back()';
   </script>
<% } %>
</body>
</html>