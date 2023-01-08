<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script> 
<script>
  $(document).ready(function(){
	  
	   //숫자가 아니면 입력창에 입력이 안되게끔 처리 (NumberOnly)
	   $("input:text[numberOnly]").on("keyup", function() {
		      $(this).val($(this).val().replace(/[^0-9]/g,""));
		   }); 
	 
	  /* $("form").on("submit",function(event){
		 var email1=$("#email1").val(); 
		 var email2=$("#email2").val(); 
		 if(email1.length==0|| email2.length==0){
			 event.preventDefault();
			 alert("email  확인");
		 }
	  }); */
	  
	  $('#mypage').submit(function() {
		    console.log($('#result').text());			
		    /* // 아이디 중복 검사
			if ($('#result').text() == "아이디 중복") {
	            alert('아이디 중복');
	            $('#userid').focus();
	            return false;
	        }
			
			// 비밀번호 확인 불일치
			if ($('#passwd').val() != $('#passwd2').val()) {
	            alert('비밀번호 불일치');
	            $('#passwd').focus();
	            return false;
	        } */
		  
			// 빈칸 누락 예외처리
	        /* if ($('#userid').val() == '') {
	            alert('아이디를 입력하세요');
	            $('#userid').focus();
	            return false;
	        }
	        if ($('#passwd').val() == '') {
	            alert('비밀번호를 입력하세요.');
	            $('#passwd').focus();
	            return false;
	        }
	        if ($('#passwd2').val() == '') {
	            alert('비밀번호 확인을 입력하세요.');
	            $('#passwd2').focus();
	            return false;
	        }
	        if ($('#passwd2').val() == '') {
	            alert('비밀번호 확인을 입력하세요.');
	            $('#passwd2').focus();
	            return false;
	        } */
	        if ($('#username').val() == '') {
	            alert('이름을 입력하세요.');
	            $('#username').focus();
	            return false;
	        }
	        
	        if ($('#sample4_postcode').val() == '') {
	            alert('우편번호 입력하세요.');
	            $('#sample4_postcode').focus();
	            return false;
	        }
	        if ($('#sample4_roadAddress').val() == '') {
	            alert('도로명 주소를 입력하세요.');
	            $('#sample4_roadAddress').focus();
	            return false;
	        }
	        if ($('#sample4_jibunAddress').val() == '') {
	            alert('상세 주소를 입력하세요.');
	            $('#sample4_jibunAddress').focus();
	            return false;
	        }
	        if ($('#phone1').val() == '') {
	            alert('전화번호를 입력하세요.');
	            $('#phone1').focus();
	            return false;
	        }
	        if ($('#phone1').val().length != 3 ) {
	            alert('전화번호를 확인하세요.');
	            $('#phone1').focus();
	            return false;
	        }
	        
	        if ($('#phone2').val() == '') {
	            alert('전화번호를 입력하세요.');
	            $('#phone2').focus();
	            return false;
	        }
	        
	        if ($('#phone2').val().length > 4 ) {
	            alert('전화번호를 확인하세요.');
	            $('#phone2').focus();
	            return false;
	        }

	        if ($('#phone3').val() == '') {
	            alert('전화번호를 입력하세요.');
	            $('#phone3').focus();
	            return false;
	        }
	        
	        if ($('#phone3').val().length > 4 ) {
	            alert('전화번호를 확인하세요.');
	            $('#phone3').focus();
	            return false;
	        }

	        if ($('#email1').val() == '') {
	            alert('이메일을 입력하세요.');
	            $('#email1').focus();
	            return false;
	        }
	        if ($('#email2').val() == '') {
	            alert('이메일을 입력하세요.');
	            $('#email2').focus();
	            return false;
	        }
	        
	     	// 이름 길이 예외처리
			if ($('#username').val().length < 2 || $('#username').val().length > 5) {
	            alert('이름은 두글자에서 다섯글자까지만 설정 가능합니다.');
	            $('#username').focus();
	            return false;
	        }
	    });
	  
	// 이메일 선택 입력
	  $("#emailSelect").on("click", function () {
		$("#email2").val($("#emailSelect").val());
	})
	  
  });
</script>
<form action="loginCheck/memberUpdate" method="get" id="mypage">

<span id="result"></span>
	<div class="wrap">
        <div class="login">
            <h2>회원정보</h2>
            <div class="login_id">
                <h4>아이디</h4>
                <input type="text" name="userid" id="userid" value="${login.userid }" disabled>
                <span id="result"></span>
            </div>

            <div class="username">
                <h4>이름</h4>
                <input type="text" name="username" value="${login.username}" id="username">
            </div>
            <div class="post" style="display:inline;">
                <h4>우편번호</h4>
                <input type="text" name="post" id="sample4_postcode" value="${login.post }">
                <input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기">
            </div>
            <div class="address">
                <h4>주소</h4>
                <input type="text" value="${login.addr1 }" name="addr1" id="sample4_roadAddress" placeholder="도로명 주소">
                <input type="text" value="${login.addr2 }" name="addr2" id="sample4_jibunAddress" placeholder="상세 주소">
                <span id="guide" style="color:#999"></span>
            </div>
            <div class="phone">
                <h4>전화번호</h4>
				<select name="phone1" id="phone1">
					<option value="010" 
					<c:if test="${login.phone1=='010' }">selected</c:if>
				  	>010</option>
				  	<option value="011"
				 	<c:if test="${login.phone1=='011' }">selected</c:if>
				  	>011</option>
				</select>&nbsp;-&nbsp;
				<input type="text" value="${login.phone2 }" name="phone2" id="phone2" numberOnly>
					&nbsp;-&nbsp;<input type="text" value="${login.phone3 }" name="phone3" id="phone3" numberOnly>
            </div>
            <div class="email">
                <h4>이메일</h4>
				<input type="text" value="${login.email1 }" name="email1" id="email1">@
       			<input type="text" value="${login.email2 }" name="email2" id="email2" placeholder="직접입력">
       			<select  id="emailSelect">
        			<option value="daum.net">daum.net</option>
        			<option value="naver.com">naver.com</option>
       			</select>
            </div>
            
            <div class="submit">
                <input type="submit" value="수정">&nbsp;&nbsp;
                <input type="reset" value="취소" onClick="location.href='/TodaysRecipe/';">
            </div>
            <br>
            <br>
        </div>
    </div>



</form>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 도로명 조합형 주소 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }
                // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
                if(fullRoadAddr !== ''){
                    fullRoadAddr += extraRoadAddr;
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('sample4_roadAddress').value = fullRoadAddr;
                /* document.getElementById('sample4_jibunAddress').value = data.jibunAddress; */ //상세주소(직접입력)로 변경

                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    //예상되는 도로명 주소에 조합형 주소를 추가한다.
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    document.getElementById('guide').innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';

                } /* else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    document.getElementById('guide').innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';

                } */ else {
                    document.getElementById('guide').innerHTML = '';
                }
            }
        }).open();
    }
</script>