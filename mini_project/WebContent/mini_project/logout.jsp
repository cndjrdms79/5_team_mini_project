<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	session.invalidate(); // 세션을 날림
%>
<script>
	alert('로그아웃되었습니다.');
	location.href='login.jsp';
</script>
