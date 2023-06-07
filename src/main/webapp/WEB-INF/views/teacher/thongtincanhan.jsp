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
    var message = "${mgs_updateTTGV}";
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
	if (tk != null && tk.getRole().getMaRole() == 2) {
%>
<body>
 	<%@include file="header_teacher.jsp"%>
			<div class="container mt-4">
				<form action="suattcngv.htm" method="post">
					<div class="row justify-content-center">
						<div class="col-sm-6">
							<div class="mb-3">
								<label for="maGV" class="form-label">Mã giảng viên</label> <input
									type="text" class="form-control" name="maGV" readonly="readonly"
									 value="${teacher.maGV}">
							</div>
							<div class="mb-3">
								<label for="tenGV" class="form-label">Tên giảng viên*</label> <input
									type="text" class="form-control" name="tenGV"
									required="required" value="${teacher.hoTen}">
							</div>
							<div class="mb-3">
								<label for="ngaySinh" class="form-label">Ngày sinh*</label> <input
									type="date" id="ngaysinh" name="ngaySinh"
									style="margin-top: 10px; margin-left: 40px;"
									value="${teacher.ngaySinh}">
							</div>
							<div class="mb-3">
								<label for="gioiTinh" class="form-label">Giới tính*</label> <br />
								<label class="radio-item"> <input
									class="form-check-input" type="radio" name="gioiTinh"
									value="Nam" required="required"
									${teacher.gioiTinh == 'Nam'?'checked':''} /> Nam
								</label> <label class="radio-item"> <input
									class="form-check-input" type="radio" name="gioiTinh"
									value="Nữ" required="required" ${teacher.gioiTinh == 'Nữ'?'checked':''} />
									Nữ
								</label>
							</div>
							<div class="mb-3">
								<label for="hocHam" class="form-label">Học hàm*</label> <br /> <label
									class="radio-item"> <input class="form-check-input"
									type="radio" name="hocHam" value="Giảng viên"
									required="required" ${teacher.hocHam == 'Giảng viên'?'checked':''} />
									Giảng viên
								</label> <label class="radio-item"> <input
									class="form-check-input" type="radio" name="hocHam"
									value="Thạc sĩ" required="required"
									${teacher.hocHam == 'Thạc sĩ'?'checked':''} /> Thạc sĩ
								</label> <label class="radio-item"> <input
									class="form-check-input" type="radio" name="hocHam"
									value="Tiến sĩ" required="required"
									${teacher.hocHam == 'Tiến sĩ'?'checked':''} /> Tiến sĩ
								</label>
							</div>
						</div>
						<div class="col-sm-6">
							<div class="mb-3">
								<label for="queQuan" class="form-label">Quê quán</label> <input
									type="text" class="form-control" name="queQuan"
									required="required" value="${teacher.queQuan }" readonly="readonly">
							</div>
							<div class="mb-3">
								<label for="email1" class="form-label">Email1*</label> <input
									type="email" class="form-control" name="email1"
									required="required" value="${teacher.getEmail1() }" readonly="readonly">
							</div>
							<div class="mb-3">
								<label for="email2" class="form-label">Email2</label> <input
									type="email" class="form-control" name="email2"
									value="${teacher.getEmail2() }">
							</div>
							<div class="mb-3">
								<label for="sdt1" class="form-label">Số điện thoại 1 *</label> <input
									type="tel" class="form-control" name="sdt1" required="required"
									value="${teacher.SDT1 }" readonly="readonly">
							</div>
							<div class="mb-3">
								<label for="sdt2" class="form-label">Số điện thoại 2</label> <input
									type="tel" class="form-control" name="sdt2" value="${teacher.SDT2 }">
							</div>
						</div>
						<button type="submit" class="btn btn-success" style="width: 200px" 
						name="saveInfTeacher" value="SaveInfTeacher">Lưu thông tin</button>
					</div>
				</form>
			</div>
</body>
<%
}
%>
</html>