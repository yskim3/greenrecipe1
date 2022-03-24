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
input[type=button] {
	background-color: #4AB34A;
	border: none;
	color: white;
	border-radius: 5px;
	font-size: 12pt;
	width: 100px;
	height: 40px;
}
</style>
</head>
<body>
<body>
	<c:import url="../default/header.jsp"/>
	<div id="helpcontentview" style="margin: 0 auto;">
	<h1>1:1 문의</h1>
		<table style="margin: 0 auto;">
			<tr>
				<th>문의 번호</th>
				<td>${personalData.writeNo}</td>
				<th>작성자</th>
				<td>${personalData.id}</td>
			</tr>
			<tr>
				<th>제목</th>
				<td>${personalData.title}</td>
				<th>등록일자</th>
				<td>${personalData.saveDate}</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>${personalData.content}</td>
			</tr>
			<tr>
				<td colspan="4" align="center">
					<c:if test="${loginUser == personalData.id}">
					<input type="button" value="수정" onclick="location.href='${contextPath}/help/helpmodifyForm?writeNo=${personalData.writeNo}'">
					<input type="button" value="삭제" onclick="location.href='${contextPath}/help/delete?writeNo=${personalData.writeNo}&imageFileName=${personalData.imageFileName}'">
					</c:if>
					<!-- 관리자 로그인시에만 답변 보이게 함 -->
					<input type="button" value="답변" onclick="slideClick()">
					<input type="button" onClick="location.href='${contextPath}/help/helpAll'" value="고객센터">
				</td>
			</tr>
		</table>
	</div>
	<c:import url="../default/footer.jsp"/>
</body>
</html>