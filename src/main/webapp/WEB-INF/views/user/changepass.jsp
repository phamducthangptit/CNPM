<%@page import="model.TaiKhoan"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Thay đổi mật khẩu</title>
<%
	Object ob = session.getAttribute("taiKhoan");
	TaiKhoan tk = new TaiKhoan();
	if (ob != null) {
		tk = (TaiKhoan) ob;
	}
	if (tk != null) {
%>
<script>
    // check if message is not empty
    var message = "${mgs_updatepass}";
    if (message !== "") {
        alert(message);
    }
</script>
</head>
<body>
	<%
		if (tk.getRole().getMaRole() == 1) {
	%>
		<%@include file="../admin/header_admin.jsp"%>
	<%
		} else if(tk.getRole().getMaRole() == 2){
	%>
		<%@include file="../teacher/header_teacher.jsp"%>
	<%} else {%>
		<%@include file="../student/header_student.jsp"%>
	<%} %>
	<div class="container mt-4">
		<form action="thaydoimk.htm" method="post" id="form">
		<div class="row justify-content-center">
			<div class="col-sm-6">
				<div class="mb-3">
					<label for="pass" class="form-label">Mật khẩu hiện tại</label>
	    			<input type="password" class="form-control" name="pass" required="required">
	    			<div style="color: red;">${mgs_pass }</div>
				</div>
				<div class="mb-3">
					<label for="pass" class="form-label">Mật khẩu mới</label>
	    			<input type="password" class="form-control" name="newpass" id="newpass" required="required">
				</div>
				<div class="mb-3">
					<label for="pass" class="form-label">Nhập lại mật khẩu</label>
	    			<input type="password" class="form-control" name="newpassrepeat" id="newpassrepeat" required="required">
	    			<div id="mgs" style="color: red;"></div>
				</div>
				<button type="submit" class="btn btn-success" style="width: 150px;">Đổi mật khẩu</button>
			</div>
		</div>
	</form>
	</div>
</body>
<%
}
%>
<script>
  document.getElementById("form").addEventListener("submit", function(event) {
    var newPass = document.getElementById("newpass").value;
    var newPassRepeat = document.getElementById("newpassrepeat").value;
    if (newPass !== newPassRepeat) {
      event.preventDefault();
      document.getElementById("mgs").innerHTML = "Mật khẩu nhập lại chưa khớp";
    }
  });
</script>

</html>