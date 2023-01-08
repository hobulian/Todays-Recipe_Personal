<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:if test="${isSearch != null}">
	<div style="display: block; text-align: center;">총
		${searchCount}건의 검색 결과</div>
</c:if>

<table width="100%" cellspacing="0" cellpadding="0">
	<tr>
		<td>
			<table align="center" width="710" cellspacing="0" cellpadding="0"
				border="0">
				<tr>
					<td height="5"></td>
				</tr>
				<!-- <tr>
					<td height="1" colspan="8" bgcolor="CECECE"></td>
				</tr> -->
				<tr>
					<td height="10"></td>
				</tr>
				<tr>

					<!-- 반복시작 -->
					<c:forEach var="dto" items="${goodsList}" varStatus="status">
						<td>
							<table style='padding: 15px'>
								<tr>
									<td><a href="goodsRetrieve?gCode=${dto.gCode}"> <img
											src="images/items/${dto.gImage}.png" border="0" height="300"
											width="200" align="center" width="200"
											style="border: 1px solid; border-radius: 7px; -moz-border-radius: 7px; -khtml-border-radius: 7px; -webkit-border-radius: 7px;">
									</a></td>
								</tr>
								<tr>

									<td height="10">
								</tr>
								<tr>
									<td class="td_default" align="left"><font size="3">
											${dto.gName}</font></td>

								</tr>

								<tr>
									<td class="td_default" align="left"><strong> <fmt:formatNumber
												value="${dto.gPrice}" pattern="#,###" />원
									</strong></td>
								</tr>
								<tr>

									<td height="10">
								</tr>
							</table>
						</td>
						<!-- 한 줄에4개씩 -->
						<c:if test="${status.count%4 ==0}">
							<tr>
								<td height="10"></td>
							</tr>
						</c:if>
						<!-- 반복끝-->
					</c:forEach>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td height="10">
	</tr>
</table>


<div style="display: block; text-align: center;">
	<c:if test="${isSearch == null}">
		<c:if test="${paging.startPage != 1}">
			<a
				href="goodsList?gCategory=${paging.gCategory}&nowPage=${paging.startPage - 1}&countPerPage=${paging.countPerPage}">&lt;</a>
		</c:if>
		<c:forEach begin="${paging.startPage }" end="${paging.endPage}"
			var="p">
			<c:choose>
				<c:when test="${p == paging.nowPage }">
					<b>${p}</b>
				</c:when>
				<c:when test="${p != paging.nowPage }">
					<a
						href="goodsList?gCategory=${paging.gCategory}&nowPage=${p}&countPerPage=${paging.countPerPage}">${p }</a>
				</c:when>
			</c:choose>
		</c:forEach>
		<c:if test="${paging.endPage != paging.lastPage}">
			<a
				href="goodsList?gCategory=${paging.gCategory}&nowPage=${paging.endPage+1 }&countPerPage=${paging.countPerPage}">&gt;</a>
		</c:if>
	</c:if>
</div>