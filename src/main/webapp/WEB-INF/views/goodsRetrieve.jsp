<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">
		<script src="https://kit.fontawesome.com/53a8c415f1.js" crossorigin="anonymous"></script>
		<link rel="stylesheet" href="css/goods.css">
	</head>
	<body>
		<div style="float: right;">
			<jsp:include page="common/top.jsp" flush="true" ></jsp:include><BR>
		</div>
		<br>
		<br>
		<a href="goodsList?gCategory=Vegetable" style="text-decoration: none;">
			<img src="images/Main_Logo.png" style="display: block; margin: 0 auto;">		
		</a>
		<div align="center">
		<jsp:include page="common/menu.jsp" flush="true"></jsp:include>
		</div>
		<hr style="border: solid 0.5px gray;">
		<div align="center">
			<jsp:include page="goods/goodsRetrieve.jsp" flush="true"></jsp:include>
			<jsp:include page="footer/footer2.jsp" flush="true"></jsp:include>
		</div>
	</body>
</html>