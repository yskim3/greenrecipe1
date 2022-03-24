<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
* {font-family: 'IBM Plex Sans KR', sans-serif;}

body {
	margin: 0;
	padding: 0;
}

table tbody tr td {
	border-top: 0.5rem solid;
	border-bottom: 0.5rem solid;
	border-left: 0.5rem solid;
	border-right: 0.5rem solid;
	border-color: transparent;
}

.search-container {
	width: 80%;
	display: block;
}

input#search-bar {
	width: 100%;
	height: 25px;
	font-size: 0.8rem;
	border: 2px solid #A3E0BB;
	outline: none; &: focus {border : 1px solid #A3E0BB;
	transition: 0.35s ease;
	color: #A3E0BB; &:: -webkit-input-placeholder {transition : opacity 0.45s ease;
	opacity: 0;
}

.search-icon {
position: relative;
  float: center;
  width: 75px;
  height: 75px;
  top: -12px;
  right: -45px;
}

&
::-moz-placeholder {
	opacity: 0;
}

&
:-ms-placeholder {
	transition: opacity 0.45s ease;
	opacity: 0;
}

}
}

.header {
	vertical-align: middle;
}

div#form-wrapper {
	position: absolute;
	width: 50%;
	top: 7%;
	right: 0;
	left: 18%;
}

a:link {
	color: black;
	text-decoration: none;
}

a:visited {
	color: black;
	text-decoration: none;
}

a:hover {
	color: black;
	text-decoration: none;
}

summary::marker {
	display: none;
	content: "";
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Header</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&display=swap"
	rel="stylesheet">
<script type="text/javascript">
	function keyword_check() {
		if (document.search.keyword.value == '') { //검색어가 없을 경우  
			alert('검색어를 입력하세요'); // 경고창 띄움 
			document.search.keyword.focus(); //다시 검색창으로 돌아감 
			return false;
		}
		else
			return true;
	}
</script>
</head>
<body>
	<div class="header" width="85%" align="center">
		<table border="0" width="80%" bgcolor="white" align="center">
			<tr align="right">
				<td>
				<a href="${contextPath}/member/signup">회원가입&nbsp;&nbsp;</a>
				<c:choose>
					<c:when test="${loginUser == null}">
						<a href="${contextPath}/member/login">로그인&nbsp;&nbsp;</a>												
					</c:when>
					<c:otherwise>
						<a href="${contextPath}/member/logout">로그아웃&nbsp;&nbsp;</a>
					</c:otherwise>
				</c:choose>
				<a href="${contextPath}/help/helpAll">고객센터&nbsp;&nbsp;</a>
				<!-- 
				<a href="${contextPath}/member/signup">회원가입&nbsp;&nbsp;</a>
				<a href="${contextPath}/member/login">로그인&nbsp;&nbsp;</a>
				<a href="${contextPath}/help/helpAll">고객센터&nbsp;&nbsp;</a>
				-->
				</td>
			</tr>
			<tr align="center">
				<td><a href="${contextPath}/default/main"><img src="../resources/images/banner.png" width=300px></a></td>
				<!-- <a href="MainPage.jsp"> -->
			</tr>
		</table>

		<%
	request.setCharacterEncoding("UTF-8");
// request.setCharacterEncoding("euc-kr");
/* 	CateInfoDAO tidao = new CateInfoDAO();	
	ArrayList<CateInfoVO> tiArray = tidao.getAllInfo(); */
%>
		<table border=0 width="75%" bgcolor=white>
			<tr valign="top">
				<td>
				<details> 
				<summary> 
				<img src="../resources/images/categoryIcon.png" width=20px valign="middle">&nbsp;&nbsp;카테고리 보기 
				</summary>
				</details>
				</td>
				<td>
				<a href="recipe.jsp">레시피&nbsp;&nbsp;&nbsp;</a>
				</td>
				<td>
				<a href="best.jsp">베스트&nbsp;&nbsp;&nbsp;</a>
				</td>
				<td>
				<a href="new.jsp">신상품&nbsp;&nbsp;&nbsp;</a>
				</td>
				<td>
				<a href="sale.jsp">특가/할인&nbsp;&nbsp;&nbsp;</a>
				</td>
				<td>
				<a href="event.jsp">이벤트/쿠폰존&nbsp;&nbsp;&nbsp;</a>
				</td>
				<td align="right">
				<form name="search" method="get" action="SearchPage.jsp" class="search-container" onsubmit="return keyword_check()">
				<input type="text" name="keyword" id="search-bar" placeholder="어떤 물건을 찾고 있나요?" onKeypress="javascript:if(event.keyCode==13) {search_onclick_submit}">
				</form>
				</td>
				<td align="left" valign="middle">
				<a href="SearchPage.jsp?keyword="><img class="search-icon" src="../resources/images/search.png" width=20px></a>
				</td> 
				
				<td align="right">
				<a href="cart.jsp"><img src="../resources/images/cart.png" width=30px></a>&nbsp;&nbsp;&nbsp;
				<a href="myPage.jsp"><img src="../resources/images/like.png" width=30px></a>
				</td>
			</tr>
		</table>
		<%
/* 	for(CateInfoVO tmp: tiArray){ 
	String cateName = tmp.getCateName(); */
%>
		<%-- <table border = 0 width="100%" bgcolor=white>
	<tr>
	<td width="30%"></td>
	<td><a href = "CategoryPage.jsp?name=<%=cateName %>"><%=cateName %></a></td>
	<%} %>
	</tr>
	</table> --%>
		</details>
	</div>
</body>
</html>