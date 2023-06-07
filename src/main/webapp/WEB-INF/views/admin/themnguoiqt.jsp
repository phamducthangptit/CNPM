<%@page import="model.TaiKhoan"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Thêm người quản trị</title>
<style>
	.radio-item {
  		margin-right: 40px;
	}
</style>
</head>
<%
	Object ob = session.getAttribute("taiKhoan");
	TaiKhoan tk = new TaiKhoan();
	if (ob != null) {
		tk = (TaiKhoan) ob;
	}
	if (tk != null && tk.getRole().getMaRole() == 1) {
%>
<body>
	<%@include file="header_admin.jsp"%>
	<div class="container mt-4">
		<form action="themnguoiqt.htm" method="post">
		<div class="row justify-content-center">
			<div class="col-sm-6">
				<div class="mb-3">
					<label for="maNQT" class="form-label">Mã người quản trị*</label>
	    			<input type="text" class="form-control" name="maNQT" value="${maNguoiDung}" readonly="readonly">
				</div>
				<div class="mb-3">
					<label for="tenNQT" class="form-label">Tên người quản trị*</label>
	    			<input type="text" class="form-control" name="tenNQT" required="required">
				</div>
				<div class="mb-3">
					<label for="ngaySinh" class="form-label">Ngày sinh*</label>
					<input type="date" id="ngaysinh" name="ngaySinh" style="margin-top: 10px; margin-left: 40px;">
				</div>
				<div class="mb-3">
					<label for="gioiTinh" class="form-label">Giới tính*</label>
					<br/>
					<label class="radio-item">
	    				<input class="form-check-input" type="radio" name="gioiTinh" value="Nam" required="required"/>
	    				Nam
	    			</label>
	    			<label class="radio-item">
	    				<input class="form-check-input" type="radio" name="gioiTinh" value="Nữ" required="required"/>
	    				Nữ
	    			</label>
				</div>
			</div>
			<div class="col-sm-6">
				<div class="mb-3">
					<label for="queQuan" class="form-label">Quê quán*</label>
	    			<input type="text" class="form-control" name="queQuan" required="required">
				</div>
				<div class="mb-3">
					<label for="email1" class="form-label">Email1*</label>
	    			<input type="email" class="form-control" name="email1" required="required" value="${email1 }">
				</div>
				<div class="mb-3">
					<label for="email2" class="form-label">Email2</label>
	    			<input type="email" class="form-control" name="email2">
				</div>
				<div class="mb-3">
					<label for="sdt1" class="form-label">Số điện thoại 1 *</label>
	    			<input type="tel" class="form-control" name="sdt1" required="required" >
				</div>
				<div class="mb-3">
					<label for="sdt2" class="form-label">Số điện thoại 2</label>
	    			<input type="tel" class="form-control" name="sdt2">
				</div>
			</div>
			<button type="submit" class="btn btn-success" style="width: 200px">Thêm người quản trị</button>
		</div>
		</form>
	</div>
</body>
<%} %>
</html>