<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:import url="../default/header.jsp"/>
	<div class="sellerall">
		<h1>판매자 회원 관리</h1>
		<table style="margin: auto;">
			<tr>
				<th>아이디</th>
				<th>매장명</th>
				<th>연락처</th>
				<th>아임포트번호</th>
			</tr>
			<!-- 임시 데이터 -->
			<tr>
				<td>tmpid</td>
				<td>storename</td>
				<td>01011112222</td>
				<td>123465789</td>
			</tr>
			<tr>
				<th>${info.getSeller_id()}</th>
				<th>${info.getSeller_storeName}</th>
				<th>${info.getSeller_phone}</th>
				<th>${info.getSeller_import}</th>
			</tr>
		</table>
	</div>
	<c:import url="../default/footer.jsp"/>
</body>
</html>