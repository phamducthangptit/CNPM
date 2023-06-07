<%@page import="model.TaiKhoan"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Trang chủ</title>
</head>
<%
	Object ob = session.getAttribute("taiKhoan");
	TaiKhoan tk = new TaiKhoan();
	if(ob != null){
		tk = (TaiKhoan) ob;
	}
	if(tk != null && tk.getRole().getMaRole() == 3){	
%>
<body>
	<%@include file = "header_student.jsp" %>
	<%@include file = "../content/content.jsp" %>
</body>
<%} %>
</html>