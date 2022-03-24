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

input[type=submit] {
	background-color: #4AB34A;
	border: none;
	color: white;
	border-radius: 5px;
	font-size: 20pt;
	width: 400px;
	height: 50px;
}
</style>
</head>
<body>
	<c:import url="../default/header.jsp"/>
	<div class="sellerregister">
		<h1>판매자 회원가입</h1>
		<form action="${contextPath}/member/member_insert" method="post">
			<table style="margin: auto;">
				<tr>
					<td>
						<input type="text" name="id" placeholder="아이디" onchange="idCheck()" autofocus required> <br>
							<label id="id_check">[예시] 아이디 체크 / 비밀번호확인처럼 중복체크 버튼 없이도 enter 실행 코드 찾기 / 없으면 아래와 같이 중복확인버튼 생성</label> <br>
						<input type="password" id="pw1" name="pw" placeholder="비밀번호" required> <br><br>
						<input type="password" id="pw2" placeholder="비밀번호 확인" onchange="pwCheck()" required> <br>
							<label id="pw_check"></label> <br>
						<input type="text" name="name" placeholder="이름" required> <br><br>
						<input type="text" name="phone" placeholder="연락처 (숫자만 등록)" required> <br><br>
						<input type="text" name="email" placeholder="이메일 주소" required> <br><br>
						<input type="text" name="storename" placeholder="매장명" required> <br><br>
						<input type="text" readonly id="storeaddr1" name="storeaddr" placeholder="우편번호" required>
						<input type="text" readonly id="storeaddr2" placeholder="도로명 (지번)" required> <br><br>
						<input type="text" id="storeaddr3" placeholder="상세주소 (매장주소)" required> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<button type="button" id="addrbutton" onclick="daumPost()">주소 찾기</button> <br><br>
						<input type="submit" value="회원가입">
					<td>
				</tr>
			</table>
		</form>
	</div>
	<c:import url="../default/footer.jsp"/>
</body>
</html>