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
	<div class="helpall" style="margin: auto;">
		<h1>고객센터</h1>
		<table style="margin: auto;">
			<tr>
				<th>문의번호</th>
				<th>문의글</th>
				<th>답변여부</th>
				<th>작성날짜</th>
			</tr>
			<!-- 임시 문의글 -->
			<tr>
				<td>1</td>
				<td>로그인이 안되요 (임시 글) (답변 확인 변경 코드 없으면 고객센터 게시판에 답변여부 확인 굳이 필요 없을 듯)</td>
				<td>답변확인 (답변 확인 변경 코드 필요할 듯)</td>
				<td>2022.03.16</td>
			</tr>
			<tr>
				<td>3</td>
				<td>ㄴ 답변: 로그인 해결 방법 (임시 답변) / 답변형 게시판 코드 찾기</td>
				<td>답변완료</td>
				<td>2022.03.17</td>
			</tr>
			<tr>
				<td>2</td>
				<td>회원가입이 안되요 (임시 글)</td>
				<td>답변대기</td>
				<td>2022.03.16</td>
			</tr>
			<c:forEach var="dto" items="${help_list}">
			<tr>
				<td>${dto.help_num}</td>
				<td><a href="${contextPath}/help/helpcontentView?writeNo=${dto.help_num}">${dto.help_title}</a></td>
				<td>${dto.help_answerYN}</td>
				<td>${dto.help_date}</td>
			</tr>
			</c:forEach>
		</table>
	</div> <br><br>
	<div id="helpAllbutton">
		<input type="button" id="write" value="1:1 문의" onClick="location.href='${contextPath}/help/helpWriteForm'"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="button" id="chatting" value="채팅 상담" onClick="location.href=''"> <br><br>
	</div>
	<c:import url="../default/footer.jsp"/>
</body>
</html>