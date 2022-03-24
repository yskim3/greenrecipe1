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

function register() {
	var addr = $("#addr1").val() + "/" + $("#addr2").val() + "/" + $("#addr3").val()
	$("#addr1").val(addr)
	fo.submit()
}

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
    $.ajax({
        url:'${contextPath}/member/idCheck', //Controller에서 인식할 주소
        type:'post', //POST 방식으로 전달
        success:function(data){
        	console.log(data)
        	if(data.id == "OK") {
        		$('.id_ok').css("display","inline-block"); 
                $('.id_already').css("display", "none");
        } else { // cnt가 1일 경우 -> 이미 존재하는 아이디
            $('.id_already').css("display","inline-block");
            $('.id_ok').css("display", "none");
        },
        error:function(data){
            alert("에러입니다")
        }
    })
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

.id_ok{color:#fff; display: none;}
.id_already{color:#6A82FB; display: none;}

input[type=password] {
	border-radius: 5px;
	font-size: 15pt;
	width: 400px;
	height: 50px;
}

input[id=addr1] {
	border-radius: 5px;
	font-size: 15pt;
	width: 190px;
	height: 50px;
}

input[id=addr2] {
	border-radius: 5px;
	font-size: 15pt;
	width: 190px;
	height: 50px;
}

input[id=addr3] {
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

input[type=button] {
	background-color: #46B8FF;
	border: none;
	color: white;
	border-radius: 5px;
	font-size: 15pt;
	width: 100px;
	height: 50px;
	box-shadow: 3px 3px 3px gray;
}

input[type=button:active] {
	background-color: #46B8FF;
	border: none;
	color: white;
	border-radius: 5px;
	font-size: 15pt;
	width: 100px;
	height: 50px;
	box-shadow: 3px 3px 3px gray;
}

button.on {
	background-color: red;
	color: white;
	margin-left: 5px;
	margin-top : 5px;
	box-shadow : none;
}

input[name=code] {
	border-radius: 5px;
	font-size: 15pt;
	width: 200px;
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
	<div class="userregister">
		<h1>구매자 회원가입</h1>
		<form action="register" method="post">
			<table style="margin: auto;">
				<tr>
					<td>
						<input type="text" name="id" placeholder="아이디" onchange="idCheck()" autofocus required> <br>
						<!-- <span class="id_ok">사용 가능한 아이디입니다.</span>
						<span class="id_already">누군가 이 아이디를 사용하고 있어요.</span><br> -->
							<label id="id_check">[예시] 아이디 체크 / 비밀번호확인처럼 중복체크 버튼 없이도 enter 실행 코드 찾기 / 없으면 아래와 같이 중복확인버튼 생성</label> <br>
						<input type="password" id="pw1" name="pw" placeholder="비밀번호" required> <br><br>
						<input type="password" id="pw2" placeholder="비밀번호 확인" onchange="pwCheck()" required> <br>
							<label id="pw_check"></label> <br>
						<input type="text" name="name" placeholder="이름" required> <br><br>
						<input type="text" name="phone" placeholder="연락처 (숫자만 등록)" required> <br><br>
						<input type="text" name="email" placeholder="이메일 주소" required> <br><br>
						<input type="text" readonly id="addr1" name="addr" placeholder="우편번호" required>
						<input type="text" readonly id="addr2" placeholder="도로명 (지번)" required> <br><br>
						<input type="text" id="addr3" placeholder="상세주소 (배송지)" required> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<button type="button" id="addrbutton" onclick="daumPost()">주소 찾기</button> <br><br>
						- #hashtag / CSS 버튼 클릭 효과 유지 코드 찾기 / 각 버튼 value이름 생각하기 - <br>
						- 클릭시 버튼의 그림자가 없어지면서 버튼을 누른 것 같은 효과 만들기 - <br><br>
						<input type="button" id="b01" value="건강1" onchange="hCheck()"> &nbsp;
						<input type="button" id="b02" value="헬스1" onchange="hellsCheck()"> &nbsp;
						<input type="button" id="b03" value="다이어트1"> &nbsp;
						<input type="button" id="b04" value="미용1"> <br><br>
						<input type="button" id="b05" value="건강2"> &nbsp;
						<input type="button" id="b06" value="헬스2"> &nbsp;
						<input type="button" id="b07" value="다이어트2"> &nbsp;
						<input type="button" id="b08" value="미용2"> <br><br>
						<input type="button" id="b09" value="건강3"> &nbsp;
						<input type="button" id="b10" value="헬스3"> &nbsp;
						<input type="button" id="b11" value="다이어트3"> &nbsp;
						<input type="button" id="b12" value="미용3"> <br><br>
							<label id="hashtag_check">[예시] #건강1, #헬스2, #다이어트3</label> <br><br>
						<input type="text" name="code" placeholder="추천인 코드"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<button type="button" id="codebutton" onclick="codeCheck()">확인</button> <br><br>
						<input type="submit" value="회원가입">
					<td>
				</tr>
			</table>
		</form>
	</div>
	<c:import url="../default/footer.jsp"/>
</body>
</html>