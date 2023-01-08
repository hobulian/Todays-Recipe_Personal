<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<style>
a:link { /*링크 방문 전*/
    color: black;
}
 
a:visited { /*링크를 방문한 이후*/
    color: black;
}
 
a:hover { /*마우스를 올려놓을 때*/
    color: black;
}
 
a:active { /*클릭하는 순간*/
    color: black;
}
</style>
<c:if test="${empty login }">
	<a href="memberForm" style="text-decoration: none;" >
		<font face="Andale Mono">회원가입</font>
	</a>
	&nbsp;|&nbsp;
	<a href="loginForm" style="text-decoration: none;">
		<font face="Andale Mono">로그인</font>
	</a>
	&nbsp;|&nbsp;
	<a href="serviceCenter" style="text-decoration: none;">
		<font face="Andale Mono">고객센터</font>
	</a>&nbsp;
</c:if>
<c:if test="${!empty login }" >
<font face="Andale Mono">
안녕하세요? <font color="blue">${login.username } </font>님 !&nbsp;|&nbsp;</font>
	<a href="loginCheck/logout" style="text-decoration: none;">
		<font face="Andale Mono">로그아웃</font>
	</a>
	<c:if test="${login.userid != 'admin' }" >
		&nbsp;|&nbsp;
		<a href="loignCheck/myPage" style="text-decoration: none;">
			<font face="Andale Mono">회원정보</font>
		</a>
		&nbsp;|&nbsp;
		<a href="loginCheck/cartList" style="text-decoration: none;">
			<font face="Andale Mono">장바구니</font>
		</a>
		&nbsp;|&nbsp;
		<a href="orderCheck" style="text-decoration: none;">
			<font face="Andale Mono">주문목록</font>
		</a>
		&nbsp;|&nbsp;
			<a href="loginCheck/serviceCenter" style="text-decoration: none;">
			<font face="Andale Mono">고객센터</font>
		</a>
	</c:if>
	<c:if test="${login.userid == 'admin' }" >
		&nbsp;|&nbsp;
			<a href="loginCheck/serviceCenter" style="text-decoration: none;">
			<font face="Andale Mono">고객센터</font>
		</a>
		&nbsp;|&nbsp;
			<a href="adminMedit" style="text-decoration: none;">
			<font face="Andale Mono">관리자 메뉴</font>
		</a>&nbsp;
	</c:if>
</c:if>
