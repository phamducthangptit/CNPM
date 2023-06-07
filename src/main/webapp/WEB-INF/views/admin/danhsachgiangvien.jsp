<%@page import="model.TaiKhoan"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Danh sách giảng viên</title>
<script>
	// check if message is not empty
	var message = "${mgs_updateGV}";
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
			<form class="search-form" action="timkiemGV.htm" method="post">
				<input type="text" id="searchInput" name="maGV" value="${maGV }"
					placeholder="Nhập mã GV">
				<button type="submit">Tìm kiếm</button>
			</form>
		</div>
		<form action="danhsachgiangvien.htm" method="post">
			<table class="table table-success table-striped"
				style="text-align: center;">
				<thead>
					<tr>
						<th scope="col">STT</th>
						<th scope="col">Mã giảng viên</th>
						<th scope="col">Họ và tên</th>
						<th scope="col">Ngày sinh</th>
						<th scope="col">Giới tính</th>
						<th scope="col">Học hàm</th>
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
					<c:forEach items="${listTeacher}" var="teacher">
						<tr class="body">
							<td><%=count%></td>
							<td>${teacher.maGV }</td>
							<td>${teacher.hoTen }</td>
							<td>${teacher.ngaySinh }</td>
							<td>${teacher.gioiTinh }</td>
							<td>${teacher.hocHam }</td>
							<td>${teacher.getEmail1() }</td>
							<td>${teacher.getEmail2() }</td>
							<td>${teacher.SDT1 }</td>
							<td>${teacher.SDT2 }</td>
							<td>${teacher.getQueQuan() }</td>
							<td><a href="ctgiangvien.htm?id=${teacher.maGV}">Chi
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