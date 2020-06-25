<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String user_id = (String)session.getAttribute("user_id");
	String user_name = (String)session.getAttribute("user_name");
%>
<%@ include file = "../commons/header.jsp" %> 

<%--= user_id + "(" + user_name + ")님이 로그인" --%>
<h3><strong>ANU 인공지능</strong></h3>
	<p>
		이 웹 사이트는 스마트팩토리 인공지능 개발자 양성과정 전용 웹사이트며 교육생 출결관리 및 정보공유 사이트 입니다.<br/>
		기능으로는 회원가입, 로그인, 게시판, 출결관리 등이 있습니다. 많은 이용 부탁드립니다.
		
	</p>	
	<%@ include file="../commons/footer.jsp" %>
</body>

</html>