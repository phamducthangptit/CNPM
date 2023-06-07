<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Chi tiết môn học</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&family=Roboto:wght@300;400;500;700&display=swap" rel="stylesheet">
    <title>Thêm môn học</title>
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
            cursor:default;
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

        .item:not(:first-child):not(:last-child){
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
            margin-bottom: 24px;
        }
        .form input:hover {
            border: 1px solid #bebebe;
        }
        .input {
            margin-bottom: 24px;
        }
        .wrapper1,.wrapper2 {
            display: flex;
            justify-content: space-between;
        }
        .input3-right, .input4-right {
            width: 46%;
        }
        .input1-left, .input2-left {
            width: 46%;
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
</head>
<body>
	<%@include file="header_admin.jsp"%>
	<c:forEach items="${listMonHoc}" var="monHoc">
		<c:if test="${monHoc.maMH == idMH}">
			<div class="container">
				<div class="content-wrapper">
					<form class="content" action="chinhsuamonhoc.htm" method="post">
						<div class="form">
							<div class="right-form">
								<div class="input1-right">
									<label for="idMh">Mã Môn Học</label><br> <input
										type="text" class="idMh" id="idMh" name="idMh" required
										value="${monHoc.maMH }" readonly="readonly">
								</div>
								<div class="input2-right">
									<label for="tenMh">Môn Học</label><br> <input type="text"
										class="tenMh" id="tenMh" name="tenMh" required
										value="${monHoc.tenMH }">
								</div>
								<div class="wrapper1">
									<div class="input3-right">
										<label for="stc">Số tín chỉ</label><br> <input
											type="number" class="stc" id="stc" name="stc" required
											value="${monHoc.STC }">
									</div>
									<div class="input4-right">
										<label for="stchp">Số tín chỉ học phần</label><br> <input
											type="number" class="stchp" id="stchp" name="stchp" required
											value="${monHoc.STCHP }">
									</div>
								</div>
							</div>

							<div class="left-form">
								<div class="wrapper1">
									<div class="input1-left">
										<label for="%dcc">%Điểm chuyên cần</label><br> <input
											type="number" class="%dcc" id="%dcc" name="%dcc"
											required value="${monHoc.phanTramDiemCC }">
									</div>
									<div class="input2-left">
										<label for="%dse">%Điểm tiểu luận(Se)</label><br> <input
											type="number" class="%dse" id="%dse" name="%dse" 
											required value="${monHoc.phanTramDiemSe}">
									</div>
								</div>
								<div class="wrapper2">
									<div class="input1-left">
										<label for="%dkt">%Điểm kiểm tra</label><br> <input
											type="number" class="%dkt" id="%dkt" name="%dkt" 
											required value="${monHoc.phanTramDiemKT }">
									</div>
									<div class="input2-left">
										<label for="%dth">%Điểm thực hành</label><br> <input
											type="number" class="%dth" id="%dth" name="%dth" 
											required value="${monHoc.phanTramDiemTH }">
									</div>
								</div>
								<div class="wrapper3">
									<label for="%dt">%Điểm thi</label><br> <input
										type="number" class="%dt" id="%dt" name="%dt" 
										required value="${monHoc.phanTramDiemThi }">
								</div>
							</div>
						</div>
						<br>

						<div class="submit-btn">
							<button type="submit" class="btn btn-success"
								style="width: 200px" name="saveMH" value="SaveMH">Lưu môn học</button>
							<button type="submit" class="btn btn-success"
								style="width: 200px; margin-left: 4px;" name="deleteMH"
								value="DeleteMH">Xóa môn học</button>
						</div>
					</form>
				</div>
			</div>
		</c:if>
	</c:forEach>
	<script>
       
        const checkHk = () => {
            const stc = document.getElementById('stc')
            const stchp = document.getElementById('stchp')
            const dcc = document.getElementById('%dcc')
            const dse = document.getElementById('%dse')
            const dth = document.getElementById('%dth')
            const dkt = document.getElementById('%dkt')
            const dt = document.getElementById('%dt')

            if(stc.value >= 1 && stc.value <= 4) {
                stc.value = stc.value
            } else {
                stc.value = ''
            }
        }

        window.onload = () => {
            document.getElementById('stc').oninput = checkHk
            document.getElementById('%dcc').oninput = checkHk
            document.getElementById('%dse').oninput = checkHk
            document.getElementById('%dth').oninput = checkHk
            document.getElementById('%dkt').oninput = checkHk
            document.getElementById('%dt').oninput = checkHk
        }
    </script>
</body>
</html>