<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<title>1:1문의</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
	$(function() {
		/* $("#title").on("click", function() {
			$("#title").val("");
		}) */

		$("#enroll").on(
				"click",
				function() {
					if ($("#category").val() == "문의 유형을 선택해 주세요") {
						alert("문의 유형을 선택해 주세요.");
						return false;
					}
					/* if ($("#title").val() == "제목을 입력해주세요") {
						alert("제목을 입력해 주세요.");
						return false;
					} */
					// 등록 버튼 클릭시에 제목 또는 내용이 null인 경우 전송 금지
					if ($("#contents").val().length == 0
							|| $("#title").val().length == 0) {
						alert("제목 또는 내용은 비워둘 수 없습니다.");
						return false;
					}
				})
	})
</script>
<style>
.container-fluid {
	max-width: 1200px;
	margin: 0 auto;
}
</style>
</head>
<body>
	<div style="width: 13%; float: left; margin-top: 55px;">
		<c:if test="${login.userid eq 'admin'}">
			<jsp:include page="../table/servicecenterMenu_manager.jsp"></jsp:include>
		</c:if>
		<c:if test="${login.userid ne 'admin'}">
			<jsp:include page="../table/servicecenterMenu.jsp"></jsp:include>
		</c:if>
	</div>
	<div style="width: 85%; float: right; margin-top: 55px">
		<div class="container-fluid">
			<div class="">
				<!--게시판 넓이 -->
				<div class="row">
					<div class="col-lg-12"></div>
				</div>
				<div class="panel panel-default">
					<div class="panel-heading">1:1문의</div>
					<div class="panel-body"></div>
					<form action="loginCheck/question" method="post">
						<div class="form-group">
							<label for="exampleFormControlInput1">제목</label> <input
								type="text" class="form-control" id="title"
								name="title" placeholder="제목을 입력해 주세요" value="">
						</div>
						<div class="form-group">
							<label for="exampleFormControlInput1">문의 유형</label> 
							<br>
							<select name="category" id="category">
									<option selected>문의 유형을 선택해 주세요</option>
									<option>주문/결제문의</option>
									<option>반품/교환문의</option>
									<option>상품문의</option>
									<option>배송문의</option>
									<option>기타문의</option>
							</select>
						</div>
						<div class="form-group">
							<label for="exampleFormControlInput1">문의 내용</label>
							<textarea class="form-control" id="contents" name="contents" rows="10" placeholder="문의 내용을 입력해 주세요"></textarea>
						</div>
						<!-- <table cellspacing="0" cellpadding="0" align="center">
						<thead style="background-color: #bbdefb;">
							<tr>
								<th height="10" style="text-align: center;" colspan="2"><b>1:1
										문의</b></th>
							</tr>
						</thead>

						<tr>
							<th>유형</th>
							<td><select name="category" id="category">
									<option selected>문의 유형을 선택해 주세요</option>
									<option>주문/결제문의</option>
									<option>반품/교환문의</option>
									<option>상품문의</option>
									<option>배송문의</option>
									<option>기타문의</option>
							</select></td>
						</tr>
						<tr>
							<th>제목</th>
							<td><input type="text" id="title" name="title"
								value="제목을 입력해주세요" style="width: 500px;"></td>
						</tr>
						<tr>
							<th>내용</th>
							<td><input type="text" name="contents" id="contents"
								style="width: 500px; height: 100px;"></td>
						</tr>
					</table> -->
						<br> <input type="submit" id="enroll" value="등록"
							style="margin: auto; display: block;">
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>