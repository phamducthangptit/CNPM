<%@page import="org.hibernate.internal.build.AllowSysOut"%>
<%@page import="model.TaiKhoan"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Thêm tài khoản</title>
</head>
<style>
	.radio-item {
	    display: inline-block;
	    margin-right: 30px;
	  }
</style>
<script>
    // check if message is not empty
    var message = "${mgs_addTk}";
    if (message !== "") {
        alert(message);
    }
</script>
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
		<form action="themtaikhoan.htm" method="post">
			<div class="row justify-content-center">
				<div class="col-sm-6">
						<div class="mb-3">
							<label for="tenDN" class="form-label">Tên đăng nhập*</label>
	    					<input type="text" class="form-control" name="tenDN" required="required">
						</div>
						<div class="mb-3">
							<label class="form-label">Quyền tài khoản*</label> 
							</br>
			 				<c:forEach items="${roles}" var="item">
	    						<label class="radio-item">
	    							<input class="form-check-input" type="radio" name="Role" value="${item.maRole}" required="required"/> 
	    							${item.tenRole}
	    						</label>
	  						</c:forEach>
						</div>
						<div class="mb-3">
							<button type="submit" class="btn btn-primary">Thêm tài khoản</button>
						</div>	
				</div>
			</div>
			</form>
		</div>
	
</body>
<%
}
%>
</html>