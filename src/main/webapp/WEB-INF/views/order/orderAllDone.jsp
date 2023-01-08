<%@page import="java.util.List"%>
<%@page import="com.dto.OrderDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>	    
<%-- 	>>>${list_OrderDTO} --%>
<c:set var="xxx" value="${list_OrderDTO}" />
<c:set var="userid" value="${xxx[0].userid}" />
<c:set var="orderName" value="${xxx[0].orderName}" />
<c:set var="post" value="${xxx[0].post}" />
<c:set var="addr1" value="${xxx[0].addr1}" />
<c:set var="addr2" value="${xxx[0].addr2}" />
<c:set var="phone" value="${xxx[0].phone}" />
<c:set var="orderDay" value="${xxx[0].orderday}" />
<div class="wrap">
<table width="70%" cellspacing="0" cellpadding="0" align="center">

	<tr>
		<td height="30">
	</tr>

	<tr>
		<td align="center">
			<font size="5"><b>주문해주셔서 감사합니다.</b>
		</td>
	</tr>

	<tr>
		<td height="7">
	</tr>

	<tr>
		<td class="td_default" align="center">
			<b>${userid}</b> 님의 주문이 안전하게 처리되었습니다.
		</td>
	</tr>

	<tr>
		<td height="40">
	</tr>

	<tr>
		<td class="td_default">
			<b>배송정보</b>
		</td>
	</tr>
	
	<tr>
		<td>
			<hr size="2" color="CCCCCC">
		</td>
	</tr>

	<tr>
		<td>
			<table width="100%">
				<tr>
					<td class="td_default" width="150" height="35"> 받으시는 분</td>
					<td class="td_default" height="35">${orderName}</td>
				</tr>
				<tr>
					<td class="td_default" height="35"> 주소</td>
					<td class="td_default" height="35"> (${post})<br>
						${addr1}${addr2}
					</td>
				</tr>
				
				<tr>
					<td class="td_default" height="35"> 휴대전화</td>
					<td class="td_default" height="35"> ${phone}</td>
				</tr>
			</table>
	</tr>

	<tr>
		<td height="20">
	</tr>
	<tr>
		<td class="td_default">
			<b>주문 상품</b>
		</td>
	</tr>
	
	<tr>
		<td>
			<hr size="2" color="CCCCCC">
		</td>
	</tr>
	<tr>
		<td>
			<table width="100%">

   <!--  변수 선언 -->
    <c:set var="totalSum" value="0" />
	<c:forEach var="xxx" items="${list_OrderDTO}" varStatus="status">
    <!-- 누적 -->
		<c:set var="totalSum" value="${totalSum + xxx.gPrice * xxx.gAmount }" />		
				<tr>
					<td height="35" class="td_default">
						<span class="a_default">${xxx.gName} </span>
					</td>
					<td colspan="3" height="35" class="td_default" align="right">
						<span id = "num1">${xxx.gAmount}</span>개
					</td>
					<td height="35" class="td_default" align="right">
						<span>
							<fmt:formatNumber value="${xxx.gPrice * xxx.gAmount}" pattern="#,###"/>원
						</span>
					</td>
				</tr>
			
		
</c:forEach>
			</table>
		</td>
	</tr>

	<tr>
		<td height="40">
	</tr>

	<tr>
		<td class="td_default"><b>결제정보</b></td>
	</tr>
	<tr>
		<td>
			<hr size="2" color="CCCCCC">
		</td>
	</tr>

	<tr>
		<td>
			<table width="100%">
				<tr>
					<td class="td_default" width="150" height="35"> 결제금액</td>
					<td class="td_default" height="35" align = 'left'>
						<span class="totalsum">
							<fmt:formatNumber value="${totalSum}" pattern="#,###"/>원
						</span> 
					</td>
				</tr>
				<tr>
					<td class="td_default" width="150" height="35"> 결제수단</td>
					<td class="td_default" height="35" align = 'left'> 
					${list_OrderDTO[0].payMethod}
					</td>
				</tr>
			</table>
		</td>
	</tr>

	<tr>
		<td height="40">
	</tr>

	

	<tr>
		<td height="40">
	</tr>

	<tr>
		<td class="td_default" align="center">
			<span class="submit">
				<a class="a_default" href="goodsList?gCategory=Vegetable">계속해서 쇼핑하기</a>
			</span>
		</td>
	</tr>

	<tr>
		<td height="30">
	</tr>

</table>
</div>
