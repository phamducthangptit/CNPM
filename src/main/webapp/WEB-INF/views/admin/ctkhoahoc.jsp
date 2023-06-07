<%@page import="model.TaiKhoan"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Chi tiết khóa học</title>
<script>
    // check if message is not empty
    var message = "${mgs_updateKH}";
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
	<c:forEach items="${listKhoaHoc}" var="khoaHoc">
		<c:if test="${khoaHoc.maKH == idKhoaHoc}">
			<div class="container mt-4">
				<form action="chinhsuakhoahoc.htm" method="post">
					<div class="row justify-content-center">
						<div class="col-sm-6">
							<div class="mb-3">
								<label for="maKH" class="form-label">Mã khóa học*</label> <input
									type="text" class="form-control" name="maKH"
									required="required" readonly="readonly" value="${idKhoaHoc}">
							</div>
							<div class="mb-3">
								<label for="namBD" class="form-label">Năm bắt đầu*</label> <input
									type="number" class="form-control" name="namBD" min="2010"
									max="2030" required="required" value="${khoaHoc.namBD}">
							</div>
							<div class="mb-3">
								<label for="namKT" class="form-label">Năm kết thúc*</label> <input
									type="number" class="form-control" name="namKT" min="2010"
									max="2030" required="required" value="${khoaHoc.namKT}">
							</div>
							<button type="submit" class="btn btn-success" style="width: 200px" 
						name="saveKH" value="SaveKH">Lưu thông tin khóa học</button>
							<button type="submit" class="btn btn-success" style="width: 200px; margin-left: 4px;"
							name="deleteKH" value="DeleteKH">Xóa khóa học</button>
						</div>
					</div>
				</form>
			</div>
		</c:if>
	</c:forEach>
</body>
<%
}
%>
</html>