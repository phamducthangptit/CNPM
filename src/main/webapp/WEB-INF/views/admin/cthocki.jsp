<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Chi tiết học kì</title>
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
	<c:forEach items="${listHocKi}" var="hocKi">
		<c:if test="${hocKi.maHK == idHocKi}">
			<div class="container mt-4">
				<form action="chinhsuahocki.htm" method="post">
					<div class="row justify-content-center">
						<div class="col-sm-6">
							<div class="mb-3">
								<label for="maHK" class="form-label">Mã học kì*</label> <input
									type="text" class="form-control" name="maHK"
									required="required" readonly="readonly" value="${idHocKi}">
							</div>
							<div class="mb-3">
								<label for="ngayBD" class="form-label">Ngày bắt đầu học kì</label> <input
									type="date" class="form-control" name="ngayBD" required="required" value="${hocKi.ngayBD}">
							</div>
							<div class="mb-3">
								<label for="ngayKT" class="form-label">Ngày kết thúc học kì</label> <input
									type="date" class="form-control" name="ngayKT" required="required" value="${hocKi.ngayKT}">
							</div>
							<button type="submit" class="btn btn-success" style="width: 200px" 
						name="saveHK" value="SaveHK">Lưu thông tin học kì</button>
							<button type="submit" class="btn btn-success" style="width: 200px; margin-left: 4px;"
							name="deleteHK" value="DeleteHK">Xóa học kì</button>
						</div>
					</div>
				</form>
			</div>
		</c:if>
	</c:forEach>
</body>
</html>