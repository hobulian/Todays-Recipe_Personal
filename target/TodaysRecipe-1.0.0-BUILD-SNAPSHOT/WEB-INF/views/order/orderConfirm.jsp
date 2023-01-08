<%@page import="com.dto.MemberDTO"%>
<%@page import="com.dto.CartDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
	function sameAddress(n){
		console.log(n,n.checked);
		if(n.checked){
		 document.getElementById("orderName").value=
			 document.getElementById("mname").value;
		 document.getElementById("sample4_postcode").value=
			 document.getElementById("mpost1").value;
		 document.getElementById("sample4_roadAddress").value=
			 document.getElementById("maddress1").value;
		 document.getElementById("sample4_jibunAddress").value=
			 document.getElementById("maddress2").value;
		 document.getElementById("phone").value=
			 document.getElementById("mphone").value;
		 document.getElementById("phone1").value=
			 document.getElementById("mphone1").value;
		 document.getElementById("phone2").value=
			 document.getElementById("mphone2").value;
		 document.getElementById("phone3").value=
			 document.getElementById("mphone3").value;
		}else{
			document.getElementById("orderName").value="";
			 document.getElementById("sample4_postcode").value="";
			 document.getElementById("sample4_roadAddress").value="";
			 document.getElementById("sample4_jibunAddress").value="";
			 document.getElementById("phone").value="";
			 document.getElementById("phone1").value="";
			 document.getElementById("phone2").value="";
			 document.getElementById("phone3").value="";
		}
	}
	$(document).ready(function(){
		$('#orderConfirmForm').submit(function() {
			/* if ($('#orderName').val() == '') {
	            alert('배송받는분의 이름을 입력하세요');
	            $('#orderName').focus();
	            return false;
	        } */
			// 이름 길이 예외처리
			if ($('#orderName').val().length < 2 || $('#orderName').val().length > 5) {
	            alert('이름은 두글자에서 다섯글자까지만 설정 가능합니다.');
	            $('#orderName').focus();
	            return false;
	        }
			if ($('#sample4_postcode').val() == '') {
	            alert('배송지의 우편번호를 입력하세요');
	            $('#sample4_postcode').focus();
	            return false;
	        }
			if ($('#sample4_roadAddress').val() == '') {
	            alert('배송지의 도로명주소를 입력하세요');
	            $('#sample4_roadAddress').focus();
	            return false;
	        }
			if ($('#sample4_jibunAddress').val().length == 0) {
	            alert('배송지의 상세주소를 입력하세요');
	            $('#sample4_jibunAddress').focus();
	            return false;
	        }
			/* if ($('#phone').val() == '') {
	            alert('배송관련 연락을 받으실 휴대전화 번호를 입력하세요');
	            $('#phone').focus();
	            return false;
	        } */
			if ($('#phone1').val().length != 3 ) {
	            alert('전화번호를 확인하세요.');
	            $('#phone1').focus();
	            return false;
	        }
			if ($('#phone2').val().length != 4 ) {
	            alert('전화번호를 확인하세요.');
	            $('#phone2').focus();
	            return false;
	        }
			if ($('#phone3').val().length != 4 ) {
	            alert('전화번호를 확인하세요.');
	            $('#phone3').focus();
	            return false;
	        }
			
			var phone = $("#phone1").val() + $("#phone2").val() + $("#phone3").val();
			$("#phone").val(phone);
		});
	});
	
</script>	

<% 	List<CartDTO> list_CartDTO = (List<CartDTO>)request.getAttribute("cDTO_list");
	MemberDTO mDTO = (MemberDTO)request.getAttribute("mDTO");
%>
<% 		
	session.setAttribute("list_CartDTO", list_CartDTO);
	session.setAttribute("mDTO", mDTO);
%>

