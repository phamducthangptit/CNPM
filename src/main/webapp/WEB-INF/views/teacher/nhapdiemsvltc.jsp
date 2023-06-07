<%@page import="model.TaiKhoan"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Nhập điểm</title>
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
		<form class="d-flex mb-4" role="search" action="locsvnhapdiem.htm" method="post">
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
		<form action="luudiemcsdlbygv.htm" method="post" class="formCover">
			<table class="table table-success table-striped"
				style="text-align: center;">
				<thead>
					<tr>
						<th scope="col">STT</th>
						<th scope="col">Mã sinh viên</th>
						<th scope="col">Họ và tên</th>
						<th scope="col">Điểm CC</th>
						<th scope="col">Điểm KT</th>
						<th scope="col">Điểm TH</th>
						<th scope="col">Điểm Se</th>
					</tr>
				</thead>
				<tbody>
					<%
					int count = 1;
					%>
					<c:forEach items="${ listDSV}" var="sv">
						<tr class="body">
							<td><%=count%></td>
							<td hidden=""><input name="ID" value="${sv[8] }"> </td>
							<td><input name="idSv" value="${sv[0] }" style="outline: none; border: none; text-align: center;"
								readonly="readonly"></td>
							<td><input name="tenSV" value="${sv[1].toString() }"
								style="outline: none; border: none; text-align: center;"
								readonly="readonly"></td>
							<%-- <td>${sv[2] }</td> --%>
							<td><input name="diemCC" type="number" min="0" max="10"
								value="${sv[2] }" ${sv[9] == 1 ? 'readonly':'' }></td>
							<td><input name="diemKT" type="number" min="0" max="10"
								value="${sv[3]}" ${sv[9] == 1 ? 'readonly':''}></td>
							<td><input name="diemTH" type="number" min="0" max="10"
								value="${sv[5]}" ${sv[9] == 1 ? 'readonly':''}></td>
							<td><input name="diemSE" type="number" min="0" max="10"
								value="${sv[4]}" ${sv[9] == 1 ? 'readonly':''}></td>
						</tr>
						<%
						count += 1;
						%>
					</c:forEach>
				</tbody>
			</table>
			<input type="submit" class="btn btn-success"
				style="margin-left: 600px" value="Lưu vào CSDL">
		</form>
	</div>
</body>
<%
}
%>
<script type="text/javascript">
	const formCover = document.querySelector(".formCover")
	const selectors = document.querySelectorAll(".form-select")
	const formTop = document.querySelector(".mb-4")
	const selectorsArray = []

	formTop.addEventListener("submit", function(event) {
		event.preventDefault()
		selectors.forEach(function(selector) {
			selectorsArray.push([ selector.name, selector.value ])
		})
		localStorage.setItem("selectors", JSON.stringify(selectorsArray))
		this.submit()
	})

	formCover.addEventListener("submit", function(event) {
		event.preventDefault()
		selectors.forEach(function(selector) {
			var input = document.createElement("input")
			input.name = selector.name
			input.value = selector.value
			input.style.display = "none"
			formCover.appendChild(input)
		})
		this.submit()
	})

	window.onload = function() {
		const selectorsLocal = JSON.parse(localStorage.getItem("selectors"))
		if (selectorsLocal) {
			for (var i = 0; i < selectorsLocal.length; i++) {
				selectors[i].value = selectorsLocal[i][1]
			}
		}
	}
</script>
</html>