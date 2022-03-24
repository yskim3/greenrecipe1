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
	<div id="helpwrite" style="width: 400px; margin: 0 auto;">
		<h1>1:1 문의</h1>
		<form method="post" action="${contextPath}/help/helpWriteSave" enctype="multipart/form-data" style="text-align: left">
			<input type="text" size="50" name="title" placeholder="1:1 문의 제목을 입력해주세요."> <br><br>
			<textarea name="content" rows="15" cols="50" placeholder="1:1 문의 내용을 입력해주세요."></textarea> <br><br>
		</form>
	</div>
	<div id="helpWritebutton" style="width: 400px; margin: 0 auto; text-align: center;">
		<input type="button" value="취소" onClick="location.href='${contextPath}/help/helpAll'"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="submit" value="문의">
	</div>
	<c:import url="../default/footer.jsp"/>
</body>
</html>