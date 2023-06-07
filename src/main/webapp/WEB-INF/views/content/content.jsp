<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <!-- <meta http-equiv="X-UA-Compatible" content="IE=edge"> -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<!--     <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin> -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&family=Roboto:wght@300;400;500;700&display=swap" rel="stylesheet">
    <title>Document</title>
    <style>
        .content-wrapper {
            display: flex;
            justify-content: center;
        }
        .content {
            width: 1600px;
            margin-top: 20px;
        }
        .ad-img-wrapper {
            width: 100%;
            text-align: center;
            margin-top: 8px;
        }
        .ad-img {
            border-radius: 8px;
            width: 80%;
            box-sizing: border-box;
            height: auto;
        }
      
        * {box-sizing: border-box}
img {vertical-align: middle; height: 460px;}

/* Slideshow container */
.slideshow-container {
    max-width: 80%;
    position: relative;
    margin: auto;
}

/* Next & previous buttons */
.prev, .next {
  cursor: pointer;
  position: absolute;
  top: 50%;
  width: auto;
  padding: 16px;
  margin-top: -22px;
  color: white;
  font-weight: bold;
  font-size: 18px;
  transition: 0.6s ease;
  border-radius: 0 3px 3px 0;
  user-select: none;
}

/* Position the "next button" to the right */
.next {
  right: 0;
  border-radius: 3px 0 0 3px;
}

/* On hover, add a black background color with a little bit see-through */
/* .prev:hover, .next:hover {
  background-color: rgba(0,0,0,0.8);
} */

/* Caption text */
/* .text {
  color: #f2f2f2;
  font-size: 15px;
  padding: 8px 12px;
  position: absolute;
  bottom: 8px;
  width: 100%;
  text-align: center;
} */

/* Number text (1/3 etc) */
.numbertext {
  color: #f2f2f2;
  font-size: 12px;
  padding: 8px 12px;
  position: absolute;
  top: 0;
}

/* The dots/bullets/indicators */
/* .dot {
  cursor: pointer;
  height: 15px;
  width: 15px;
  margin: 0 2px;
  background-color: #bbb;
  border-radius: 50%;
  display: inline-block;
  transition: background-color 0.6s ease;
}
 */
/* .active, .dot:hover {
  background-color: #717171;
}
 */
/* Fading animation */
.fade {
  animation-name: fade;
  animation-duration: 1.5s;
}

.stateIndex {
    position: absolute;
    bottom: 0;
    left: 50%;
    transform: translateX(-50%);
}

.more-info {
   
}
.more-info .info-title {
    text-align: center;
}
.info-title {
    font-weight: 300;
}

.info-wrapper {
    display: flex;
    justify-content: center;
}
.info-option+.info-option {
   margin-left: 100px;
}

.info-item:first-child {
    margin-bottom: 30px;
}
.info-text {}
@keyframes fade {
  from {opacity: .4} 
  to {opacity: 1}
}

.bottom-content {
    display: flex;
    width: 80%;
    justify-content: space-between;
    margin: auto;
    margin-top: 8px;
}

.sponsorsSlice {
    position: relative;
    display: flex;
    width: 50%;
    height:360px;
    text-align: center;
    margin: auto;
    margin-top: 20px;
    margin-bottom: 20px;
}
.mySponsorsSlice {
    width: 70%;
    height: 100%;
    margin: auto;
    border-radius: 20px;
    overflow: hidden;
}
.mySponsorsSlice p {
    position: absolute;
    top: 0;
    left: 50%;
    transform: translateX(-50%);
}
.sponsorsImg {
    width: 100%;
    height: 100%;
}
.stateIndex.sponsors {
    position: absolute;
    bottom: 0;
    left: 50%;
    transform: translateX(-50%);
}

.map-wrapper {
    width: 50%;
    text-align: center;
    margin-top: 20px;
    margin-bottom: 20px;
}

.map {
    width: 70%; 
    height: 360px;
    border: 0;
    border-radius: 20px;
}

.logo-meaning-wrapper {
    width: 80%;
    margin: auto;
    margin-top: 50px;
    margin-bottom: 50px;
}
.logo-meaning {
    width: 100%;
    text-align: center;
    margin-bottom: 20px;
}

.logo-meaning-title {
    font-size: 24px;
    line-height: 25px;
    text-transform: uppercase;
    color: #d30000;
    font-weight: 600;
}
.logo-meaning-img {
    width: 72px;
    height: 92px;
}
.text-meaning {
    background-color: #fde0e0;
    border-radius: 8px;
    padding: 16px;
}
.text-meaning-title {
    margin: 0;
    margin-bottom: 20px;
}
.text-meaning-content {
    margin: 0;
}

