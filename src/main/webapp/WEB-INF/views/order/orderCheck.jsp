<%@page import="com.dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

 <script>
 
 $(function() { 
	 	
	 	//수취완료
 	 	$(".confirmgoodsreceipt").on("click", function () {
		console.log("수취확인버튼 클릭 ");
		var num= $(this).attr("data-num");
		var status = $("#receiptstatus" + num).text();
		var xxx= $(this);
		console.log(num);
		console.log(status);
		if(confirm("상품을 안전하게 받으셨습니까 ?"))  //확인을 누르면 true, 취소 누르면 false
		{
		$.ajax({
			url: "receiptStatus",
			type:"get",
			dataType: "text",
			data: {
				num: num,
				status: status
			},
			success: function(data, status, xhr) {
				console.log("success");
				location.reload(); //수정 후 페이지 자동 새로고침
			},
			error: function(xhr, status, error) {
				console.log("error = " + error);
			}			
		});//end ajax
		} else {
			return false;
		}
 	 });//end event
	 
	 
	 
	 	//주문삭제버튼
  		$(".deleteorder").on("click", function () {
		console.log("삭제버튼 클릭 ");
		var num= $(this).attr("data-num");
		var xxx= $(this);
		if(confirm("주문을 취소 하시겠습니까 ?"))  //확인을 누르면 true, 취소 누르면 false
		{
		$.ajax({
			url: "orderDelete",
			type:"get",
			dataType: "text",
			data: {
				num: num
			},
			success: function(data, status, xhr) {
				console.log("success");
				alert("선택하신 주문을 취소했습니다.");
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

	/* 페이징처리 향후 구현 */
	/* function selChange() {
		var sel = document.getElementById('countPerPage').value;
		location.href="orderCheck?nowPage=${paging.nowPage}&countPerPage="+sel;
	} */

</script>
  
<title>OrderCheck</title>
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
	
	.page-wrapper{
		max-width: 1200px;
		margin: 0 auto;
	}

</style>



<body>
<div style="width:13%; float:left; margin-top: 55px;">


<!-- 페이징처리 추후 구현 -->
</div>
<div style="width:85%; float:right">
<div id="outter">
	<div style="float: right;">
<%-- 		<select id="countPerPage" name="sel" onchange="selChange()">
			<option value="10"
				<c:if test="${paging.countPerPage == 10}">selected</c:if>>10줄 보기</option>
			<option value="15"
				<c:if test="${paging.countPerPage == 15}">selected</c:if>>15줄 보기</option>
			<option value="20"
				<c:if test="${paging.countPerPage == 20}">selected</c:if>>20줄 보기</option>
		</select> --%>
	</div> <!-- 옵션선택 끝 -->
</div>



<div class="page-wrapper">
    <div class="container-fluid">
        <div class="col-lg-20"><!--게시판 넓이 -->
            <div class="col-lg-12">
                <h1 class="page-header">주문확인 </h1>
            </div>
 
            
            <div class="row">
                  <div class="col-lg-12"></div>
              </div>
            <div class="panel panel-default">
                <div class="panel-heading">나의 주문 목록</div>
                <div class="panel-body">
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th>주문번호</th>
                                <th>사진</th>
                                <th>상품정보</th>
                                <th>상품금액</th>
                                <th>주문수량</th>
                                <th>주문일자</th>
                                <th>배송상태</th>
                            </tr>
                        </thead>
                        <tbody>
  
                        <c:forEach var="getOrderList" items="${myOrderList}">
                            <tr>
                                <td>${getOrderList.num}</td>
                                <td class="td_default" width="110">
								<img src="images/items/${getOrderList.gimage}.png" border="0" align="right" width="80" />
								</td>
                                <td>${getOrderList.gname}</td>
                                <td><fmt:formatNumber value="${getOrderList.gprice}" pattern="#,###"/>원</td>
                                <td>${getOrderList.gamount}</td>
                                <td><fmt:formatDate value="${getOrderList.orderday}" pattern="yyyy-MM-dd"/></td>
                                <td><span id="receiptstatus${getOrderList.num}">${getOrderList.status}</span>
                                <div>
                                <c:if test="${ getOrderList.status eq '주문접수' }">
                                	<button type="button" class="btn btn-info deleteorder"  data-num="${getOrderList.num}">주문취소</button>
                                </c:if>
                                <c:if test="${ getOrderList.status eq '배송완료' }">
                                	<button type="button" class="btn btn-info confirmgoodsreceipt"  data-num="${getOrderList.num}">수취확인</button>
                                </c:if>
                                </div> 
                                </td>
                            <%--     <td>${getOrderList.gAmount}</td>
                                <td>${getOrderList.gAmount}</td> --%>
                                <%-- <c:if test="${ not empty login.userid && login.userid eq 'admin' }"><td><button type="button" class="btn btn-info revisenotice"  onclick="update(${noticelist.num})">수정</button></td></c:if>             
                                <c:if test="${ not empty login.userid && login.userid eq 'admin' }"><td><button type="button" class="btn btn-info deletenotice"  data-num="${noticelist.num}">삭제</button></td></c:if> --%>
                            </tr>  
                        </c:forEach>
                        </tbody>
                    </table>


<!-- 페이징처리 향후 구현 -->
	<div style="display: block; text-align: center;">		
<%-- 		<c:if test="${paging.startPage != 1 }">
			<a href="orderCheck?nowPage=${paging.startPage - 1 }&countPerPage=${paging.countPerPage}">&lt;</a>
		</c:if>
		<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
			<c:choose>
				<c:when test="${p == paging.nowPage }">
					<b>${p }</b>
				</c:when>
				<c:when test="${p != paging.nowPage }">
					<a href="orderCheck?nowPage=${p }&countPerPage=${paging.countPerPage}">${p }</a>
				</c:when>
			</c:choose>
		</c:forEach>
		<c:if test="${paging.endPage != paging.lastPage}">
			<a href="orderCheck?nowPage=${paging.endPage+1 }&countPerPage=${paging.countPerPage}">&gt;</a>
		</c:if> --%>
	</div>

                </div>
            </div>
        </div>
    </div>
 </div>
</div>
</body>
</html>