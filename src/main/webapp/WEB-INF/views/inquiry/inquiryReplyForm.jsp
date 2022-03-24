<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	function readURL(input) {
		var file = input.files[0]
		console.log(file)
		if (file != '') {
			var reader = new FileReader();
			reader.readAsDataURL(file);
			reader.onload = function(e) {
				console.log(e)
				console.log(e.target)
				console.log(e.target.result)
				$('#preview').attr('src', e.target.result);
			}
		}
	}
</script>
<style type="text/css">
body {
	margin: 0;
	padding: 0;
}

input[type=text] {
	border-radius: 5px;
	font-size: 12pt;
	width: 400px;
	height: 50px;
}

textarea {
	border-radius: 5px;
	font-size: 12pt;
	width: 400px;
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
	background-color: gray;
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
	<div id="helpWrite" style="width: 400px; margin: 0 auto;">
		<h1>상품 문의 답변</h1>
		<form method="post" action="${contextPath}/inquiry/inquiryReplySave" enctype="multipart/form-data" style="text-align: left">
			<input type="text" size="50" name="title" placeholder="상품 문의 답변 제목을 입력해주세요."> <br><br>
			<textarea name="content" rows="15" cols="50" placeholder="상품 문의 답변 내용을 입력해주세요."></textarea> <br><br>
		</form>
	</div>
	<div id="helpWritebutton" style="width: 400px; margin: 0 auto; text-align: center;">
		<!-- 취소는 임시로 main.jsp로 가도록 함 -->
		<input type="button" value="취소" onClick="location.href='${contextPath}/default/main'"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="submit" value="답변">
	</div>
	<c:import url="../default/footer.jsp"/>
</body>
</html>