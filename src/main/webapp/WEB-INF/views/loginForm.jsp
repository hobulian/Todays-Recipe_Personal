<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:if test="${!empty mesg}">
	<script>
		alert("${mesg}");
		<%session.removeAttribute("mesg");%>
	</script>
</c:if>    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>Insert title here</title>
		<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">
		<script src="https://kit.fontawesome.com/53a8c415f1.js" crossorigin="anonymous"></script>
		<link rel="stylesheet" href="css/login.css">
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
		
		<jsp:include page="member/loginForm.jsp"></jsp:include>
		<jsp:include page="footer/footer2.jsp" flush="true"></jsp:include>
	</body>
</html>

