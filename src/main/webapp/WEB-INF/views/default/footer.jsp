<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
body {
	margin: 0;
	padding: 0;
	text-align: center
}

input[id=help] {
	background-color: #4AB34A;
	border: none;
	color: white;
	border-radius: 5px;
	font-size: 15pt;
	width: 100px;
	height: 50px;
	box-shadow : none;
}
</style>
</head>
<body>
	<div class="footer" width="85%" align="center">
		<table>
			<tr>
				<td>
					<h2>고객센터</h2>
					<input type="button" id="help" value="고객센터" onClick="location.href='${contextPath}/help/helpAll'"> <br>
					<h4>1:1 문의</h4>
					<h4>상담 채팅</h4>
				</td>
				
				<td>
					<h2>회사소개</h2>
					<h3>(주) GreenRecipe</h3>
					<h4>Address: <br> &nbsp; 3th floor, <br> &nbsp; 26, Donhwamun-ro, Jongno-gu, Seoul, <br> &nbsp; Republic of Korea</h4>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>