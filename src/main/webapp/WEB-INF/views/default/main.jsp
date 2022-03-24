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
	width: 200px;
	height: 50px;
	align: center;
}
</style>
</head>
<body>
	<c:import url="../default/header.jsp"/>
	<div class="wrap">
		<h1>[main page (메인 페이지)]</h1>
		<h2>임시 링크</h2> <br>
		마이 페이지 [구매자 페이지] <br>
		<input type="button" value="마이 페이지" onClick="location.href='${contextPath}/member/mypage'"> <br><br>
		판매자 내 정보 수정 [판매자 페이지] <br>
		<input type="button" value="내 정보 수정" onClick="location.href='${contextPath}/member/sellerUpdateForm'"> <br>
		판매자 문의 작성 (상품 문의 페이지) [판매자 페이지] <br>
		<input type="button" value="상품 문의" onClick="location.href='${contextPath}/inquiry/inquiryWriteForm'"> <br>
		판매자 문의 내역 (상품 문의 내역 페이지) [판매자 페이지] (구현 안됨) <br>
		<input type="button" value="상품 문의 내역" onClick="location.href='${contextPath}/inquiry/inquiryAll'"> <br>
		판매자 문의 내역 답변 (상품 문의 답변 페이지) [판매자 페이지] <br>
		<input type="button" value="상품 문의 답변" onClick="location.href='${contextPath}/inquiry/inquiryReplyForm'"> <br><br>
		고객센터 문의 내역 (임시로 고객센터로 이동) [관리자 페이지] <br>
		<input type="button" value="문의 내역" onClick="location.href='${contextPath}/help/helpAll'"> <br>
		고객센터 문의 내역 글 (1:1 문의 클릭시 내용 확인) [관리자 페이지] <br>
		<input type="button" value="1:1 문의 확인" onClick="location.href='${contextPath}/help/helpContentView'"> <br>
		고객센터 문의 내역 수정 (1:1 문의 클릭시 수정 페이지) [관리자 페이지] <br>
		<input type="button" value="1:1 문의 수정" onClick="location.href='${contextPath}/help/helpModifyForm'"> <br>
		고객센터 문의 내역 답변 (1:1 문의 답변 페이지) [관리자 페이지] <br>
		<input type="button" value="1:1 문의 답변" onClick="location.href='${contextPath}/help/helpReplyForm'"> <br>
		구매자 회원 관리 [관리자 페이지] <br>
		<input type="button" value="구매자 회원 관리" onClick="location.href='${contextPath}/member/buyerAll'"> <br>
		판매자 회원 관리 [관리자 페이지] <br>
		<input type="button" value="판매자 회원 관리" onClick="location.href='${contextPath}/member/sellerAll'"> <br>
	</div>
	<c:import url="../default/footer.jsp"/>
</body>
</html>