<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&family=Roboto:wght@300;400;500;700&display=swap"
	rel="stylesheet">
<title>Thêm học kì</title>
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

.form {
	display: flex;
	justify-content: space-between;
}

.right-form {
	width: 48%;
}

.left-form {
	width: 48%;
}

.form input {
	width: calc(100% - 10px);
	height: 38px;
	border-radius: 8px;
	border: 1px solid #e0dfdf;
	outline: none;
	padding-left: 10px;
	margin-top: 8px;
}

.form input:hover {
	border: 1px solid #bebebe;
}

.top-input {
	margin-bottom: 24px;
}

.bottom-input {
	
}

.submit-btn {
	display: flex;
	justify-content: center;
	width: 100%;
	margin-top: 20px;
}

.submit {
	width: 160px;
	height: 40px;
	font-size: 16px;
	border-radius: 8px;
	outline: none;
	border: none;
	color: #fff;
	background-color: #188754;
}

.submit:hover {
	background-color: #1fa366;
}
</style>
<script>
    // check if message is not empty
    var message = "${mgs_InsertHK}";
    if (message !== "") {
        alert(message);
    }
</script>
</head>
<body>
	<%@include file="header_admin.jsp"%>
	<div class="container">
		<div class="content-wrapper">
			<form class="content" action="themhocki.htm" method="post">
				<div class="form">
					<div class="right-form">
						<div class="top-input">
							<label for="idHocKi">Mã học kì</label><br> <input
								type="text" class="idHocKi" id="idHocKi" name="maHK" required placeholder="VD: HK12022">
						</div>
					</div>
					<div class="left-form">
						<div class="top-input">
							<label for="startHocKi">Ngày bắt đầu học kì</label><br> <input
								type="date" class="startHocKi" id="startHocKi" name="ngayBD"
								required>
						</div>
						<div class="bottom-input">
							<label for="endHocKi">Ngày kết thúc học kì</label><br> <input
								type="date" class="endHocKi" id="endHocKi" name="ngayKT"
								required>
						</div>
					</div>
				</div>
				<br>

				<div class="submit-btn">
					<input type="submit" class="submit" value="Thêm học kì">
				</div>
			</form>
		</div>
	</div>
</body>
</html>