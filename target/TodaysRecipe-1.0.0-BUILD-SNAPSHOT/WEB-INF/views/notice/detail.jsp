<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script> 
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script>
  $(document).ready(function(){
	 
	  $("form").on("submit",function(event){
		 
	  })
	  
  });
  
</script>

</head>

<style>

	.container-fluid{
		max-width: 1200px;
		margin: 0 auto;
	}

</style>
<div style="width:13%; float:left; margin-top: 55px;">
	<jsp:include page="../table/servicecenterMenu.jsp"></jsp:include>
</div>
<div style="width:85%; float:right;  margin-top: 55px">
	<div class="container-fluid">
        <div class=""><!--게시판 넓이 -->
            <div class="row">
                  <div class="col-lg-12">
                  </div>
              </div>
            <div class="panel panel-default">
                <div class="panel-heading">공지사항 </div>
                <div class="panel-body"></div>


    <form action='<c:url value='/noticeAdd'/>' method="get">
        <div class="form-group">
              <label for="exampleFormControlInput1">제목</label>
              
            <input type="text" class="form-control" id="exampleFormControlInput1" name="title" placeholder="제목을 작성해주세요." value="${datalist.title}" <c:if test="${ login.userid ne 'admin'}">readonly</c:if>>
          		
          </div>
        <div class="form-group">
            <label for="exampleFormControlInput1">작성자</label>
             <input type="text" class="form-control" id="exampleFormControlInput1" name="writer" placeholder="관리자" value="${datalist.writer}" <c:if test="${ login.userid ne 'admin'}">readonly</c:if>>
          </div>
          <div class="form-group">
            <label for="exampleFormControlTextarea1">내용</label>
             <textarea class="form-control" id="exampleFormControlTextarea1" name="contents" placeholder="내용을 작성해주세요." rows="10" value="${datalist.contents}" <c:if test="${ login.userid ne 'admin'}">readonly</c:if>>${datalist.contents}</textarea>

          
          </div>
          
        <button type="button" class="btn btn-info" onclick="location.href='notice'">목록으로</button>
        <c:if test="${ login.userid eq 'admin'}">
        	<c:if test="${ !empty datalist }">
        		<button type="submit" formaction="noticeUpdate" class="btn btn-info">수정하기</button>
       			<input type="hidden" name="num" value="${datalist.num}">
        	</c:if>
	        <c:if test="${ empty datalist }">
	        	<button type="submit" class="btn btn-info">등록하기</button>
	        </c:if>
        </c:if>
    </form>
    
   			</div>
		</div>
	</div> 
</div>
</html>
