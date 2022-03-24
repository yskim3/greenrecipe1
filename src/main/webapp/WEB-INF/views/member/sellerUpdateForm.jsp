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
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
function daumPost(){
	new daum.Postcode({
		oncomplete: function(data) {
			console.log("선택 : " + data.userSelectedType)
			console.log("도로명 : " + data.roadAddress)
			console.log("지번 : " + data.jibunAddress)
			console.log("우편 번호 : " + data.zonecode)
			var addr = ""
			if(data.userSelectedType == 'R') {
				addr = data.roadAddress
			} else {
				addr = data.jibunAddress
			}
			document.getElementById("addr1").value = data.zonecode
			$("#addr2").val(addr)
			$("#addr3").focus()
		}
	}).open();
}

/*
function register() {
	var addr = $("#addr1").val() + "/" + $("#addr2").val() + "/" + $("#addr3").val()
	$("#addr1").val(addr)
	fo.submit()
	$("button.cateBtn").click(function(){
	    $("button.cateBtn").removeClass("on");
	    $(this).addClass("on");
	});
}
*/

function pwCheck() {
	var pw1 = $("#pw1").val()
	var pw2 = $("#pw2").val()
	if(pw1 == pw2) {
		$("#pw_check").html('비밀번호가 일치합니다.')
	} else {
		$("#pw1").val("") 
		$("#pw2").val("")
		$("#pw1").focus()
		document.getElementById("pw_check").innerHTML = "<span style='color:red;'>비밀번호가 일치하지 않습니다.</span>"
	}
}

/*
function idCheck() {
	var id = $("#id").val()
	if(id == "") {
		alert('아이디는 필수 항목입니다!')
		$("#id").focus()
	} else {
		var addr = $("#addr1").val() + "/" + $("#addr2").val() + "/" + $("#addr3").val()
		$("#addr1").val(addr)
		fo.submit()
	}
}
*/

/*
function hellsCheck() {
	var b01 = $("#b01").val()
	var b02 = $("#b02").val()
	if(b02.on) {
		$("#hashtag_check").html('#헬스1')
}
*/
</script>
<style type="text/css">
body {
	margin: 0;
	padding: 0;
}

input[type=text] {
	border-radius: 5px;
	font-size: 15pt;
	width: 400px;
	height: 50px;
}

input[type=password] {
	border-radius: 5px;
	font-size: 15pt;
	width: 400px;
	height: 50px;
}

input[id=storeaddr1] {
	border-radius: 5px;
	font-size: 15pt;
	width: 190px;
	height: 50px;
}

input[id=storeaddr2] {
	border-radius: 5px;
	font-size: 15pt;
	width: 190px;
	height: 50px;
}

input[id=storeaddr3] {
	border-radius: 5px;
	font-size: 15pt;
	width: 200px;
	height: 50px;
}

button {
	background-color: gray;
	border: none;
	color: white;
	border-radius: 5px;
	font-size: 15pt;
	width: 150px;
	height: 50px;
}

input[id=cancel] {
	background-color: gray;
	border: none;
	color: white;
	border-radius: 5px;
	font-size: 20pt;
	width: 200px;
	height: 50px;
}

input[type=submit] {
	background-color: #4AB34A;
	border: none;
	color: white;
	border-radius: 5px;
	font-size: 20pt;
	width: 200px;
	height: 50px;
}

input[id=sd] {
	background-color: transparent;
	border: none;
	color: black;
	border-radius: 5px;
	font-size: 12pt;
	width: 100px;
}
</style>
</head>
<body>
	<c:import url="../default/header.jsp"/>
	<div class="sellerupdate">
		<h1>내 정보 수정</h1>
		<form action="${contextPath}/member/member_update" method="post">
			<table style="margin: auto;">
				<tr>
					<td>
						${info.getUser_id()} (아이디) <br><br>
						${info.getUser_name()} (이름) <br><br>
						<input type="password" id="pw0" placeholder="현재 비밀번호"> <br><br>
						<input type="password" id="pw1" name="pw" placeholder="새 비밀번호"> <br><br>
						<input type="password" id="pw2" placeholder="새 비밀번호 확인" onchange="pwCheck()"> <br>
							<label id="pw_check">[예시] 비밀번호 체크는 구현됨, 현재 비밀번호 확인은 구현 안됨</label> <br>
						<input type="text" name="phone" placeholder="연락처 (숫자만 입력)"> <br><br>
						<input type="text" name="email" placeholder="이메일 주소"> <br><br>
						<input type="text" name="storename" placeholder="매장명"> <br><br>
						<input type="text" readonly id="storeaddr1" name="storeaddr" placeholder="우편번호">
						<input type="text" readonly id="storeaddr2" placeholder="도로명 (지번)"> <br><br>
						<input type="text" id="storeaddr3" placeholder="상세주소 (매장주소)"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<button type="button" id="addrbutton" onclick="daumPost()">주소 찾기</button> <br><br>
						<!-- 취소시 임시로 default/main으로 이동 -->
						<input type="button" id="cancel" value="취소" onClick="location.href='${contextPath}/default/main'"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="submit" value="수정">
					<td>
				</tr>
			</table>
		</form>
	</div>
	<div class="sellerdelete" style="padding: 0px 0px 0px 700px;">
	<!-- 임시로 회원탈퇴시 default/main.jsp로 이동함 -->
	<input type="button" id="sd" value="회원 탈퇴" onClick="location.href='${contextPath}/default/main'"> <br><br>
	</div>
	<c:import url="../default/footer.jsp"/>
</body>
</html>