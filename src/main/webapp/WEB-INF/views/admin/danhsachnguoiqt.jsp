<%@page import="model.TaiKhoan"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Danh sách người quản trị</title>
<script>
	// check if message is not empty
	var message = "${mgs_updateAdmin}";
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
			<form class="search-form" action="timkiemNQT.htm" method="post">
				<input type="text" id="searchInput" name="maNQT" value="${maNQT }"
					placeholder="Nhập mã NQT">
				<button type="submit">Tìm kiếm</button>
			</form>
		</div>
		<form action="danhsachnguoiqt.htm" method="post">
			<table class="table table-success table-striped" style="text-align: center;">
				<thead>
					<tr>
						<th scope="col">STT</th>
						<th scope="col">Mã người QT</th>
						<th scope="col">Họ và tên</th>
						<th scope="col" >Ngày sinh</th>
						<th scope="col" >Giới tính</th>
						<th scope="col" >Email1</th>
						<th scope="col" >Email2</th>
						<th scope="col" >SDT1</th>
						<th scope="col" >SDT2</th>
						<th scope="col" >Quê quán</th>
						<th scope="col" ></th>
					</tr>
				</thead>
				<tbody>
					<%int count = 1; %>
					<c:forEach items="${listNguoiQT}" var="admin">
						<tr class="body">
						<td><%=count %></td>
						<td>${admin.maNguoiQT }</td>
						<td>${admin.hoTen }</td>
						<td>${admin.ngaySinh }</td>
						<td>${admin.gioiTinh }</td>
						<td>${admin.getEmail1() }</td>
						<td>${admin.getEmail2() }</td>
						<td>${admin.SDT1 }</td>
						<td>${admin.SDT2 }</td>
						<td>${admin.queQuan }</td>
						<td><a href="ctnguoiqt.htm?id=${admin.maNguoiQT}">Chi tiết</a></td>
					</tr>
					<%count += 1; %>
					</c:forEach>
				</tbody>
			</table>
		</form>
	</div>
</body>
<%} %>
</html>