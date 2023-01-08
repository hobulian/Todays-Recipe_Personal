<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
	$(function() {
		$(".submit").on("click", function() {
			var key = $(this).attr("data-gCode");
			console.log(key);
			if (key != "") {
				$.ajax({
					url : "search",
					type : "get",
					dataType : "text",
					data : {
						key : key
					},
					success : function(data, status, xhr) {
						console.log("success");
					},
					error : function(xhr, status, error) {
						console.log(error);
					}//end error			
				});//end ajax
			} else {
				return false
			}
		}); //end click
	});
</script>

<c:if test="${!empty success }">
	<!-- 회원가입 성공 후 -->
	<script>
		alert("${success}")
		location.href = "/TodaysRecipe/"
	</script>

</c:if>
</head>
<body>
	<div style="float: right;">
		<jsp:include page="common/top.jsp" flush="true"></jsp:include><BR>
	</div>
	<br>
	<br>
	<a href="goodsList?gCategory=Vegetable" style="text-decoration: none;">
		<img src="images/Main_Logo.png"
		style="display: block; margin: 0 auto;">
	</a>
	<form id="search_area" action="search" align="center">
		<input type="text" id="search_key" name="key" placeholder="검색어를 입력하세요" /> 
		<button>검색</button>
	</form>

	<div align="center">
		<jsp:include page="common/menu.jsp" flush="true"></jsp:include>
	</div>
	<hr style="border: solid 0.5px gray;">
	<jsp:include page="goods/goodsList.jsp" flush="true"></jsp:include>
	<jsp:include page="footer/footer2.jsp" flush="true"></jsp:include>
</body>
</html>