<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!DOCTYPE html>
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
<!-- ${answerDto}, 질문 및 답변 모두 출력, 질문 수정 및 삭제 불가하며 조회만 가능 -->
</head>
<body>
<div style="width:13%; float:left; margin-top: 55px;">
	<jsp:include page="../table/servicecenterMenu.jsp"></jsp:include>
</div>
<div style="width:85%; float:right; margin-top: 55px">
	<div class="container-fluid">
		<div class="">
			<!--게시판 넓이 -->
			<div class="row">
				<div class="col-lg-12"></div>
			</div>
			<div class="panel panel-default">
				<div class="panel-heading">1:1문의</div>
				<div class="panel-body"></div>
				<form name="myForm">
					<!-- 조회 기능만 있음, action 불필요 -->
					<div class="form-group">
						<label for="exampleFormControlInput1">제목</label> <input
							type="text" class="form-control" id="exampleFormControlInput1"
							name="title" value="${answerDto.title}" readonly>
					</div>
					<div class="form-group">
						<label for="exampleFormControlInput1">문의 유형</label> <input
							type="text" class="form-control" id="exampleFormControlInput2"
							name="category" value="${answerDto.category}" readonly>
					</div>
					<div class="form-group">
						<label for="exampleFormControlInput1">문의 내용</label>
						<textarea class="form-control" id="exampleFormControlTextarea3"
							name="contents" rows="10" readonly>${answerDto.contents}</textarea>
					</div>
					<div class="form-group">
						<label for="exampleFormControlInput1">답변</label>
						<textarea class="form-control" id="exampleFormControlTextarea4"
							name="answer" rows="10" value="${answerDto.answer}" readonly>${answerDto.answer}
             			</textarea>
					</div>
					<br>
					<%-- 					<!-- 조회 기능만 있음, action 불필요 -->
					<table align="center">
						<colgroup>
							<col width="10%">
							<col width="20%">
							<col width="40%">
							<col width="20%">
						</colgroup>
						<thead style="background-color: #bbdefb;">
							<tr>
								<th scope="col">문의번호</th>
								<th scope="col">문의유형</th>
								<th scope="col">제목</th>
								<th scope="col">작성일</th>
							</tr>
						</thead>
						<tr>
							<td style="text-align: center;">${answerDto.num}</td>
							<td style="text-align: center;">${answerDto.category}</td>
							<td>${answerDto.title}</td>
							<td style="text-align: center;">${answerDto.writeday}</td>
						</tr>
						<tr>
							<td><br>
							<br></td>
						</tr>
						<tr>
							<th>문의내용</th>
							<td colspan="3">${answerDto.contents}</td>
						</tr>
						<tr>
							<td colspan='4'><hr></td>
						</tr>
						<tr>
							<th>답변</th>
							<td colspan="3">${answerDto.answer}</td>
						</tr>
					</table>
					<br> --%>
					<div style="text-align: center;">
						<a href="user_qaList">이전페이지로</a>
					</div>
				</form>
			</div>
		</div>
	</div>
	</div>
</body>
</html>