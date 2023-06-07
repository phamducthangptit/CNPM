<%@page import="model.TaiKhoan"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Danh sách lớp tín chỉ</title>
<script>
	// check if message is not empty
	var message = "${mgs_updateLTC}";
	if (message !== "") {
		alert(message);
	}
</script>
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
		<form action="danhsachloptc.htm" method="post">
			<table class="table table-success table-striped" style="text-align: center;">
				<thead>
					<tr>
						<th scope="col">STT</th>
						<th scope="col">Mã môn học</th>
						<th scope="col">Mã lớp</th>
						<th scope="col" >Mã học kì</th>
						<th scope="col" >Số nhóm</th>
						<th scope="col" >Ngày BD học</th>
						<th scope="col" >Ngày KT học</th>
						<th scope="col" >SL tối đa</th>
						<th scope="col" >SL đã đăng kí</th>
						<th scope="col" >Mã giảng viên</th>
						<th scope="col" >Trạng thái</th>
						<th scope="col" >Thay đổi TT</th>
						<th scope="col" ></th>
					</tr>
				</thead>
				<tbody>
					<%int count = 1; %>
					<c:forEach items="${listLopTinChi}" var="ltc">
						<tr class="body">
						<td><%=count %></td>
						<td>${ltc[0] }</td>
						<td>${ltc[1] }</td>
						<td>${ltc[2] }</td>
						<td>${ltc[3] }</td>
						<td>${ltc[4] }</td>
						<td>${ltc[5] }</td>
						<td>${ltc[6] }</td>
						<td>${ltc[7] }</td>
						<td>${ltc[8] }</td>
						<td>${ltc[9] == 0 ?'Mở đăng kí':'Chưa mở đăng kí'}</td>
						<td><a href="thaydoitt.htm?idMH=${ltc[0]}&idLop=${ltc[1]}&idHK=${ltc[2]}&tt=${ltc[9]}">Thay đổi TT</a></td>
						<td><a href="ctloptc.htm?idMH=${ltc[0]}&idLop=${ltc[1]}&idHK=${ltc[2]}">Chi tiết</a></td>
					</tr>
					<%count += 1; %>
					</c:forEach>
				</tbody>
			</table>
		</form>
	</div>
</body>
<%} %>
</html>