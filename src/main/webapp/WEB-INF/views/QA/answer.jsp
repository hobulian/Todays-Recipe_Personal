<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
	$(function() {
		$("#answerBtn").on("click", function() {
			if ($("#answer").val().length == 0) {
				alert("답변을 작성해 주세요.");
				$("#answer").focus();
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
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  
<title>1:1문의</title>
<!-- 답변 입력, 답변 내용을 업데이트, 목록으로 전환, ${manager_qdto}-->
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
					<form action="answerUpdate">
						<input type="hidden" name="num" id="num"
							value="${manager_qdto.num}">
						<div class="form-group">
							<label for="exampleFormControlInput1">제목</label> <input
								type="text" class="form-control" id="title"
								name="title" value="${manager_qdto.title}" readonly>
						</div>
						<div class="form-group">
							<label for="exampleFormControlInput1">작성자</label> <input
								type="text" class="form-control" id="userid"
								name="userid" value="${manager_qdto.userid}" readonly>
						</div>
						<div class="form-group">
							<label for="exampleFormControlInput1">문의 유형</label> <input
								type="text" class="form-control" id="category"
								name="category" value="${manager_qdto.category}" readonly>
						</div>
						<div class="form-group">
							<label for="exampleFormControlInput1">문의 내용</label>
							<textarea class="form-control" id="contents" name="contents" rows="10" readonly>${manager_qdto.contents}</textarea>
						</div>
						<div class="form-group">
							<label for="exampleFormControlInput1">답변</label>
							<textarea class="form-control" id="answer" name="answer" rows="10" value="${manager_qdto.answer}" placeholder="답변을 입력해 주세요"
							<c:if test="${manager_qdto.answer != null}"> readonly </c:if>>${manager_qdto.answer}</textarea>
						</div>
						<%-- <table align="center">
		<colgroup>
			<col width="10%">
			<col width="10%">
			<col width="20%">
			<col width="40%">
			<col width="20%">
		</colgroup>
		<thead style="background-color: #bbdefb;">
			<tr>
				<th scope="col">문의번호</th>
				<th scope="col">작성자</th>
				<th scope="col">문의유형</th>
				<th scope="col">제목</th>
				<th scope="col">작성일</th>
			</tr>
		</thead>
			<tr>
				<td style="text-align:center;">${manager_qdto.num}</td>
				<td style="text-align:center;">${manager_qdto.userid}</td>
				<td style="text-align:center;">${manager_qdto.category}</td>
				<td style="text-align:center;">${manager_qdto.title}</td>
				<td style="text-align:center;">${manager_qdto.writeday}</td>
			</tr>
			<tr><td><br><br></td></tr>
			<tr>
				<th>질문</th>
				<td colspan="5">${manager_qdto.contents}</td>
			</tr>
			<!-- 답변이 있을 경우 질문과 답변 사이에 수평선 삽입 -->
			<c:if test="${manager_qdto.answer != null}">
				<tr>
					<td colspan="4"><hr></td>
				</tr>
			</c:if>
			<tr>
				<th>답변</th>
				<td colspan="4">
					<!-- 답변이 없는 경우, 답변 작성 -->
					<c:if test="${manager_qdto.answer == null}">
						<input type="text" id="answer" name="answer" value="${manager_qdto.answer}"
						style="width:100%; height:200px;">
					</c:if>
					<!-- 답변이 있는 경우, 답변을 출력만 해줌 -->
					<c:if test="${manager_qdto.answer != null}">
						${manager_qdto.answer}
					</c:if>
				</td>
			</tr>
		</table><br> --%>
						<!-- 답변이 없는 경우 작성된 답변, 질문번호를 controller로 전송 -->
						<c:if test="${manager_qdto.answer == null}">
							<input type="submit" id="answerBtn" value="답변전송"
								style="margin: auto; display: block;">
						</c:if>
						<!-- 답변을 조회만 하는 경우, 목록페이지 링크 -->
						<c:if test="${manager_qdto.answer != null}">
							<div style="text-align: center;">
								<a href="manager_qaList">이전페이지로</a>
							</div>
						</c:if>
					</form>
				</div>
			</div>
		</div>
</body>
</html>