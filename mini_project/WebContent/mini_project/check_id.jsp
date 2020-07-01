<%@page import="user.UserDTO"%>
<%@page import="user.UserDAO"%>
<%@ page language="java" contentType="text/plain; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String user_id=request.getParameter("user_id");

	UserDAO userDAO = UserDAO.getInstance();
	boolean result = userDAO.isExistUser_id(user_id);
	
	out.println(result);
%>