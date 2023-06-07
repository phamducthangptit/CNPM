<%@page import="java.util.List"%>
<%@page import="model.TaiKhoan"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Danh sách tài khoản</title>
</head>
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

		<form action="danhsachtaikhoan.htm" method="post">
			<table class="table table-success table-striped" style="text-align: center;">
				<thead>
					<tr>
						<th scope="col">STT</th>
						<th scope="col">Tên đăng nhập</th>
						<th scope="col">Quyền</th>
						<th scope="col" >Trạng thái</th>
					</tr>
				</thead>
				<tbody>
				 	<% int count = 1; %>
					<c:forEach items="${listAccount }" var="account">
					<tr>
						<td><%=count %></td>
						<td>${account.tenDN}</td>
						<td>${account.role.tenRole}</td>
						<td>
	  						<div class="form-check form-switch"  style="vertical-align: middle; display: flex; justify-content: center; align-items: center;">
  								<input class="form-check-input" type="checkbox" name="checkDis" value="<%=count - 1%>" ${account.trangThai == 1?'checked':'' }>
							</div>
						</td>
					</tr>
					<%count += 1; %>
					</c:forEach>
				</tbody>
			</table>
			<button type="submit" id="myButton" class="btn btn-success" style="display: none;">Lưu thay đổi</button>
		</form>
	</div>
</body>
<%
}
%>
<script>
	localStorage.clear();
	//Lấy danh sách các checkbox
	var checkboxes = document.getElementsByName("checkDis");
	
	// Lặp qua danh sách các checkbox và bắt sự kiện thay đổi trên mỗi checkbox
	for (var i = 0; i < checkboxes.length; i++) {
	  var checkbox = checkboxes[i];
	  checkbox.addEventListener('change', function() {
	    // Kiểm tra xem có ít nhất một checkbox được chọn
	    var checked = false;
	    for (var j = 0; j < checkboxes.length; j++) {
	      if (checkboxes[j].checked) {
	        checked = true;
	        break;
	      }
	    }
	    // Hiển thị hoặc ẩn button tương ứng
	    var button = document.getElementById("myButton");
	    if (checked) {
	      button.style.display = "block";
	    } else {
	      button.style.display = "none";
	    }
	  });
	}
</script>
</html>