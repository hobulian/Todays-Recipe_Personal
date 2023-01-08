<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>

</script>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<link rel="stylesheet" href="css/recipeRecomm.css">
</head>

<body>
<br>
	<form action="loginCheck/orderAllCart">
		<!-- 장바구니 정보 받아와서 hidden으로 넘겨주기 -->
		<c:forEach var="x" items="${cartNum}">
			<input type="hidden" value="${x}" name="check" class="check" data-check="${x}">
		</c:forEach>
		
		<table align="center" cellspacing="0" cellpadding="0" border="0" style="margin:auto;">
			<tr>
				<h2 style="text-align:center; margin:auto; background-color:#BCF5A9; width: 300px;">오늘은 이 메뉴 어떠세요?</h2>
				<p style="text-align:center; font-size:10px; padding-top:10px; padding-bottom:10px;">고객님의 장바구니 상품을 기반으로 추천된 메뉴입니다.</p>
			</tr>
			<hr>
			<c:forEach var="re" items="${recipe}" varStatus="status">
				<input type="hidden" value="${re.code}" name="code" id="code">
				<td>
					<table style='padding: 15px'>
						<tr>
							<td>
							<a href="recipeIngred?<c:forEach var="x" items="${cartNum}">check=${x}&</c:forEach>code=${re.code}">
							<img src="images/recipe/${re.code}.png" border="0" align="right" width="150" height="150"/></td>
						</tr>
						<tr>
							<td style="text-align: center; font-size: 15px;">${re.title}</td>
						</tr>
					</table>
				</td>
				<!-- 한 줄에4개씩 -->
				<c:if test="${status.count%4 ==0 }">
					<tr>
						<td height="10"></td>
					</tr>
				</c:if>
			</c:forEach>
			<tr>
				<td colspan="4"><div style="display:inline-block; float:right;"><button id="orderAllBtn" style="border: none; background: none">
					<img src="images/justOrder.png" width="300" height="60">
				</button>
		</div></td>
			</tr>
		</table>
		
		<br>
	</form>
</body>
</html>