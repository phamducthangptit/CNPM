<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<script>
	// check if message is not empty
	var message = "${mgs_updateHK}";
	if (message !== "") {
		alert(message);
	}
</script>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&family=Roboto:wght@300;400;500;700&display=swap"
	rel="stylesheet">
<title>Danh sách học kì</title>
<style>
html {
	font-family: 'Poppins', sans-serif;
}

body, h1, h4, btn, input {
	padding: 0;
	margin: 0;
}

ul, li {
	margin: 0;
	padding: 0;
	list-style: none;
}

.logo-slogan {
	display: flex;
	height: 160px;
	cursor: default;
	-webkit-user-select: none;
	-ms-user-select: none;
	user-select: none;
}

.logo-wrapper {
	display: flex;
	align-items: center;
	height: 100%;
	margin-left: 4px;
	margin-right: 24px;
}

.logo {
	height: 90%;
}

.slogan {
	margin-top: 30px;
}

.top {
	line-height: 44px;
	text-transform: uppercase;
	color: #df251f;
}

.mid {
	line-height: 44px;
	text-transform: uppercase;
	color: #df251f;
	margin-bottom: 4px;
}

.bottom {
	font-size: 18px;
}

.option {
	display: flex;
	align-items: center;
	justify-content: space-around;
	height: 60px;
	background-color: #ff8290;
}

.item {
	position: relative;
	line-height: 10px;
	cursor: pointer;
}

.item:not(:first-child):not(:last-child) {
	padding-right: 12px;
}

.item:not(:first-child):not(:last-child)::after {
	position: absolute;
	content: "";
	top: 0;
	width: 0;
	height: 0;
	margin-left: 12px;
	border-left: 6px solid transparent;
	border-right: 6px solid transparent;
	border-top: 6px solid #000;
}

.item:not(:first-child):not(:last-child):hover::after {
	
}

.btn {
	width: 100px;
	height: 40px;
	background-color: #0ccbf0;
	border-radius: 8px;
	border: none;
	font-size: 16px;
	cursor: pointer;
}

.btn:hover {
	background-color: #75daee;
}

.content-wrapper {
	display: flex;
	justify-content: center;
}

.content {
	width: 1600px;
	margin-top: 40px;
}

.title-option {
	display: flex;
	width: 100%;
	background-color: #d1e6dd;
	border: 0.5px solid #bfcfc7;
	cursor: default;
	-webkit-user-select: none;
	-ms-user-select: none;
	user-select: none;
}

.title-item {
	font-size: 18px;
	font-weight: 600;
	line-height: 40px;
	text-align: center;
}

.title-item:first-child {
	width: 10%;
}

.title-item:nth-child(2) {
	width: 13%;
}

.title-item:nth-child(3) {
	width: 15%;
}

.title-item:nth-child(4) {
	width: 31%;
}

.title-item:nth-child(5) {
	width: 31%;
}

.element-option {
	display: flex;
	width: 100%;
	background-color: #d1e6dd;
	border: 0.5px solid #bfcfc7;
}

.element-option:hover {
	background-color: #e2f0ea;
}

.element-item {
	font-size: 16px;
	font-weight: 500;
	line-height: 40px;
	text-align: center;
}

.element-item:first-child {
	width: 10%;
}

.element-item:nth-child(2) {
	width: 13%;
}

.element-item:nth-child(3) {
	width: 15%;
}

.element-item:nth-child(4) {
	width: 31%;
}

.element-item:nth-child(5) {
	width: 31%;
}

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
			<form class="search-form" action="timkiemHK.htm" method="post">
				<input type="text" id="searchInput" name="maHK" value="${maHK }"
					placeholder="Nhập mã HK">
				<button type="submit">Tìm kiếm</button>
			</form>
		</div>
		<form action="danhsachhocki.htm" method="post">
			<table class="table table-success table-striped"
				style="text-align: center;">
				<thead>
					<tr>
						<th scope="col">STT</th>
						<th scope="col">Mã Học kì</th>
						<th scope="col">Ngày bắt đầu</th>
						<th scope="col">Ngày kết thúc</th>
						<th scope="col"></th>
					</tr>
				</thead>
				<tbody>
					<%
					int count = 1;
					%>
					<c:forEach items="${listHocKi}" var="hocKi">
						<tr class="body">
							<td><%=count%></td>
							<td>${hocKi.maHK }</td>
							<td>${hocKi.ngayBD }</td>
							<td>${hocKi.ngayKT }</td>
							<td><a href="cthocki.htm?id=${hocKi.maHK}">Chi tiết</a></td>
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
</html>