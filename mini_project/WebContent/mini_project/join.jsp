<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" type="image/png" href="/favicon.png">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&display=swap" rel="stylesheet">
<style type="text/css">
body {
	font-family: 'Nanum Pen Script', cursive;
	font-size: 25px;

/*  	margin: 0;  */
	margin-left: auto;
	margin-right: auto;
	text-align: center;
}

.nav-container {
	display: flex;
	flex-direction: row;
	width: 100%;
	margin: 0;
	padding: 0;
	background-color: lightseagreen;
	list-style-type: none;
}

.nav-item {
	padding: 15px;
	cursor: pointer;
}

.nav-item a {
	text-align: center;
	test-decoration: none;
	color: white;
	padding: 15px;
}

.nav-item:nth-child(1) {
	background-color: skyblue;
}

.nav-item:hover {
	background-color: grey;
}
</style>

<title>회원가입 화면</title>
</head>
<body>

<h1><b>인공지능 AI</b></h1>
	<nav>
		<ul class="nav-container">
			<li class="nav-item"><a href="main.jsp">출결관리 웹페이지</a></li>
			<li class="nav-item"><a href="calendar.jsp">달력</a></li>
			<li class="nav-item"><a href="bbs.jsp">게시판</a></li>
			<li class="nav-item"><a href="login.jsp">접속하기</a></li>
		</ul>
	</nav>


<div align="center">
	<form action="join_action.jsp" method="get">
		<table>
		<caption><h3><b>회원가입</b></h3></caption>
			<tr>
				<th>아이디</th>
				<td><input type="text" placeholder="아이디" name="user_id" autofocus="autofocus" required="required" /></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" placeholder="비밀번호" name="user_pw" required="required" /></td>
			</tr>
			<tr>
				<th>이름</th>
				<td><input type="text" placeholder="이름" name="user_name" required="required" /></td>
			</tr>
			<tr>
				<th>생년월일</th>
				<td><input type="text" placeholder="생년월일(ex 19950602)" name="user_birthdate" required="required" maxlength="8" /></td>
			</tr>
			<tr>
				<th>성별</th>
				<td>
					<input type="radio" name="user_gender" value="남자" checked="checked"   />남자
					<input type="radio" name="user_gender" value="여자" checked="checked"  />여자
				</td>
			</tr>	
			<tr>
				<th>이메일</th>
				<td><input type="email" placeholder="이메일" name="user_email" /></td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td><input type="text" placeholder="전화번호 (-)생략" name="user_phone" maxlength="11" /></td>
			</tr>
			<tr>
				<th>주소</th>
				<td><input type="text" placeholder="주소" name="user_addr" size="65" maxlength="45" /></td>
			</tr>					
			<tr>
				<th></th>
				<td>
					<input type="submit" value="회원가입" />
					<input type="reset" value="초기화" />
				
				</td>
			</tr>
		</table>
	</form>

</div>

</body>
</html>