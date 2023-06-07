<%@page import="model.TaiKhoan"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Thông tin cá nhân</title>
<style>
	.radio-item {
  		margin-right: 40px;
	}
</style>
<script>
    // check if message is not empty
    var message = "${mgs_updateTTSV}";
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
	if (tk != null && tk.getRole().getMaRole() == 3) {
%>
<body>
 	<%@include file="header_student.jsp"%>
			<div class="container mt-4">
				<form action="suattcnsv.htm" method="post">
					<div class="row justify-content-center">
						<div class="col-sm-6">
							<div class="mb-3">
								<label for="maSV" class="form-label">Mã sinh viên</label> <input
									type="text" class="form-control" name="maSV" readonly="readonly"
									 value="${student.maSV}">
							</div>
							<div class="mb-3">
								<label for="tenSV" class="form-label">Tên sinh viên*</label> <input
									type="text" class="form-control" name="tenSV"
									required="required" value="${student.hoTen}">
							</div>
							<div class="mb-3">
								<label for="ngaySinh" class="form-label">Ngày sinh*</label> <input
									type="date" id="ngaysinh" name="ngaySinh"
									style="margin-top: 10px; margin-left: 40px;"
									value="${student.ngaySinh}">
							</div>
							<div class="mb-3">
								<label for="gioiTinh" class="form-label">Giới tính*</label> <br />
								<label class="radio-item"> <input
									class="form-check-input" type="radio" name="gioiTinh"
									value="Nam" required="required"
									${student.gioiTinh == 'Nam'?'checked':''} /> Nam
								</label> <label class="radio-item"> <input
									class="form-check-input" type="radio" name="gioiTinh"
									value="Nữ" required="required" ${student.gioiTinh == 'Nữ'?'checked':''} />
									Nữ
								</label>
							</div>
						</div>
						<div class="col-sm-6">
							<div class="mb-3">
								<label for="queQuan" class="form-label">Quê quán</label> <input
									type="text" class="form-control" name="queQuan"
									required="required" value="${student.queQuan }" readonly="readonly">
							</div>
							<div class="mb-3">
								<label for="email1" class="form-label">Email1*</label> <input
									type="email" class="form-control" name="email1"
									required="required" value="${student.getEmail1() }" readonly="readonly">
							</div>
							<div class="mb-3">
								<label for="email2" class="form-label">Email2</label> <input
									type="email" class="form-control" name="email2"
									value="${student.getEmail2() }">
							</div>
							<div class="mb-3">
								<label for="sdt1" class="form-label">Số điện thoại 1 *</label> <input
									type="tel" class="form-control" name="sdt1" required="required"
									value="${student.SDT1 }" readonly="readonly">
							</div>
							<div class="mb-3">
								<label for="sdt2" class="form-label">Số điện thoại 2</label> <input
									type="tel" class="form-control" name="sdt2" value="${student.SDT2 }">
							</div>
						</div>
						<button type="submit" class="btn btn-success" style="width: 200px" 
						name="saveInfStudent" value="SaveInfStudent">Lưu thông tin</button>
					</div>
				</form>
			</div>
</body>
<script>
const form = document.querySelector(".form-logout")
console.log(form)
form.addEventListener("submit", function() {
	event.preventDefault()
	localStorage.clear()
	this.submit()
	})
</script>
<%
}
%>
</html>