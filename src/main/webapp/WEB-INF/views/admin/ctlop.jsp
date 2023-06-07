<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Chi tiết lớp</title>
</head>
<script>
    // check if message is not empty
    var message = "${mgs_updateHK}";
    if (message !== "") {
        alert(message);
    }
</script>
<body>
	<%@include file="header_admin.jsp"%>
	<c:forEach items="${listLop}" var="lop">
		<c:if test="${lop.maLop == idLop}">
			<div class="container mt-4">
				<form action="chinhsualop.htm" method="post">
					<div class="row justify-content-center">
						<div class="col-sm-6">
							<div class="mb-3">
								<label for="maLop" class="form-label">Mã lớp*</label> <input
									type="text" class="form-control" name="maLop"
									required="required" readonly="readonly" value="${idLop}">
							</div>
							<div class="mb-3">
								<label for="tenLop" class="form-label">Tên lớp*</label> <input
									type="text" class="form-control" name="tenLop"
									required="required" value="${lop.tenLop}">
							</div>
						<div class="mb-3">
							<label for="khoaHoc" class="form-label">Khóa học*</label> <select
								name="maKhoaHoc" class="form-select" required="required">
								<c:forEach items="${listKhoaHoc}" var="khoaHoc">
									<option value="${khoaHoc.maKH}" ${khoaHoc.maKH == lop.khoaHoc.maKH ? 'selected' : ''}>${khoaHoc.maKH}</option>
								</c:forEach>
							</select>
						</div>
							<button type="submit" class="btn btn-success" style="width: 200px" 
						name="saveLop" value="SaveLop">Lưu thông tin lớp</button>
							<button type="submit" class="btn btn-success" style="width: 200px; margin-left: 4px;"
							name="deleteLop" value="DeleteLop">Xóa lớp</button>
						</div>
					</div>
				</form>
			</div>
		</c:if>
	</c:forEach>
</body>
</html>