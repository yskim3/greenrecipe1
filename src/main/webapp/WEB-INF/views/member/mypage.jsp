<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
body {
	margin: 0;
	padding: 0;
	text-align: center;
}

input[type=submit] {
	background-color: #4AB34A;
	border: none;
	color: white;
	border-radius: 5px;
	font-size: 20pt;
	width: 150px;
	height: 50px;
	align: center;
}

input[type=button] {
	background-color: #4AB34A;
	border: none;
	color: white;
	border-radius: 5px;
	font-size: 20pt;
	width: 150px;
	height: 50px;
	align: center;
}
</style>
</head>
<body>
	<c:import url="../default/header.jsp"/>
	<div class="wrap">
		<h1>[mypage (임시 마이페이지)]</h1>
		내 정보 수정 <br>
		<input type="button" value="내 정보 수정" onClick="location.href='${contextPath}/member/buyerUpdateForm'"> <br>
		판매자 문의 작성 페이지 (상품 문의 페이지) <br>
		<input type="button" value="상품 문의" onClick="location.href='${contextPath}/inquiry/inquiryWriteForm'"> <br>
	</div>
	<c:import url="../default/footer.jsp"/>
</body>
</html>