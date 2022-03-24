<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
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

input[type=button] {
	background-color: #4AB34A;
	border: none;
	color: white;
	border-radius: 5px;
	font-size: 20pt;
	width: 200px;
	height: 50px;
}
</style>
</head>
<body>
	<c:import url="../default/header.jsp"/>
	<div class="register">
		<h1>회원가입</h1>
		<input type="button" id="buyer" value="구매자 회원가입" onClick="location.href='${contextPath}/member/buyerSignup'"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="button" id="seller" value="판매자 회원가입" onClick="location.href='${contextPath}/member/sellerSignup'"> <br><br>
	</div>
	<c:import url="../default/footer.jsp"/>
</body>
</html>