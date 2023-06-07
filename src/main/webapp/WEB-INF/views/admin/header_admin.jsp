<%@page import="model.TaiKhoan"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author"
	content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Hugo 0.108.0">

<link rel="canonical"
	href="https://getbootstrap.com/docs/5.3/examples/navbar-static/">

<link
	href="<c:url value='/resource/assets/dist/css/bootstrap.min.css'/>"
	rel="stylesheet">

<style>
.bd-placeholder-img {
	font-size: 1.125rem;
	text-anchor: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	user-select: none;
}

@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
}

.b-example-divider {
	height: 3rem;
	background-color: rgba(0, 0, 0, .1);
	border: solid rgba(0, 0, 0, .15);
	border-width: 1px 0;
	box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em
		rgba(0, 0, 0, .15);
}

.b-example-vr {
	flex-shrink: 0;
	width: 1.5rem;
	height: 100vh;
}

.bi {
	vertical-align: -.125em;
	fill: currentColor;
}

.nav-scroller {
	position: relative;
	z-index: 2;
	height: 2.75rem;
	overflow-y: hidden;
}

.nav-scroller .nav {
	display: flex;
	flex-wrap: nowrap;
	padding-bottom: 1rem;
	margin-top: -1px;
	overflow-x: auto;
	text-align: center;
	white-space: nowrap;
	-webkit-overflow-scrolling: touch;
}
</style>
<!-- Custom styles for this template -->
<link href="<c:url value='/resource/css/navbar-static.css'/>"
	rel="stylesheet">
</head>
<body>
 	<div>
		<img alt="" class="img-fluid" src="<c:url value='/resource/logo/ptit.png'/> ">
	</div>
	<nav class="navbar navbar-expand-md"
		style="background: rgba(255, 116, 133, 0.9);">
		
		<div class="container-fluid">
			<a class="navbar-brand" href="index_admin.htm" style="font-size: 15px">Trang chủ</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarCollapse"
				aria-controls="navbarCollapse" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarCollapse">

				<ul class="navbar-nav me-auto mb-2 mb-md-0">
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" data-bs-toggle="dropdown" aria-expanded="false"> 
							Quản lí tài khoản 
						</a>
						<div class="dropdown-menu" aria-labelledby="navbarDropdown">
							<a class="dropdown-item" href="themtaikhoan.htm">Thêm tài khoản</a> 
							<a class="dropdown-item" href="danhsachtaikhoan.htm">Danh sách tài khoản</a>
						</div></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
						data-bs-toggle="dropdown" aria-expanded="false"> Danh sách người dùng</a>
						<div class="dropdown-menu" aria-labelledby="navbarDropdown">
							<a class="dropdown-item" href="danhsachnguoiqt.htm">Danh sách người quản trị</a> 
							<a class="dropdown-item" href="danhsachgiangvien.htm">Danh sách giảng viên</a>
							<a class="dropdown-item" href="danhsachsinhvien.htm">Danh sách sinh viên</a> 
						</div></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
						data-bs-toggle="dropdown" aria-expanded="false"> Quản lí khóa học </a>
						<div class="dropdown-menu" aria-labelledby="navbarDropdown">
							<a class="dropdown-item" href="themkhoahoc.htm">Thêm khóa học</a> <a
								class="dropdown-item" href="danhsachkhoahoc.htm">Danh sách khóa học</a>
						</div></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
						data-bs-toggle="dropdown" aria-expanded="false"> Quản lí học kì </a>
						<div class="dropdown-menu" aria-labelledby="navbarDropdown">
							<a class="dropdown-item" href="themhocki.htm">Thêm học kì</a> <a
								class="dropdown-item" href="danhsachhocki.htm">Danh sách học kì</a> 
						</div></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
						data-bs-toggle="dropdown" aria-expanded="false"> Quản lí lớp</a>
						<div class="dropdown-menu" aria-labelledby="navbarDropdown">
							<a class="dropdown-item" href="themlop.htm">Thêm lớp</a> <a
								class="dropdown-item" href="danhsachlop.htm">Danh sách lớp</a> 
						</div></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
						data-bs-toggle="dropdown" aria-expanded="false"> Quản lí môn
							học </a>
						<div class="dropdown-menu" aria-labelledby="navbarDropdown">
							<a class="dropdown-item" href="themmonhoc.htm">Thêm môn học</a> <a
								class="dropdown-item" href="danhsachmonhoc.htm">Danh sách môn học</a> 
						</div>
					</li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
						data-bs-toggle="dropdown" aria-expanded="false"> Lớp tín chỉ </a>
						<div class="dropdown-menu" aria-labelledby="navbarDropdown">
							<a class="dropdown-item" href="themloptinchi.htm">Thêm lớp tín chỉ</a> <a
								class="dropdown-item" href="danhsachloptinchi.htm">Danh sách lớp tín chỉ</a> 
						</div>
					</li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
						data-bs-toggle="dropdown" aria-expanded="false"> Quản lí điểm</a>
						<div class="dropdown-menu" aria-labelledby="navbarDropdown">
							<a class="dropdown-item" href="nhapdiem.htm">Nhập/chỉnh sửa điểm</a> 
							<a class="dropdown-item" href="xemdiembyad.htm">Xem điểm</a>
							<!-- <a class="dropdown-item" href="thongkebyad.htm">Thống kê</a> -->
						</div>
					</li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
						data-bs-toggle="dropdown" aria-expanded="false">Thông tin tài khoản</a>
						<div class="dropdown-menu" aria-labelledby="navbarDropdown">
							<a class="dropdown-item" href="thongtincanhan.htm">Thông tin cá nhân</a> 
							<a class="dropdown-item" href="changepass.htm">Đổi mật khẩu</a>
						</div>
					</li>
				</ul>
				<form action="logout.htm" method="post">
					<button class="btn btn-info" type="submit" >Đăng xuất</button>
				</form>
			</div>
		</div>
	</nav>

	<script
		src="<c:url value='/resource/assets/dist/js/bootstrap.bundle.min.js'/>"></script>


</body>
</html>
