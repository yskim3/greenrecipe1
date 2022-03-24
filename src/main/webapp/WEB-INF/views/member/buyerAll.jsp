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
	<div class="userall">
		<h1>구매자 회원 관리</h1>
		<table style="margin: auto;">
			<tr>
				<th>주문 횟수</th>
				<th>아이디</th>
				<th>이름</th>
				<th>연락처</th>
				<th>배송지</th>
				<th>최근 주문 날짜 (userdb에 없음, paydb의 pay_date)</th>
			</tr>
			<!-- 임시 데이터 -->
			<tr>
				<td>100</td>
				<td>userid</td>
				<td>name</td>
				<td>010-9999-8888</td>
				<td>서울시 종로구 단성사</td>
				<td>2022-03-17</td>
			</tr>
			<tr>
				<c:forEach var="buyer_dto" items="${buyerAllList}">
				<td>${buyer_dto.getBuyer_id()}</td>
				<td>${buyer_dto.getBuyer_id()}</td>
				<td>${buyer_dto.getBuyer_name()}</td>
				<td>${buyer_dto.getBuyer_name()}</td>
				<!-- <td>${buyer_dto.getBuyer_phone}</td> -->
				<td>${buyer_dto.getBuyer_addr}</td>
				<td>${buyer_dto.getBuyer_name()}</td>
				</c:forEach>
			</tr>
		</table>
	</div>
	<c:import url="../default/footer.jsp"/>
</body>
</html>