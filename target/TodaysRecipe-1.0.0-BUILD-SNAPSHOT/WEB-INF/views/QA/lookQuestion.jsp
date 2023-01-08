<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
	$(function() {
		$("#update").on(
				"click",
				function() {
					// 수정 버튼 클릭시에 제목 또는 내용이 null인 경우 전송 금지
					if ($("#contents").val().length == 0
							|| $("#title").val().length == 0) {
						alert("제목 또는 내용은 비워둘 수 없습니다.");
						return false;
					}
					var contents = $("#contents").val();
					$("form").attr("action",
							"updateQuestion?contents=" + contents);
				})
		$("#delete").on("click", function() {
			// 삭제 버튼 클릭시에 num을 포함하여 전송
			var num = $("#num").val();
			$("form").attr("action", "deleteQuestion?num=" + num);
		})
	})
</script>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<style>
.container-fluid {
	max-width: 1200px;
	margin: 0 auto;
}
</style>
<title>1:1문의</title>
</head>
<!-- ${questionDto}, 질문 출력, 질문 수정, 질문 삭제 -->
<body>
	<div style="width: 13%; float: left; margin-top: 55px;">
		<jsp:include page="../table/servicecenterMenu.jsp"></jsp:include>
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
					<form name="myForm" action="#">
						<!-- 수정, 삭제 버튼을 클릭했을 때 이동 -->
						<input type="hidden" name=num id="num" value="${questionDto.num}">
						<div class="form-group">
							<label for="exampleFormControlInput1">제목</label> <input
								type="text" class="form-control" id="title" name="title"
								value="${questionDto.title}">
						</div>
						<div class="form-group">
							<label for="exampleFormControlInput1">문의 유형</label><br> <select
								name="category" id="category">
								<option
									<c:if test="${questionDto.category=='주문/결제문의'}">selected</c:if>>
									주문/결제문의</option>
								<option
									<c:if test="${questionDto.category=='반품/교환문의'}">selected</c:if>>
									반품/교환문의</option>
								<option
									<c:if test="${questionDto.category=='상품문의'}">selected</c:if>>상품문의</option>
								<option
									<c:if test="${questionDto.category=='배송문의'}">selected</c:if>>배송문의</option>
								<option
									<c:if test="${questionDto.category=='기타문의'}">selected</c:if>>기타문의</option>
							</select>
						</div>
						<div class="form-group">
							<label for="exampleFormControlInput1">문의 내용</label>
							<textarea class="form-control" id="contents" name="contents" rows="10">${questionDto.contents}</textarea>
						</div>
						
						<%-- <table cellspacing="0" cellpadding="0" align="center">
			<thead style="background-color: #bbdefb;">
				<tr>
					<th height="10" style="text-align:center;" colspan="2"><b>1:1 문의</b></th>
				</tr>
			</thead>

			<tr>
				<th>유형</th>
				<td><select name="category" id="category">
						<option
							<c:if test="${questionDto.category=='주문/결제문의'}">selected</c:if>>
							주문/결제문의</option>
						<option
							<c:if test="${questionDto.category=='반품/교환문의'}">selected</c:if>>
							반품/교환문의</option>
						<option
							<c:if test="${questionDto.category=='상품문의'}">selected</c:if>>상품문의</option>
						<option
							<c:if test="${questionDto.category=='배송문의'}">selected</c:if>>배송문의</option>
						<option
							<c:if test="${questionDto.category=='기타문의'}">selected</c:if>>기타문의</option>
				</select></td>
			</tr>
			<tr>
				<th>제목</th>
				<td><input type="text" id="title" name="title"
					value="${questionDto.title}" style="width: 500px;"></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><input type="text" name="contents" id="contents"
					style="width: 500px; height: 100px;"
					value="${questionDto.contents}"></td>
			</tr>
		</table> --%>
						
						<div style="width: 100%; text-align: center;">
							<button id="update" style="margin: auto;">수정하기</button>
							<button id="delete" style="margin: auto;">삭제하기</button>
						</div>
					</form>
					<div style="text-align: center;">
						<a href="user_qaList">이전페이지로</a>
					</div>
				</div>
			</div>
		</div>
</body>
</html>