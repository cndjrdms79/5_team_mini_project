<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../commons/header.jsp" %> 
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c6e2734bc69aa5434fd1aaa1fe61817c&libraries=services"></script>

<br/><br/><br/>
<div align="center">
	<form action="join_action.jsp" method="get">
		<table>
			<tr>
				<th>아이디</th>
				<td><input type="text" placeholder="아이디" name="user_id"  id="user_id"
					autofocus="autofocus" required="required" />
				<button id="btnidcheck" type="button">아이디 중복체크</button><div id="id_msg"></div></td>
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
					<input type="radio" name="user_gender" value="여자"   />여자
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
				<td>
					<input type="text" id="user_postcode" name="user_postcode" placeholder="우편번호">
					<input type="button" onclick="execDaumPostcode()" value="주소 검색"><br>
					
					<input type="text" placeholder="주소" id="user_addr" name="user_addr" size="60" maxlength="300" /><br>
					<input type="text" id="user_detailaddr" name="user_detailaddr"  placeholder="상세주소">
					<input type="text" id="user_extraaddr" name="user_extraaddr"  placeholder="참고항목">
					
					<div id="map" style="width:500px;height:300px;margin-top:10px;display:none"></div>
				</td>
				
			<script>
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div
      		mapOption = {
          	center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
          	level: 5 // 지도의 확대 레벨
      		};

  			//지도를 미리 생성
  			var map = new daum.maps.Map(mapContainer, mapOption);
  			//주소-좌표 변환 객체를 생성
  			var geocoder = new daum.maps.services.Geocoder();
  			//마커를 미리 생성
  			var marker = new daum.maps.Marker({
      			position: new daum.maps.LatLng(37.537187, 127.005476),
      			map: map
  			});
			
			function execDaumPostcode() {
    		new daum.Postcode({
        	oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                // 조합된 참고항목을 해당 필드에 넣는다.
                document.getElementById("user_extraaddr").value = extraAddr;
            
            } else {
                document.getElementById("user_extraaddr").value = '';
            }
            
            geocoder.addressSearch(data.address, function(results, status) {
                // 정상적으로 검색이 완료됐으면
                if (status === daum.maps.services.Status.OK) {

                    var result = results[0]; //첫번째 결과의 값을 활용

                    // 해당 주소에 대한 좌표를 받아서
                    var coords = new daum.maps.LatLng(result.y, result.x);
                    // 지도를 보여준다.
                    mapContainer.style.display = "block";
                    map.relayout();
                    // 지도 중심을 변경한다.
                    map.setCenter(coords);
                    // 마커를 결과값으로 받은 위치로 옮긴다.
                    marker.setPosition(coords)
                }
            });

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('user_postcode').value = data.zonecode;
            document.getElementById("user_addr").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("user_detailaddr").focus();
        }
    }).open();
}
</script>
	</tr>					
			<tr>
				<th></th>
				<td>
					<input type="hidden" name="confirm_id" id="confirm_id" />
					<input type="submit" class="btn btn-dark" value="회원가입" />
					<input type="reset" class="btn btn-dark" value="초기화" />
					
				</td>
			</tr>
		</table>
	</form>
</div>
</body>
</html>


<script>
	$(document).ready(function(){
		$('#btnidcheck').on('click',function(){
			if ( $('#user_id').val().length < 4) {
				alert('아이디는 4글자 이상 입력하세요');
				$('#user_id').focus();
				$('#confirm_id').val('ok');
				
				return;
			}
			
			$.post( "check_id.jsp",{ user_id : $('#user_id').val()})
			 .done(function( data ) {
				  if (data.trim() == "true") {
					  $('#id_msg').html($('#user_id').val() + '는 사용 가능한 아이디 입니다.');
// 					  $('#user_pw').focus();
					  return;
				  } else {
					  $('#id_msg').html($('#user_id').val() + '는 이미 사용중인 아이디 입니다.');
					  $('#user_id').focus();
					  return;
				  }
			});
		});
		document.getElementById("confirm_id").onchange = function(){
			alert('test');
		}
	});

</script>