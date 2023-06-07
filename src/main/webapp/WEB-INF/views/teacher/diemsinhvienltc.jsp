<%@page import="model.TaiKhoan"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Danh sách điểm sinh viên</title>
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
		<form class="d-flex mb-4" role="search" action="locdiemsv.htm" method="post">
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
						<option value="${lop.maLop.toString()}" ${lop.maLop == maLop ? 'selected':'' }>${lop.maLop}</option>
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
						<th scope="col">Điểm CC</th>
						<th scope="col">Điểm KT</th>
						<th scope="col">Điểm Se</th>
						<th scope="col">Điểm TH</th>
						<th scope="col">Điểm Thi</th>
						<th scope="col">Tổng kết</th>
						<th scope="col">Kết quả</th>
					</tr>
				</thead>
				<tbody>
					<%
					int count = 1;
					%>
					<c:forEach items="${listDSV}" var="dsv">
						<tr class="body">
							<td><%=count%></td>
							<td>${dsv[0]}</td>
							<td>${dsv[1] }</td>
							<td>${dsv[2] }</td>
							<td>${dsv[3] }</td>
							<td>${dsv[4]}</td>
							<td>${dsv[5] }</td>
							<td>${dsv[6] }</td>
							<td>${dsv[7] }</td>
							<td>${dsv[7] >= 4 ? 'Đạt' : 'K.Đạt' }</td>
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