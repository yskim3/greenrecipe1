<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>

</script>
<style type="text/css">
body {
	margin: 0;
	padding: 0;
}

input[type=text] {
	border-radius: 5px;
	font-size: 15pt;
	width: 300px;
	height: 50px;
}

input[type=password] {
	border-radius: 5px;
	font-size: 15pt;
	width: 300px;
	height: 50px;
}

input[type=submit] {
	background-color: #4AB34A;
	border: none;
	color: white;
	border-radius: 5px;
	font-size: 15pt;
	width: 150px;
	height: 50px;
}

input[id=button1] {
	background-color: #4AB34A;
	border: none;
	color: white;
	border-radius: 5px;
	font-size: 15pt;
	width: 150px;
	height: 50px;
}

input[id=button2] {
	background-color: #4AB34A;
	border: none;
	color: white;
	border-radius: 5px;
	font-size: 15pt;
	width: 305px;
	height: 50px;
}
</style>
</head>
<body>
	<c:import url="../default/header.jsp"/>
	<div class="login">
	<!-- style="text-align: center;" -->
		<h1>로그인</h1>
		<!-- buyer_id buyer_password -->
		<form action="${contextPath}/member/buyer_check" method="post">
			<input type="text" name="buyer_id" placeholder="아이디" autofocus required> <br><br>
			<input type="password" name="buyer_password" placeholder="비밀번호" required> <br><br>
			<input type="checkbox" name="autoLogin">자동 로그인 <br><br>
			<input type="submit" value="로그인">
			<input type="button" id="button1" value="회원가입" onclick="location.href='${contextPath}/member/signup'"> <br><br>
			<input type="button" id="button2" value="간편로그인"> <br><br>
			<a href="${contextPath}/member/searchIdForm">아이디 찾기</a> |
			<a href="${contextPath}/member/searchPwForm">비밀번호 찾기</a>
		</form>
	</div>
	<c:import url="../default/footer.jsp"/>
</body>
</html>