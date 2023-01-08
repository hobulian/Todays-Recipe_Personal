<%@page import="com.dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:if test="${!empty mesg }">
	<script>
		alert('공지사항 수정완료 !');
	</script>
</c:if>
<% session.removeAttribute("mesg"); %>


<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script>
  
  $(function() {
	  	
	  	//글쓰기처리
		$("#noticewriting").on("click", function() {
			location.href="detail"
		})

		/* $(".revisenotice").on("click", function(){
			(this).attr()
			location.href="detail?num="+this.data-num
		}) */

		
		//삭제처리
		$(".deletenotice").on("click", function () {
		console.log("삭제버튼 클릭 ");
		var num= $(this).attr("data-num");
		var xxx= $(this);
		if(confirm("정말 삭제하시겠습니까 ?"))  //확인을 누르면 true, 취소 누르면 false
		{
		$.ajax({
			url: "noticeDelete",
			type:"get",
			dataType: "text",
			data: {
				num: num
			},
			success: function(data, status, xhr) {
				console.log("success");
				alert("삭제하였습니다.");
				//dom삭제 
				xxx.parents().filter("tr").remove();
				location.reload(); //삭제 후 페이지 자동 새로고침
			},
			error: function(xhr, status, error) {
				console.log("error = " + error);
			}			
		});//end ajax
		} else {
			return false;
		}
	});//end event
});//end function
	
		//수정처리
  	function update(num){
	 	 if(confirm("정말 수정하시겠습니까 ?"))  //확인을 누르면 true, 취소 누르면 false
		{
			//alert(num);  //num = 즉 idx 값 잘 넘어오는지 test용
			location.href="detail?num="+num
		} else {
			return false;
		}//if(confirm)
	}; //update

	
	function selChange() {
		var sel = document.getElementById('countPerPage').value;
		location.href="notice?nowPage=${paging.nowPage}&countPerPage="+sel;
	}
	
  </script>



<title>NoticeList</title>
</head>

<style>
table {
	width: 100%;
}

#outter {
	display: block;
	width: 60%;
	margin: auto;
}

.page-wrapper {
	max-width: 1200px;
	margin: 0 auto;
}
</style>



<body>
	<div style="width: 13%; float: left; margin-top: 55px;">
		<c:if test="${login.userid eq 'admin'}">
			<jsp:include page="../table/servicecenterMenu_manager.jsp"></jsp:include>
		</c:if>
		<c:if test="${login.userid ne 'admin'}">
			<jsp:include page="../table/servicecenterMenu.jsp"></jsp:include>
		</c:if>
	</div>
	<div style="width: 85%; float: right">
		<div id="outter">
			<div style="float: right;">
				<select id="countPerPage" name="sel" onchange="selChange()">
					<option value="10"
						<c:if test="${paging.countPerPage == 10}">selected</c:if>>10줄
						보기</option>
					<option value="15"
						<c:if test="${paging.countPerPage == 15}">selected</c:if>>15줄
						보기</option>
					<option value="20"
						<c:if test="${paging.countPerPage == 20}">selected</c:if>>20줄
						보기</option>
				</select>
			</div>
			<!-- 옵션선택 끝 -->
		</div>



		<div class="page-wrapper">
			<div class="container-fluid">
				<div class="col-lg-20">
					<!--게시판 넓이 -->
					<div class="col-lg-12">
						<h1 class="page-header">공지사항</h1>
					</div>


					<div class="row">
						<div class="col-lg-12">
							<c:if
								test="${ not empty login.userid && login.userid eq 'admin' }">
								<button id="noticewriting" type="button"
									class="btn btn-info pull-right">
									<i class="fa fa-edit fa-fw"></i> 공지사항 작성
								</button>
							</c:if>
						</div>
					</div>
					<div class="panel panel-default">
						<div class="panel-heading">공지사항</div>
						<div class="panel-body">
							<table class="table table-hover">
								<thead>
									<tr>
										<th>No</th>
										<th>제목</th>
										<th>작성자</th>
										<th>작성일</th>
										<th>조회수</th>
									</tr>
								</thead>
								<tbody>

									<c:forEach var="noticelist" items="${viewAll}">
										<tr>
											<td>${noticelist.rownumber}</td>
											<td><a href="detail?num=${noticelist.num}">${noticelist.title}</a></td>
											<td>${noticelist.writer}</td>
											<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
													value="${noticelist.writeday}" /></td>
											<td>${noticelist.viewcount}</td>
											<c:if
												test="${ not empty login.userid && login.userid eq 'admin' }">
												<td><button type="button"
														class="btn btn-info revisenotice"
														onclick="update(${noticelist.num})">수정</button></td>
											</c:if>
											<c:if
												test="${ not empty login.userid && login.userid eq 'admin' }">
												<td><button type="button"
														class="btn btn-info deletenotice"
														data-num="${noticelist.num}">삭제</button></td>
											</c:if>
										</tr>
									</c:forEach>
								</tbody>
							</table>



							<div style="display: block; text-align: center;">
								<c:if test="${paging.startPage != 1 }">
									<a
										href="notice?nowPage=${paging.startPage - 1 }&countPerPage=${paging.countPerPage}">&lt;</a>
								</c:if>
								<c:forEach begin="${paging.startPage }" end="${paging.endPage }"
									var="p">
									<c:choose>
										<c:when test="${p == paging.nowPage }">
											<b>${p }</b>
										</c:when>
										<c:when test="${p != paging.nowPage }">
											<a
												href="notice?nowPage=${p }&countPerPage=${paging.countPerPage}">${p }</a>
										</c:when>
									</c:choose>
								</c:forEach>
								<c:if test="${paging.endPage != paging.lastPage}">
									<a
										href="notice?nowPage=${paging.endPage+1 }&countPerPage=${paging.countPerPage}">&gt;</a>
								</c:if>
							</div>



						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>