<%@page import="model.TaiKhoan"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Danh sách khóa học</title>
<script>
    // check if message is not empty
    var message = "${mgs_updateKH}";
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
			<form class="search-form" action="timkiemKH.htm" method="post">
				<input type="text" id="searchInput" name="maKH" value="${maKH }"
					placeholder="Nhập mã KH">
				<button type="submit">Tìm kiếm</button>
			</form>
		</div>
		<form action="danhsachkhoahoc.htm" method="post">
			<table class="table table-success table-striped" style="text-align: center;">
				<thead>
					<tr>
						<th scope="col">STT</th>
						<th scope="col">Mã khóa học</th>
						<th scope="col">Năm bắt đầu</th>
						<th scope="col">Năm kết thúc</th>
						<th scope="col" ></th>
					</tr>
				</thead>
				<tbody>
					<%int count = 1; %>
					<c:forEach items="${listKhoaHoc}" var="khoaHoc">
						<tr class="body">
						<td><%=count %></td>
						<td>${khoaHoc.maKH }</td>
						<td>${khoaHoc.namBD }</td>
						<td>${khoaHoc.namKT }</td>
						<td><a href="ctkhoahoc.htm?id=${khoaHoc.maKH}">Chi tiết</a></td>
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