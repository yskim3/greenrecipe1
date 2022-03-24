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
	width: 300px;
	height: 50px;
}
</style>
</head>
<body>
	<c:import url="../default/header.jsp"/>
	<div class="searchpw">
		<h1>비밀번호 찾기</h1>
		<form action="${contextPath}/member/pw_check" method="post">
			<input type="text" name="id" placeholder="아이디" autofocus required> <br><br>
			<input type="text" name="phone" placeholder="연락처" required> <br><br>
			<input type="text" name="eamil" placeholder="이메일 주소" required> <br><br>
			<input type="submit" value="비밀번호 찾기">
		</form>
	</div>
	<c:import url="../default/footer.jsp"/>
</body>
</html>