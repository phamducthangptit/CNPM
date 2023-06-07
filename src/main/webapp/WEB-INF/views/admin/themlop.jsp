<%@page import="model.TaiKhoan"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Thêm lớp</title>
</head>
<%
	Object ob = session.getAttribute("taiKhoan");
	TaiKhoan tk = new TaiKhoan();
	if (ob != null) {
		tk = (TaiKhoan) ob;
	}
	if (tk != null && tk.getRole().getMaRole() == 1) {
%>
<script>
    // check if message is not empty
    var message = "${mgs_InsertLop}";
    if (message !== "") {
        alert(message);
    }
</script>
<body>
	<%@include file="header_admin.jsp"%>
	<div class="container mt-4">
		<form action="themlop.htm" method="post">
			<div class="row justify-content-center">
				<div class="col-sm-6">
					<div class="mb-3">
						<label for="maLop" class="form-label">Mã Lớp*</label> <input
							type="text" class="form-control" name="maLop">
					</div>
					<div class="mb-3">
						<label for="tenLop" class="form-label">Tên lớp*</label> <input
							type="text" class="form-control" name="tenLop">
					</div>
					<div class="mb-3">
						<label for="khoaHoc" class="form-label">Khóa học*</label> 
						<select name="maKhoaHoc" class="form-select" required="required">
							<c:forEach items="${listKhoaHoc}" var="khoaHoc">
								<option value="${khoaHoc.maKH}">${khoaHoc.maKH}</option>
							</c:forEach>
						</select>
					</div>
					<button type="submit" class="btn btn-success" style="width: 150px">Thêm lớp</button>
				</div>
			</div>
			
		</form>
	</div>
</body>
<%
}
%>
</html>