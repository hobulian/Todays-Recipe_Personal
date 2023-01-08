<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:if test="${!empty mesg }">
	<script>
		alert('${mesg}');
	</script>
</c:if>

<style>
	div.login_pw{
    position: relative;/* 
    padding: 20px ; */
}
	div.login_pw input{
    width: 100%;
    height: 50px;
    border-radius: 30px;
    margin-top: 10px;
    padding: 0px 20px;
    border: 1px solid lightgray;
    outline: none;
}
	div.login_pw i{
    position: absolute;
    left: 75%;
    top: 50px;
    color: orange;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
	$(document).ready(function(){
	    $('.login_pw i').on('click',function(){
	        $('input').toggleClass('active');
	        if($('input').hasClass('active')){
	            $(this).attr('class',"fa fa-eye-slash fa-lg")
	            .prev('input').attr('type',"text");
	        }else{
	            $(this).attr('class',"fa fa-eye fa-lg")
	            .prev('input').attr('type','password');
	        }
	    });
	});
</script>

<head>
	<link rel="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css">
</head>

<form action="login" method="get">
 	<div class="wrap">
        <div class="login">
            <h2>로그인</h2>
            <div class="login_id">
                <h4>아이디</h4>
                <input type="text" name="userid" placeholder="ID">
            </div>
            <div class="login_pw">
                <h4>비밀번호</h4>
                <input type="password" name="passwd" placeholder="Password">
                <i class="fa fa-eye fa-lg"></i>
            </div>
            <span class="submit">
                <input type="submit" value="로그인">
                <input type="reset" value="취소">
            </span>
        </div>
    </div>
</form>