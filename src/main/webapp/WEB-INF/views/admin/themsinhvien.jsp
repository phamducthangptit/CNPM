<%@page import="model.TaiKhoan"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Thêm sinh viên</title>
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
		<form action="themsinhvien.htm" method="post">
		<div class="row justify-content-center">
			<div class="col-sm-6">
				<div class="mb-3">
					<label for="maSV" class="form-label">Mã sinh viên*</label>
	    			<input type="text" class="form-control" name="maSV" value="${maNguoiDung}" readonly="readonly">
				</div>
				<div class="mb-3">
					<label for="maLop" class="form-label">Lớp*</label>
			 		<select name="maLop" class="form-select" required="required">
						<c:forEach items="${listLop}" var="lop">
							<option value="${lop.maLop.toString()}">${lop.tenLop}</option>
						</c:forEach>
					</select>
				</div>
				<div class="mb-3">
					<label for="tenSV" class="form-label">Tên sinh viên*</label>
	    			<input type="text" class="form-control" name="tenSV" required="required">
				</div>
				<div class="mb-3">
					<label for="ngaSinh" class="form-label">Ngày sinh*</label>
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
	    			<input type="tel" class="form-control" name="sdt1" required="required">
				</div>
				<div class="mb-3">
					<label for="sdt2" class="form-label">Số điện thoại 2</label>
	    			<input type="tel" class="form-control" name="sdt2">
				</div>
			</div>
			<button type="submit" class="btn btn-success" style="width: 150px">Thêm sinh viên</button>
		</div>
		</form>
	</div>
</body>
<%} %>
</html>