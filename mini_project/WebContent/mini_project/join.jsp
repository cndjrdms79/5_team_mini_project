<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file = "../commons/header.jsp" %> 
	<h2>회원가입</h2>
<div align="center">
	<form action="join_action.jsp" method="get">
		<table>
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
					<input type="submit" class="btn btn-info" value="회원가입" />
					<input type="reset" class="btn btn-info" value="초기화" />
				
				</td>
			</tr>
		</table>
	</form>
</div>
</body>
</html>