<form name="myForm" method="get" action="loginCheck/orderDone" id="orderConfirmForm">
  <div class="wrap">
	<table width="80%" cellspacing="0" cellpadding="0" align="center">
		<tr>
			<td height="30">
		</tr>

		<tr>
			<td align="center">
				<font size="5"><b>주문서</b></font>
			</td>
		</tr>

		<tr>
			<td height="15">
		</tr>
		
		<tr>
			<td><b>주문상품</b></td>
		</tr>
		
		<tr>
		
			<td>
				<hr size="2" color="CCCCCC">
			</td>
		</tr>


		<tr>
			<td>
				<table width="100%" cellspacing="0" cellpadding="0">


					<c:set var = "total" value="0" />
					<!-- 반복시작 -->
					<c:forEach var="cDTO" items="${cDTO_list}">
					<tr>
						<td height="10">
					</tr>
					
					<tr>
						<td class="td_default" width="80"><img
							src="images/items/${cDTO.gImage}.png" border="0" align="center"
							width="80" /></td>
						<td class="td_default" width="300" style='padding-left: 30px'>
						${cDTO.gName}
						</td>
						<td class="td_default" align="right" width="90">${cDTO.gAmount}개</td>
						<td class="td_default" align='right'>
							<fmt:formatNumber value="${cDTO.gAmount * cDTO.gPrice  }" pattern="#,###"/>원
						</td>
					</tr>
					<tr>
						<td height="10">
					</tr>
					<tr>
						<td colspan="5">
							<hr size="1" color="CCCCCC">
						</td>
					</tr>
						<c:set var = "total" value="${total + cDTO.gAmount * cDTO.gPrice}" />
					</c:forEach>
					<tr>
						<td colspan="5" align="right">
							총결제금액: <fmt:formatNumber value="${total}" pattern="#,###"/>원
							
						</td>
					</tr>
				</table>

		</td>
	</tr>
	
	
	
	<!--  고객 정보 시작-->
		<tr>
		<td height="30">
	
		</tr>

	<tr>
		<td><b>주문자 정보</b></td>
	</tr>
	<tr>
		<td>
			<hr size="2" color="CCCCCC">
		</td>
	</tr>
	<tr>
		<td height="15">
	
		</tr>


	<tr>
		<td>
			<table width="100%" cellspacing="0" cellpadding="0">
				<tr>
					<td width="125" height="35" class="td_default">
						
						이 름
					</td>
					<td height="35" class="td_default">
						<input class="input_default" type="text" id="mname" size="20" style="border:none;"
							maxlength="20" value="${mDTO.username}" readonly></input>
					</td>
				</tr>
				<tr>
					<td height="35" class="td_default">
						
						우편번호
					</td>
					<td height="35" class="td_default">
						<input class="input_default" type="text" id="mpost1" size="4" style="border:none;"
							maxlength="3" value="${mDTO.post}" readonly></input>
						
					</td>
				</tr>
				<tr>
					<td height="35" class="td_default">
						
						주 소
					</td>
					<td height="35" class="td_default">
						<input class="input_default" type="text" id="maddress1" size="35" style="border:none;"
							maxlength="200" value="${mDTO.addr1}" readonly></input><br>
						<input class="input_default" type="text" id="maddress2" size="35" style="border:none;"
							maxlength="200" value="${mDTO.addr2}" readonly></input>
					</td>
				</tr>
				
				<tr>
					<td height="35" class="td_default">
						휴대전화
					</td>
					<td height="35" class="td_default">
						<input class="input_default" type="hidden" id="mphone" size="15" style="border:none;"
							maxlength="15" value="${mDTO.phone1}${mDTO.phone2}${mDTO.phone3}"></input>
						<input type="text" style="border:none; text-align: center;" value="${mDTO.phone1}" id="mphone1" size="1" readonly/>-
						<input type="text" style="border:none; text-align: center;" value="${mDTO.phone2}" id="mphone2" size="1" readonly/>-
						<input type="text" style="border:none; text-align: center;" value="${mDTO.phone3}" id="mphone3" size="1" readonly/>
					</td>
				</tr>
			</table>							
		</td>
	</tr>
