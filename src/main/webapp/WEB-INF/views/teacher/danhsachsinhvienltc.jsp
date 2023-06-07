<%@page import="model.TaiKhoan"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Danh sách sinh viên</title>
</head>
<%
	Object ob = session.getAttribute("taiKhoan");
	TaiKhoan tk = new TaiKhoan();
	if (ob != null) {
		tk = (TaiKhoan) ob;
	}
	if (tk != null && tk.getRole().getMaRole() == 2) {
%>
<body>
	<%@include file="header_teacher.jsp"%>
	<div class="container mt-4">
		<form class="d-flex mb-4" role="search" action="locdssv.htm" method="post">
			<div class="mb-3">
				<label for="maHK" class="form-label">Học kì</label> 
				<select
					name="maHK" class="form-select" required="required">
					<c:forEach items="${listHK}" var="hk">
						<option value="${hk.maHK}" ${hk.maHK == maHK ? 'selected':'' }>${hk.maHK}</option>
					</c:forEach>
				</select>
				
			</div>
			<div class="mb-3" style="margin-left: 5px">
				<label for="maLop" class="form-label">Lớp</label> 
				<select
					name="maLop" class="form-select" required="required">
					<c:forEach items="${listLop}" var="lop">
						<option value="${lop.maLop.toString()}" ${lop.maLop == maLop ? 'selected':'' }>${lop.tenLop}</option>
					</c:forEach>
				</select>
				
			</div>
			<div class="mb-3" style="margin-left: 5px">
				<label for="maMH" class="form-label" >Môn học</label> 
				<select
					name="maMH" class="form-select" required="required">
					<c:forEach items="${listMH}" var="mh">
						<option value="${mh.maMH}" ${mh.maMH == maMH ? 'selected':'' }>${mh.tenMH}</option>
					</c:forEach>
				</select>
				
			</div>
			<button class="btn btn-outline-success" type="submit" style="height: 40px; width: 80px; margin-top: 30px; margin-left: 5px">Lọc</button>
		</form>
		<form action="" method="post">
			<table class="table table-success table-striped"
				style="text-align: center;">
				<thead>
					<tr>
						<th scope="col">STT</th>
						<th scope="col">Mã sinh viên</th>
						<th scope="col">Họ và tên</th>
						<th scope="col">Lớp</th>
						<th scope="col">Ngày sinh</th>
						<th scope="col">Giới tính</th>
						<th scope="col">Email</th>
						<th scope="col">SDT</th>
						<th scope="col">Quê quán</th>
					</tr>
				</thead>
				<tbody>
					<%
					int count = 1;
					%>
					<c:forEach items="${listSV}" var="sinhVien">
						<tr class="body">
							<td><%=count%></td>
							<td>${sinhVien.maSV }</td>
							<td>${sinhVien.hoTen }</td>
							<td>${sinhVien.lop.maLop }</td>
							<td>${sinhVien.ngaySinh }</td>
							<td>${sinhVien.gioiTinh }</td>
							<td>${sinhVien.getEmail1() }</td>
							<td>${sinhVien.SDT1 }</td>
							<td>${sinhVien.queQuan }</td>
						</tr>
						<%
						count += 1;
						%>
					</c:forEach>
				</tbody>
			</table>
		</form>
	</div>
</body>
<%
}
%>
</html>