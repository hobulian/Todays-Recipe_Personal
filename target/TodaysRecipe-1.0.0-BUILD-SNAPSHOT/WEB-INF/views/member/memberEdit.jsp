<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
$(function() {
	$(".removeBtn").on("click", function() {
		console.log("삭제 버튼 클릭 ");
		var userid = $(this).attr("data-userid");
		var xxx = $(this);
		if (confirm(userid+"의 회원 정보를 삭제하시겠습니까?") == true) {
				$.ajax({
				url : "memberDelete",
				type : "post",
				dataType : "text",
				data : {
					userid : userid 
				},
				success : function(data, status, xhr) {
					alert(userid+"의 회원 정보가 삭제되었습니다.");
					console.log("success");
					//dom삭제 
					xxx.parents().filter("tr").remove();
					window.location.reload();
				},
				error : function(xhr, status, error) {
					console.log(error);
				}
			});//end ajax
		} else {
			return false
		}
	});//end event
	//수정버튼이벤트 처리 
	
	$(".updateBtn").on("click", function() {
		var userid = $(this).attr("data-userid");
		var passwd = $("#passwd" + userid).val();
		var username  = $("#username" + userid).val();
		var post = $("#post" + userid).val();
		var addr1 = $("#addr1" + userid).val();
		var addr2 = $("#addr2" + userid).val();
		var phone1 = $("#phone1" + userid).val();
		var phone2 = $("#phone2"+ userid).val();
		var phone3 = $("#phone3"+ userid).val();
		var email1 = $("#email1"+ userid).val();
		var email2 = $("#email2"+ userid).val();
		if (confirm(userid+"의 회원 정보를 수정하시겠습니까?") == true) {
				$.ajax({
				url : "mUpdate",
				type : "get",
				dataType : "text",
				data : {
					userid : userid,
					passwd : passwd,
					username : username,
					post : post,
					addr1 : addr1,
					addr2 : addr2,
					phone1 : phone1,
					phone2 : phone2,
					phone3 : phone3,
					email1 : email1,
					email2 : email2
				},
				success : function(data, status, xhr) {
					alert(userid+"의 회원 정보가 수정되었습니다.");
					console.log("success");
				},
				error : function(xhr, status, error) {
					console.log(error);
				}//end error			
			});//end ajax
		} else {
			return false
		}
	}); //end click
})
</script>

<div style="width:10%; float:left;">
	<jsp:include page="../table/adminMenu.jsp"></jsp:include>
</div>
<div style="width:88%; float:right">
<form name="memberListForm" method="GET" action="#">
	<table style='padding: 5px; border: 1px; border-collapse: collapse'>
		<tr>
			<td align="center">아이디</td>
			<td align="center">패스워드</td>
			<td align="center">이름</td>
			<td style="border-spacing: 30px;"></td>
			<td align="center">우편번호
			<td align="center">주소</td>
			<td align="center">상세주소</td>
			<td style="border-spacing: 30px;"></td>
			<td colspan="3" align="center">핸드폰</td>
			<td style="border-spacing: 30px;"></td>
			<td colspan="2" align="center">이메일</td>
		</tr>
		<c:forEach var="dto" items="${memberEdit}" varStatus="status">
			<tr>
				<td><input type="text" name=userid id="userid${dto.userid}"
					value="${dto.userid}" style="width: 90px; height: 15px;" disabled></td>

				<td><input type="text" name=passwd id="passwd${dto.userid}"
					value="${dto.passwd}" style="width: 90px; height: 15px;"></td>

				<td><input type="text" name=username id="username${dto.userid}"
					value="${dto.username}" style="width: 90px; height: 15px;"></td>
				<td style="border-spacing: 30px;"></td>
				<td><input type="number" name=post id="post${dto.userid}"
					value="${dto.post}" style="width: 90px; height: 15px;">
				<td><input type="text" name=addr1 id="addr1${dto.userid}"
					value="${dto.addr1}" style="width: 150px; height: 15px;">
				<td><input type="text" name=addr2 id="addr2${dto.userid}"
					value="${dto.addr2}" style="width: 100x; height: 15px;"></td>
				<td style="border-spacing: 30px;"></td>
				<td><input type="number" name=phone1 id="phone1${dto.userid}"
					value="${dto.phone1}" style="width: 50px; height: 15px;"> -
				
				<td><input type="number" name=phone2 id="phone2${dto.userid}"
					value="${dto.phone2}" style="width: 90px; height: 15px;"> -
				
				<td><input type="number" name=phone3 id="phone3${dto.userid}"
					value="${dto.phone3}" style="width: 90px; height: 15px;"></td>
				<td style="border-spacing: 30px;"></td>
				<td><input type="text" name=email1 id="email1${dto.userid}"
					value="${dto.email1}" style="width: 90px; height: 15px;">
					@
				<td><input type="text" name=email2 id="email2${dto.userid}"
					value="${dto.email2}" style="width: 90px; height: 15px;"></td>
				<td><input type="button" value="수정" class="updateBtn"
					data-userid="${dto.userid}"></td>
				<td><input type="button" value="제거" class="removeBtn"
					data-userid="${dto.userid}"></td>
			</tr>
		</c:forEach>
	</table>
</form>
</div>