.text-meaning-content+.text-meaning-content {
    margin-bottom: 16px;
}
/* On smaller screens, decrease text size */
@media only screen and (max-width: 300px) {
  .prev, .next,.text {font-size: 11px}
}
    </style>
</head>
<body>
    <div class="content-wrapper">
        <div class="content">
            <div class="slideshow-container">

                <div class="mySlides fade">
                  <div class="numbertext">1 / 3</div>
                  <img src="https://portal.ptit.edu.vn/wp-content/uploads/2023/02/banner-web-01.jpg" style="width:100%">
                </div>
                
                <div class="mySlides fade">
                  <div class="numbertext">2 / 3</div>
                  <img src="https://portal.ptit.edu.vn/wp-content/uploads/2021/11/banner-web-triet-ly-giao-d%E1%BB%A5c.jpg" style="width:100%">
                </div>
                
                <div class="mySlides fade">
                  <div class="numbertext">3 / 3</div>
                  <img src="https://portal.ptit.edu.vn/wp-content/uploads/2022/06/banner_ptit_map.jpg" style="width:100%">
                </div>
                
                <a class="prev" onclick="plusSlides(-1)">❮</a>
                <a class="next" onclick="plusSlides(1)">❯</a>

                <div class="stateIndex" style="text-align:center">
                    <span class="dot" onclick="currentSlide(1)"></span> 
                    <span class="dot" onclick="currentSlide(2)"></span> 
                    <span class="dot" onclick="currentSlide(3)"></span> 
                </div>
            </div>
            <br>
              
            <div class="ad-img-wrapper">
                <img src="https://portal.ptit.edu.vn/wp-content/uploads/2022/08/baner_tuyendung.jpg" class="ad-img">
            </div>

            <div class="bottom-content">
                <div class="map-wrapper">
                    <iframe class="map" src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3918.52007250284!2d106.78447601524122!3d10.84799226083387!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31752772b245dff1%3A0xb838977f3d419d!2zSOG7jWMgdmnhu4duIEPDtG5nIG5naOG7hyBCQ1ZUIGPGoSBz4bufIHThuqFpIFRQLkhDTQ!5e0!3m2!1svi!2s!4v1677998605485!5m2!1svi!2s" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
                </div>
    
                <div class="sponsorsSlice">
                    <div class="mySponsorsSlice" style="height: auto;">
                       
                        <img class="sponsorsImg" src="https://portal.ptit.edu.vn/wp-content/uploads/2016/07/200601_Du-an-Motive_logo.png">
                    </div>
                    <div class="mySponsorsSlice">
                       
                        <img class="sponsorsImg" src="https://portal.ptit.edu.vn/wp-content/uploads/2022/06/VNPT1.png">
                    </div>
                    <div class="mySponsorsSlice">
                       
                        <img class="sponsorsImg" src="https://portal.ptit.edu.vn/wp-content/uploads/2021/11/Viettellogo.png">
                    </div>
                    <div class="mySponsorsSlice">
                       
                        <img class="sponsorsImg" src="https://portal.ptit.edu.vn/wp-content/uploads/2021/11/Logo-FPT-1l.png">
                    </div>
                    <div class="mySponsorsSlice">
                        
                        <img class="sponsorsImg" src="https://portal.ptit.edu.vn/wp-content/uploads/2022/06/HCL1.png">
                    </div>
                    <div class="mySponsorsSlice">
                        
                        <img class="sponsorsImg" src="https://portal.ptit.edu.vn/wp-content/uploads/2022/06/HCL1.png">
                    </div>
    
                </div>
            </div>

            <div class="logo-meaning-wrapper">
                <div class="logo-meaning">
                    <h2 class="logo-meaning-title">Ý NGHĨA LOGO HỌC VIỆN</h2>
                    <img class="logo-meaning-img" src="https://portal.ptit.edu.vn/wp-content/uploads/2016/06/ptitlogo72.gif">
                </div>
                <div class="text-meaning">
                    <h3 class="text-meaning-title">Hình khối của logo</h3>
                    <p class="text-meaning-content">Logo của Học viện thể hiện hình ảnh cô đọng nhất về Học viện. Khối Logo của Học viện bao gồm hình tròn và hình vuông. Theo quan niệm Á Đông, hình tròn tượng trưng cho sự sinh tồn vĩnh cửu của tự nhiên, nói lên sự đầy đủ, thịnh vượng và phát triển. Cũng theo ý nghĩa triết học Phương Đông, logo Học viện thể hiện mối quan hệ cơ bản: Thiên (tròn) – Địa (vuông) – Nhân (Học viện); trong đó Học viện là trung tâm. Cấu trúc logo mở thể hiện Học viện gắn liền với thực tiễn, với xã hội và luôn phát triển không ngừng.</p>
                    <p class="text-meaning-content">Ba vòng tròn quyện vào nhau và chuyển hóa sang nhau thể hiện 3 gắn kết: Đào tạo – Nghiên cứu – Sản xuất Kinh doanh.</p>
                    <p class="text-meaning-content">Hình ảnh quyển sách mở rộng và mô hình cấu trúc nguyên tử: biểu tượng 2 hoạt động chính của Học viện là đào tạo và nghiên cứu</p>
                    <p class="text-meaning-content">Chữ PTIT (tên viết tắt tiếng Anh của Học viện – Posts & Telecoms Institute of Technology) đồng thời là Bưu chính (P), Viễn thông (T) và Công nghệ thông tin (IT) – 3 lĩnh vực nghiên cứu và đào tạo của Học viện</p>
                    <h3 class="text-meaning-title">Màu sắc logo</h3>
                    <p class="text-meaning-content">Logo Học viện lấy màu đỏ làm chủ đạo và ngôi sao vàng biểu trưng cho cờ Tổ quốc Việt Nam.</p>
                </div>
            </div>
            

            <div class="more-info">
                <h3 class="info-title">HỌC VIỆN CÔNG NGHỆ BƯU CHÍNH VIỄN THÔNG</h3>
                <div class="info-wrapper">
                    <ul class="info-option">
                        <li class="info-item">
                            <p class="info-text">Trụ sở chính:</p>
                            <p class="info-text">122 Hoàng Quốc Việt, Q.Cầu Giấy, Hà Nội.</p>
                        </li>
                        <li class="info-item">
                            <p class="info-text">Cơ sở đào tạo tại Hà Nội:</p>
                            <p class="info-text">Km10, Đường Nguyễn Trãi, Q.Hà Đông, Hà Nội</p>
                        </li>
                    </ul>
                    <ul class="info-option">
                        <li class="info-item">
                            <p class="info-text">Học viện cơ sở tại TP. Hồ Chí Minh:</p>
                            <p class="info-text">11 Nguyễn Đình Chiểu, P. Đa Kao, Q.1 TP Hồ Chí Minh</p>
                        </li>
                        <li class="info-item">
                            <p class="info-text">Cơ sở đào tạo tại TP Hồ Chí Minh:</p>
                            <p class="info-text">Đường Man Thiện, P. Hiệp Phú, Q.9 TP Hồ Chí Minh</p>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <script>
        let slideIndex = 1
        let SponsorsSlideIndex = 1
        showSlides(slideIndex, SponsorsSlideIndex)
       
        setInterval(function() {
            showSlides(slideIndex += 1, SponsorsSlideIndex += 1)
        }, 4000)
        
        function plusSlides(n) {
            showSlides(slideIndex += n)
        }   

        function currentSlide(n) {
            showSlides(slideIndex = n)
        }

        function showSlides(n, m) {
            let i;
            let slides = document.getElementsByClassName("mySlides")
            let dots = document.getElementsByClassName("dot")

            if (n > slides.length) {
                slideIndex = 1
            }
            
            if (n < 1) {
                slideIndex = slides.length
            }

            for (i = 0; i < slides.length; i++) {
                slides[i].style.display = "none" 
            }
          
            for (i = 0; i < dots.length; i++) {
                dots[i].className = dots[i].className.replace(" active", "")
            }

            slides[slideIndex-1].style.display = "block"
            dots[slideIndex-1].className += " active"

            let sponsorsSlice = document.getElementsByClassName("mySponsorsSlice")

            if(m > sponsorsSlice.length) {
                SponsorsSlideIndex = 1
            }   

            for (i = 0; i < sponsorsSlice.length; i++) {
                sponsorsSlice[i].style.display = "none" 
            }

            sponsorsSlice[SponsorsSlideIndex-1].style.display = "block"
        }

        const form = document.querySelector(".form-logout")
        console.log(form)
		form.addEventListener("submit", function() {
			event.preventDefault()
			localStorage.clear()
			this.submit()
			})
    </script>
</body>
</html>