<!--  고객 정보 끝-->
	<tr>
		<td height="30">
	
		</tr>

	<tr> 
		<td class="td_default">
			 <input type="checkbox" name="same"
				onclick="javascript:sameAddress(this);"> 배송지가 동일할 경우 선택하세요.
		</td>
	</tr>
<!--  배송지 정보 시작-->
	<tr>
		<td height="30">
	
		</tr>

	<tr>
		<td><b>배송 정보</b></td>
	</tr>
	<tr>
		<td>
			<hr size="2" color="CCCCCC">
		</td>
	</tr>
	<tr>
		<td height="15">
	
		</tr>


	<tr>
		<td>
			<table width="100%" cellspacing="0" cellpadding="0">
				<tr>
					<td width="125" height="35" class="td_default">
						
						이 름
					</td>
					<td height="35" class="td_default">
						<span class="username">
						<input class="input_default" type="text" id="orderName"
							name="orderName" size="20" maxlength="20" value=""></input>
						</span>
					</td>
				</tr>
				<tr>
					<td height="35" class="td_default">
						
						우편번호
					</td>
					<td height="35" class="td_default">
						<!-- 다음주소 시작-->
						<sapn class="post">
							<input type="text" name="post" id="sample4_postcode" placeholder="우편번호">
							<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기">
						</sapn>
						<span id="guide" style="color:#999"></span>
						<br>
						<!-- 다음주소 끝 -->
					</td>
				</tr>
				<tr>
					<td height="35" class="td_default">
						
						주소
					</td>
					<td height="35" class="td_default">
						<!-- 다음주소 시작-->
						<sapn class="address">
							<input type="text" name="addr1" id="sample4_roadAddress" placeholder="도로명주소"><br>
							<input type="text" name="addr2" id="sample4_jibunAddress" placeholder="상세주소">
						</sapn>
						<span id="guide" style="color:#999"></span>
						<br>
						<!-- 다음주소 끝 -->
					</td>
				</tr>
				
				<tr>
					<td height="35" class="td_default">
						
						휴대전화
					</td>
					<td height="35" class="td_default">
						<span class="phone">
							
							<input type="text" style="text-align: center;" value="" id="phone1"/>-
							<input type="text" style="text-align: center;" value="" id="phone2"/>-
							<input type="text" style="text-align: center;" value="" id="phone3"/>
							<input class="input_default" type="hidden" id="phone"
								name="phone" size="15" maxlength="15" value=""></input>
						</span>
					</td>
				</tr>
			</table>							
		</td>
	</tr>
<!--  배송지 정보 끝-->

	<tr>
		<td height="30">
	
		</tr>
	<tr>
		<td><b>결제 수단</b></td>
	</tr>
	<tr>
		<td>
			<hr size="2" color="CCCCCC">
		</td>
	</tr>
	<tr>
		<td height="15">
	
		</tr>
	<tr>
		<td>
			<table width="100%" cellspacing="0" cellpadding="0">
				<tr>
					<td width="125" height="35" class="td_default">
						<input type="radio" name="payMethod" value="신용카드" checked>신용카드</input>&nbsp;&nbsp;
						
						<input type="radio" name="payMethod" value="계좌이체">계좌이체</input>&nbsp;&nbsp;
						
						<input type="radio" name="payMethod" value="무통장 입금">무통장 입금</input>&nbsp;&nbsp;
					</td>
					
				</tr>
				
			</table>							
		</td>
	</tr>
	
	<tr>
		<td height="30">
	
	</tr>


	<tr>
		<td class="td_default" align="right">
			<span class="submit">
				<input type='button' value='취소' onclick="javascript:history.back()">	&nbsp;&nbsp;&nbsp;
				<input type='submit' value='결제하기'>
			</span>
		</td>
	</tr>
	<tr>
		<td height="30">
	
	</tr>
</table>
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
                /* document.getElementById('sample4_jibunAddress').value = data.jibunAddress; */

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