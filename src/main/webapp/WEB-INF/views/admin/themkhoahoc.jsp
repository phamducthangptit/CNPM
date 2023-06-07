<%@page import="model.TaiKhoan"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Thêm khóa học</title>
<script>
    // check if message is not empty
    var message = "${mgs_InsertKH}";
    if (message !== "") {
        alert(message);
    }
</script>
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
		<form action="themkhoahoc.htm" method="post">
		<div class="row justify-content-center">
			<div class="col-sm-6">
				<div class="mb-3">
					<label for="maKhoaHoc" class="form-label">Mã khóa học*</label>
	    			<input type="text" class="form-control" name="maKhoaHoc" required="required">
				</div>
				<div class="mb-3">
					<label for="namBD" class="form-label">Năm bắt đầu*</label>
	    			<input type="number" class="form-control" name="namBD" min="2010" max="2030" required="required" value="${namBD}">
				</div>
				<div class="mb-3">
					<label for="namKT" class="form-label">Năm kết thúc*</label>
	    			<input type="number" class="form-control" name="namKT" min="2010" max="2030" required="required" value="${namKT}">
				</div>
				<button type="submit" class="btn btn-success" style="width: 150px">Thêm khóa học</button>
			</div>
		</div>
		</form>
	</div>
</body>
<%} %>
</html>