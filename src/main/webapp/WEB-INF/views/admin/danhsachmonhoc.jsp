<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Danh sách môn học</title>
<script>
    // check if message is not empty
    var message = "${mgs_updateMH}";
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
<body>
<%@include file="header_admin.jsp"%>
	<div class="container mt-4">
			<div class="search-container">
			<form class="search-form" action="timkiemMH.htm" method="post">
				<input type="text" id="searchInput" name="maMH" value="${maMH }"
					placeholder="Nhập mã MH">
				<button type="submit">Tìm kiếm</button>
			</form>
		</div>
		<form action="danhsachmonhoc.htm" method="post">
			<table class="table table-success table-striped" style="text-align: center;">
				<thead>
					<tr>
						<th scope="col">STT</th>
						<th scope="col">Mã môn học</th>
						<th scope="col">Tên môn học</th>
						<th scope="col">STC</th>
						<th scope="col" >STCHP</th>
						<th scope="col" >% ĐiểmCC</th>
						<th scope="col" >% ĐiểmSE</th>
						<th scope="col" >% ĐiểmTH</th>
						<th scope="col" >% ĐiểmKT</th>
						<th scope="col" >% ĐiểmTHI</th>
						<th scope="col" ></th>
					</tr>
				</thead>
				<tbody>
					<%int count = 1; %>
					<c:forEach items="${listMonHoc}" var="monHoc">
						<tr class="body">
						<td><%=count %></td>
						<td>${monHoc.maMH }</td>
						<td>${monHoc.tenMH }</td>
						<td>${monHoc.STC }</td>
						<td>${monHoc.STCHP }</td>
						<td>${monHoc.phanTramDiemCC }</td>
						<td>${monHoc.phanTramDiemSe }</td>
						<td>${monHoc.phanTramDiemTH }</td>
						<td>${monHoc.phanTramDiemKT }</td>
						<td>${monHoc.phanTramDiemThi }</td>
						<td><a href="ctmonhoc.htm?id=${monHoc.maMH }">Chi tiết</a></td>
					</tr>
					<%count += 1; %>
					</c:forEach>
				</tbody>
			</table>
		</form>
	</div>
</body>
</html>