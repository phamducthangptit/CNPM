<%@page import="model.TaiKhoan"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bảng điểm</title>
</head>
<%
	Object ob = session.getAttribute("taiKhoan");
	TaiKhoan tk = new TaiKhoan();
	if (ob != null) {
		tk = (TaiKhoan) ob;
	}
	if (tk != null && tk.getRole().getMaRole() == 3) {
%>
<body>
<%@include file="header_student.jsp" %>
	<div class="container mt-4">
		<form class="d-flex mb-4" role="search" action="locdiemsvhk.htm" method="post">
			<div class="mb-3">
				<label for="maHK" class="form-label">Học kì</label> <select
					name="maHK" class="form-select" required="required">
					<c:forEach items="${listHocKiSV}" var="hk">
						<option value="${hk.maHK}">${hk.maHK}</option>
					</c:forEach>
				</select>
			</div>
			<button class="btn btn-outline-success" type="submit" style="height: 40px; width: 80px; margin-top: 30px; margin-left: 5px">Lọc</button>
		</form>
		<form action="danhsachsinhvien.htm" method="post">
		<c:forEach items="${listHocKiSV}" var="hk">
		<div style="font-weight: bold;">${hk.maHK }</div>
			<table class="table table-success table-striped"
				style="text-align: center;">
				<thead>
					<tr>
						<th scope="col">STT</th>
						<th scope="col">Mã môn</th>
						<th scope="col">Tên môn</th>
						<th scope="col">%CC</th>
						<th scope="col">%KT</th>
						<th scope="col">%TH</th>
						<th scope="col">%Se</th>
						<th scope="col">%Thi</th>
						<th scope="col">Điểm CC</th>
						<th scope="col">Điểm KT</th>
						<th scope="col">Điểm TH</th>
						<th scope="col">Điểm Se</th>
						<th scope="col">Điểm Thi</th>
						<th scope="col">Tổng kết</th>
						<th scope="col">Kết quả</th>
					</tr>
				</thead>
				<tbody>
					<%
						int count = 1;
					%>
					<c:forEach items="${listDiem}" var="ld">
					<c:if test="${ld[0] == hk.maHK }">
						<tr class="body">
							<td><%=count%></td>
							<td>${ld[2] }</td>
							<td>${ld[3] }</td>
							<td>${ld[4] }</td>
							<td>${ld[5] }</td>
							<td>${ld[6]}</td>
							<td>${ld[7] }</td>
							<td>${ld[8] }</td>
							<td>${ld[9] }</td>
							<td>${ld[10] }</td>
							<td>${ld[11] }</td>
							<td>${ld[12] }</td>
							<td>${ld[13] }</td>
							<td>${ld[14] }</td>
							<td>${ld[14] >= 4 ?'Đạt':'K.Đạt' }</td>
						</tr>
						<%
						count += 1;
						%>
					</c:if>
					</c:forEach>
				</tbody>
			</table>
			</c:forEach>
		</form>
		</div>
</body>
<%} %>
<script>
	const form = document.querySelector(".form-logout")
	console.log(form)
	form.addEventListener("submit", function() {
		event.preventDefault()
		localStorage.clear()
		this.submit()
		})
</script>
</html>