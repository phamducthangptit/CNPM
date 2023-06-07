<%@page import="model.TaiKhoan"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Thêm lớp tín chỉ</title>
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
		<form action="themloptinchi.htm" method="post">
			<div class="row justify-content-center">
				<div class="col-sm-6">
					<div class="mb-3">
						<label for="slNhom" class="form-label">Số lượng nhóm*</label> <input
							type="number" class="form-control" name="slNhom" min="1" max="5"
							required="required">
					</div>
					<div class="mb-3">
						<label for="maHK" class="form-label">Mã học kì*</label> <select
							name="maHK" class="form-select" required="required">
							<c:forEach items="${listHocKi}" var="hk">
								<option value="${hk.maHK}">${hk.maHK}</option>
							</c:forEach>
						</select>
					</div>
					<div class="mb-3">
						<label for="maLop" class="form-label">Mã lớp*</label> <select
							name="maLop" class="form-select" required="required">
							<c:forEach items="${listLop}" var="lop">
								<option value="${lop.maLop}">${lop.maLop}</option>
							</c:forEach>
						</select>
					</div>
					<div class="mb-3">
						<label for="maMH" class="form-label">Tên môn học*</label> <select
							name="maMH" class="form-select" required="required">
							<c:forEach items="${listMonHoc}" var="mh">
								<option value="${mh.maMH}">${mh.tenMH}</option>
							</c:forEach>
						</select>
					</div>
				</div>
					<div class="col-sm-6">
						<div class="mb-3">
							<label for="maGV" class="form-label">Giảng viên dạy*</label> <select
								name="maGV" class="form-select" required="required">
								<c:forEach items="${listTeacher}" var="gv">
									<option value="${gv.maGV}">${gv.hoTen}</option>
								</c:forEach>
							</select>
						</div>
						<div class="mb-3">
							<label for="ngayBDHoc" class="form-label">Ngày bắt đầu
								học*</label> <input type="date" id="ngayBDHoc" name="ngayBDHoc"
								style="margin-top: 10px; margin-left: 40px;" required="required">
						</div>
						<div class="mb-3">
							<label for="ngayKTHoc" class="form-label">Ngày kết thúc
								học*</label> <input type="date" id="ngayKTHoc" name="ngayKTHoc"
								style="margin-top: 10px; margin-left: 40px;" required="required">
						</div>
						<div class="mb-3">
							<label for="slToiDa" class="form-label">Số lượng tối đa*</label>
							<input type="number" class="form-control" name="slToiDa"
								required="required" min="10" max="200">
						</div>
					</div>
					<button type="submit" class="btn btn-success" style="width: 150px">Thêm
						lớp tín chỉ</button>
				</div>
				</form>
			</div>
</body>
<%
}
%>
</html>