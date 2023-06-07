<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&family=Roboto:wght@300;400;500;700&display=swap" rel="stylesheet">
    <title>Đăng kí môn học</title>
    <style>
         html {
            font-family: "Poppins", sans-serif;
        }
        body, h1, h4, btn, input, p {
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
        .item:hover:not(:last-child) {
            padding-bottom: 8px;
        }
        .item:not(:first-child):not(:last-child){
            /* padding-right: 12px;  */
        }

        .item:not(:first-child):not(:last-child)::after {
            /* position: absolute;
            content: "";
            top: 0;
            width: 0; 
            height: 0;
            margin-left: 12px; 
            border-left: 6px solid transparent;
            border-right: 6px solid transparent;
            border-top: 6px solid #000; */
        }

        .item:not(:first-child):not(:last-child):hover::after {
            
        }

        .btn {
            width: 100px;
            height: 40px;
            background-color: #0ccbf0;
            border-radius: 8px;
            /* border: none; */
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

        .search-wrapper {
            width: 100%;
            margin-bottom: 30px;
        }

        .top-search {
            display: flex;
        }
        .search-title {

        }

        .top-search form {
            display: flex;
        }
        .search-input {
            width: 200px;
            height: 20px;
            margin-left: 12px;
            margin-right: 12px;
            outline: none;
        }
        
        .search-btn {
            width: 65px;
            height: 24px;
            font-size: 14px;
            border-radius: 4px;
            outline: none;
            border: none;
            color: #fff;
            background-color: #188754;
        }
        .search-btn:hover {
            background-color: #1fa366;
        }

        .subject-wrapper {
            width: 100%;
            margin-bottom: 30px;
        }
        .title-wrapper {
            
        }
        .title-option {
            display: flex;
            background-color: #d1e6dd;
            margin: 0;
            padding: 0;
            /* border: 0.5px solid #bfcfc7; */
        }
        .title-item {
            font-size: 16px;
            font-weight: 600;
            line-height: 40px;
            text-align: center;
            list-style: none;
        }
        .title-item:first-child {
            width: 2%;
        }
        .title-item:nth-child(2) {
            width: 8%;
        }
        .title-item:nth-child(3) {
            width: 22%;
        }
        .title-item:nth-child(4) {
            width: 4%;
        }
        .title-item:nth-child(5) {
            width: 4%;
        }
        .title-item:nth-child(6) {
            width: 4%;
        }
        .title-item:nth-child(7) {
            width: 10%;
        }
        .title-item:nth-child(8) {
            width: 5%;
        }
        .title-item:nth-child(9) {
            width: 5%;
        }
        .title-item:nth-child(10) {
            width: 18%;
        }
        .title-item:nth-child(11) {
            width: 18%;
        }
        .element-wrapper {

        }
        .element-option {
            display: flex;
            background-color: #d1e6dd;
            margin: 0;
            padding: 0;
            /* border: 0.5px solid #bfcfc7; */
        }
        .element-item {
            text-align: center;
            list-style: none;
        }
        .element-item:first-child {
            width: 2%;
        }
        .element-item:nth-child(2) {
            width: 8%;
        }
        .element-item:nth-child(3) {
            width: 22%;
        }
        .element-item:nth-child(4) {
            width: 4%;
        }
        .element-item:nth-child(5) {
            width: 4%;
        }
        .element-item:nth-child(6) {
            width: 4%;
        }
        .element-item:nth-child(7) {
            width: 10%;
        }
        .element-item:nth-child(8) {
            width: 5%;
        }
        .element-item:nth-child(9) {
            width: 5%;
        }
        .element-item:nth-child(10) {
            width: 18%;
        }
        .element-item:nth-child(11) {
            width: 18%;
        }
        .subElement {
            display: flex;
            flex-direction: column;
        }
        .top-element {
            /* border-bottom: 0.25px solid #bfcfc7;
            border-left: 0.25px solid #bfcfc7; */
        }
        .bottom-element {
            /* border-bottom: 0.25px solid #bfcfc7;
            border-left: 0.25px solid #bfcfc7; */
        }

        .subed-wrapper {
            width: 100%;
        }   
        
        .subed-tittle {

        }
        .subed-content {
            width: 100%;
        }

         .subed-content .title-item:first-child {
            width: 2%;
        }
         .subed-content .title-item:nth-child(2) {
            width: 8%;
        }
         .subed-content .title-item:nth-child(3) {
            width: 22%;
        }
         .subed-content .title-item:nth-child(4) {
            width: 4%;
        }
         .subed-content .title-item:nth-child(5) {
            width: 4%;
        }
         .subed-content .title-item:nth-child(6) {
            width: 4%;
        }
         .subed-content .title-item:nth-child(7) {
            width: 18%;
        }
         .subed-content .title-item:nth-child(8) {
            width: 18%;
        }
         .subed-content .title-item:nth-child(9) {
            width: 20%;
        }

        .subed-content .element-item:first-child {
            width: 2%;
        }
         .subed-content .element-item:nth-child(2) {
            width: 8%;
        }
         .subed-content .element-item:nth-child(3) {
            width: 22%;
        }
         .subed-content .element-item:nth-child(4) {
            width: 4%;
        }
         .subed-content .element-item:nth-child(5) {
            width: 4%;
        }
         .subed-content .element-item:nth-child(6) {
            width: 4%;
        }
         .subed-content .element-item:nth-child(7) {
            width: 18%;
        }
         .subed-content .element-item:nth-child(8) {
            width: 18%;
        }
         .subed-content .element-item:nth-child(9) {
            width: 20%;
        }

        .subed-content .element-input {
            width: 100%;
            font-size: 16px;
            text-align: center;
            background-color: #d1e6dd;
            border: none;
            outline: none;
        }
        .form-subSubject {
            width: 100%;
            text-align: center;
        }

        .btn-subSubject {
            width: 65px;
            height: 24px;
            font-size: 14px;
            margin-top: 8px;
            border-radius: 4px;
            outline: none;
            border: none;
            color: #fff;
            background-color: #188754;
        }

        .btn-subSubject:hover {
            background-color: #1fa366;
        }

        .sub-hidden {
            display: none;
            background-color: #699f86;
            text-align: center;
        }
    </style>
</head>
<body>
   
<%@include file="header_student.jsp"%>
	<div class="content-wrapper">
		<div class="content">
<!-- 			<div class="search-wrapper">
				<div class="top-search">
					<p class="search-title">Lọc theo môn học:</p>
					<input class="search-input" name="searchValue" type="text">
					<input type="submit" ib="submit" class="search-btn" value="Lọc >>">
				</div>
			</div> -->
			<form action="thuchiendkimonhoc.htm" method="post">
			<div class="subject-wrapper">
				<div class="title-wrapper">
					<ul class="title-option">
						<li class="title-item"></li>
						<li class="title-item">Mã MH</li>
						<li class="title-item">Tên môn học</li>
						<li class="title-item">TTH</li>
						<li class="title-item">STC</li>
						<li class="title-item">STCHP</li>
						<li class="title-item">Mã lớp</li>
						<li class="title-item">Sĩ Số</li>
						<li class="title-item">CL</li>
						<li class="title-item">Ngày bắt đầu</li>
						<li class="title-item">Ngày kết thúc</li>
					</ul>
				</div>
				<div class="element-wrapper">
					<c:forEach items="${listLopTC}" var="ltc">
					<input type="hidden" value="${ltc.hocKi.maHK }" name="maHK">
						<ul class="element-option">
							<li class="element-item"><input type="checkbox"
								name="checkedTop" checkState="false" onclick="handleCheck(this)">
							</li>
							<li class="element-item">${ltc.monHoc.maMH}</li>
							<li class="element-item">${ltc.monHoc.tenMH}</li>
							<li class="element-item">${ltc.maNhom}</li>
							<li class="element-item">${ltc.monHoc.STC}</li>
							<li class="element-item">${ltc.monHoc.STCHP}</li>
							<li class="element-item">${ltc.lop.maLop }</li>
							<li class="element-item">${ltc.slToiDa }</li>
							<li class="element-item">${ltc.slToiDa - ltc.slThucTeDK}</li>
							<li class="element-item">${ltc.ngayBD }</li>
							<li class="element-item">${ltc.ngayKT }</li>
						</ul>
					</c:forEach>
				</div>
			</div>
		
			<div class="subed-wrapper">
				<p class="subed-tittle">Danh sách môn đã chọn</p>
				<div class="subed-content">
					<form class="form-subSubject" action="" method="get">
						<ul class="title-option">
							<li class="title-item">STT</li>
							<li class="title-item">Mã MH</li>
							<li class="title-item">Tên môn học</li>
							<li class="title-item">TTH</li>
							<li class="title-item">STC</li>
							<li class="title-item">STCHP</li>
							<li class="title-item">Ngày bắt đầu</li>
							<li class="title-item">Ngày kết thúc</li>
							<li class="title-item">Trạng thái môn học</li>
						</ul>
						<div class="element-wrapper"></div>
						<input type="submit" class="btn-subSubject"
							onclick="handleNotification()" style="margin-left: 700px;"> <input
							class="btn-subSubject sub-hidden" value="Submit">
					</form>
				</div>
			</div>
			</form>
		</div>
	</div>
 <script>
        var html = []
        var listBoxChecked = []
        var limitCheck = 0
        const form = document.querySelector(".form-subSubject")
        
        function handleCheck(e, notification = "Chưa lưu vào cơ sở dữ liệu") {
            const checkTarget = e.parentNode.parentNode
            if(e.getAttribute("checkState") == "true") {
                limitCheck = limitCheck - parseInt(checkTarget.childNodes[9].innerText)
                unCheck(e, notification)
            } else {
                listBoxChecked.forEach(function(element) {
                    if(checkTarget.childNodes[3].innerText === element[0]) {
                        e.checked = false
                        e = null
                        //alert("Môn học này giống với môn học bạn từng chọn!")
                    }
                })
                if(e) {
                    limitCheck = limitCheck + parseInt(checkTarget.childNodes[9].innerText)
                }
                if(limitCheck > 21) {
                    limitCheck = limitCheck - parseInt(checkTarget.childNodes[9].innerText)
                    e.checked = false
                    e = null
                    alert("Vượt quá số tính chỉ cho phép!")
                }
                check(e, notification)
            }
            const subscribedSub = document.querySelector(".subed-content .element-wrapper")
            subscribedSub.innerHTML = html.join("") 
        }

        function check(e, notification) {
           if(e) {
                const checkTarget = e.parentNode.parentNode
                e.setAttribute("checkState", "true")
                listBoxChecked.push([checkTarget.childNodes[3].innerText, checkTarget.childNodes[7].innerText])
                html.push("<ul class=\"element-option\"><li class=\"element-item\" checkState=\""+ e.getAttribute("checkState") +"\">" + "i" + "</li><li class=\"element-item\"><input class=\"element-input\" name=\"idMonHoc\" value=\""+checkTarget.childNodes[3].innerText +"\"></li><li class=\"element-item\">" + checkTarget.childNodes[5].innerText + "</li><li class=\"element-item\"><input class=\"element-input\" name=\"thhMonHoc\" value=\"" + checkTarget.childNodes[7].innerText+"\"></li><li class=\"element-item\">"+ checkTarget.childNodes[9].innerText + "</li><li class=\"element-item\">" + checkTarget.childNodes[11].innerText +"</li><li class=\"element-item\">"+ checkTarget.childNodes[19].innerText +"</li><li class=\"element-item\">"+ checkTarget.childNodes[21].innerText +"</li><li class=\"element-item\">" + notification + "</li><li class=\"element-item\" style=\"display: none; width: 0 !important\"><input class=\"element-input\" name=\"idLop\" value=\""+checkTarget.childNodes[13].innerText +"\"></li></ul>")
                localStorage.setItem("Box", JSON.stringify(listBoxChecked))
           }
        }

        function unCheck (e, notification) {
            const checkTarget = e.parentNode.parentNode
            e.setAttribute("checkState", "false")
            listBoxChecked.forEach(function(element, index) {
                if(element[0] === checkTarget.childNodes[3].innerText && element[1] === checkTarget.childNodes[7].innerText) {
                    listBoxChecked.splice(index, 1)
                }
            })
            localStorage.setItem("Box", JSON.stringify(listBoxChecked))
            html.map(function(element, index) {
                var wrapper= document.createElement("div");
                    wrapper.innerHTML= element
                    var div= wrapper.firstChild
                    if(div.childNodes[1].childNodes[0].getAttribute("value") === checkTarget.childNodes[3].innerText && div.childNodes[3].childNodes[0].getAttribute("value") === checkTarget.childNodes[7].innerText) {
                        html.splice(index, 1)
                    }
            })
        }
        
        function handleNotification() {
            localStorage.setItem("isNotification", true)
        }

        
        window.onload = function() {
            const checkTopBoxs = document.querySelectorAll("input[name=checkedTop]")
            const bottomElements = document.querySelectorAll(".element-item .bottom-element")
            const topElements = document.querySelectorAll(".element-item .top-element")
            const submitButton = document.querySelector(".btn-subSubject")

            bottomElements.forEach( function(element) {
                if( element.innerText.length === 0 ) {
                    element.style.borderBottom = "none"
                }
            })

            topElements.forEach(function(element) {
                if( element.innerText.length === 0 ) {
                    element.style.borderBottom = "none"
                }
            })

            var  notification = JSON.parse(localStorage.getItem("isNotification")) ? "Đã lưu vào cơ sở dữ liệu" :  "Chưa lưu vào cơ sở dữ liệu"
            const listBox = JSON.parse(localStorage.getItem("Box"))
            if(listBox != null) {
                checkTopBoxs.forEach( function(topBox) {
                const checkTarget = topBox.parentNode.parentNode
                listBox.forEach( function(box){
                    if(box[0] === checkTarget.childNodes[3].innerText && box[1] === checkTarget.childNodes[7].innerText ) {
                        topBox.checked = true
                        handleCheck(topBox, notification)
                    }
                }) 
            })}

            if(JSON.parse(localStorage.getItem("isSubmitted")) && limitCheck >= 21) {
                const listCheckBox = document.querySelectorAll("input[checkState=true]")
                const submitBtn = document.querySelector(".btn-subSubject")
            
                listCheckBox.forEach(function(box){
                    box.setAttribute("disabled", true)
                })

                submitBtn.setAttribute("disabled", true)
            }
        }
        form.addEventListener("submit", function(event) {
            event.preventDefault()
            localStorage.setItem("isSubmitted", true)
            this.submit()
        })
        const formlogout = document.querySelector(".form-logout")
		formlogout.addEventListener("submit", function() {
			event.preventDefault()
			localStorage.clear()
			this.submit()
			})
    </script>
</body>
</html> 

