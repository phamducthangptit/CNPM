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
			<a class="navbar-brand" href="index_teacher.htm" style="font-size: 15px">Trang chủ</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarCollapse"
				aria-controls="navbarCollapse" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarCollapse">

				<ul class="navbar-nav me-auto mb-2 mb-md-0">
					<li class="nav-item">
					<a class="nav-link active" href="thongtingiangvien.htm" aria-current="page">Sửa thông tin cá nhân</a>
					</li>
					<li class="nav-item">
					<a class="nav-link active" href="changepass.htm" aria-current="page">Đổi mật khẩu</a>
					</li>
					<li class="nav-item">
					<a class="nav-link active" href="dssv.htm" aria-current="page"> Xem danh sách sinh viên </a>
					</li>
<!-- 					<li class="nav-item dropdown">
					<a class="nav-link active" href="thongkebygv.htm" aria-current="page"> Thống kê </a>
					</li> -->
					<li class="nav-item dropdown">
					<a class="nav-link active" href="xemdiemsv.htm" aria-current="page"> Xem điểm </a>
					</li>
					<li class="nav-item dropdown">
					<a class="nav-link active" href="nhapdiemsvltc.htm" aria-current="page">Nhập điểm</a>
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
