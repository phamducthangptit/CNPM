<%@page import="model.TaiKhoan"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Danh sách sinh viên</title>
<script>
	// check if message is not empty
	var message = "${mgs_updateSV}";
	if (message !== "") {
		alert(message);
	}
</script>
<style>
.button-container {
	display: flex;
	justify-content: center;
}

.search-container {
	text-align: left;
	padding: 10px;
}

.search-form {
	display: inline-block;
}

.search-form input[type="text"] {
	padding: 10px;
	border: solid;
	border-radius: 5px;
}

.search-form button {
	padding: 10px 20px;
	background-color: #4CAF50;
	color: white;
	border: none;
	border-radius: 5px;
	margin-left: 10px;
	cursor: pointer;
}

.search-form button:hover {
	background-color: #45a049;
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
	<div class="search-container">
			<form class="search-form" action="timkiemSV.htm" method="post">
				<input type="text" id="searchInput" name="maSV" value="${maSV }"
					placeholder="Nhập mã SV">
				<button type="submit">Tìm kiếm</button>
			</form>
		</div>
		<form class="d-flex mb-4" role="search" action="locSV.htm" method="post">
			<div class="mb-3">
				<label for="maLop" class="form-label">Lớp</label> 
				<select
					name="maLop" class="form-select" required="required">
					<c:forEach items="${listLop}" var="lop">
						<option value="${lop.maLop.toString()}" ${lop.maLop.toString() == maLop? 'selected' : ''}>${lop.tenLop}</option>
					</c:forEach>
				</select>
			</div>
			
			<button class="btn btn-outline-success" type="submit" style="height: 40px; width: 80px; margin-top: 30px; margin-left: 5px">Lọc</button>
		</form>
		<form action="danhsachsinhvien.htm" method="post">
			<table class="table table-success table-striped"
				style="text-align: center;">
				<thead>
					<tr>
						<th scope="col">STT</th>
						<th scope="col">Mã sinh viên</th>
						<th scope="col">Họ và tên</th>
						<th scope="col">Lớp</th>
						<th scope="col">Ngày sinh</th>
						<th scope="col">Giới tính</th>
						<th scope="col">Email1</th>
						<th scope="col">Email2</th>
						<th scope="col">SDT1</th>
						<th scope="col">SDT2</th>
						<th scope="col">Quê quán</th>
						<th scope="col"></th>
					</tr>
				</thead>
				<tbody>
					<%
					int count = 1;
					%>
					<c:forEach items="${listSinhVien}" var="sinhVien">
						<tr class="body">
							<td><%=count%></td>
							<td>${sinhVien.maSV }</td>
							<td>${sinhVien.hoTen }</td>
							<td>${sinhVien.lop.tenLop }</td>
							<td>${sinhVien.ngaySinh }</td>
							<td>${sinhVien.gioiTinh }</td>
							<td>${sinhVien.getEmail1() }</td>
							<td>${sinhVien.getEmail2() }</td>
							<td>${sinhVien.SDT1 }</td>
							<td>${sinhVien.SDT2 }</td>
							<td>${sinhVien.queQuan }</td>
							<td><a href="ctsinhvien.htm?id=${sinhVien.maSV}">Chi
									tiết</a></td>
						</tr>
						<%
						count += 1;
						%>
					</c:forEach>
				</tbody>
			</table>
		</form>
	</div>
</body>
<%
}
%>
</html>