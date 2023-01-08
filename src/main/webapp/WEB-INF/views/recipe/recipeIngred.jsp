<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<c:if test="${!empty mesg }">
	<script>
		alert('${mesg}');
	</script>
</c:if>
<% session.removeAttribute("mesg"); %>
<c:if test="${empty cartList}">
	<script>
		alert('장바구니가 비었습니다');
		location.href="goodsList?gCategory=Vegetable";
	</script>
</c:if>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>

function totalXXX() {
	var totalSum=0;
	$(".sum").each(function (idx, data) {
		totalSum += Number.parseInt($(data).text());
	});	
	$("#totalSum").text(totalSum);
}
$(function() {
	totalXXX();
	
	// 수량 입력시 숫자만 가능하도록
	$("input:text[numberOnly]").on("keyup", function() {
	      $(this).val($(this).val().replace(/[^0-9]/g,""));
	});
	
	//주문하기
/* 	$(".orderBtn").on("click",function(){
		var num= $(this).attr("data-num");
		if(cnt == 0){
			alert("아이템을 선택해주세요");
		} else {
		location.href="loginCheck/orderConfirm?num="+num;
		}
	}); */
	
	//전체주문하기
	$("#orderAllBtn").on("click",function(){
		console.log("주문하기 버튼 클릭 됨")
		/* var cnt = 0;
		$(".check").each(function(idx, data) {
			if(this.checked == true){
				cnt ++;
			}
		});
		if(cnt == 0){	// 아무것도 체크되지 않은 경우
			alert("주문하실 항목을 선택해 주세요.");
			return false;
		}esle{
			
		} */
		$(this).toggleClass('is-checked');
		var cnt = 0;
		var num=$(this).attr("data-num");
		$(".check").each(function(idx, data) {
			if(this.checked == true){
				cnt ++; // 
			}
			
		});
		
		if(cnt == 0){	// 아무것도 선택되지 않았을때
			alert('주문하실 항목을 선택해 주세요');
		 	return false;
		}
		
		// 수량에 0보다 큰 수만 입력 가능하도록
		if($(".changeAmount").val() == 0){
			alert('수량을 조정해 주세요');
			return false;
		}
		
		$("form").attr("action", "loginCheck/orderAllCart");
		$("form").submit();	
	});
	
	/* //레시피 추천받기 버튼 클릭
	$("#recipeBtn").on("click", function () {
		$(this).toggleClass('is-checked');
		var cnt = 0;
		var num=$(this).attr("data-num");
		$(".check").each(function(idx, data) {
			if(this.checked == true){
				cnt ++; // 
			}
			
		});
		
		if(cnt == 0){	// 아무것도 선택되지 않았을때
			alert('주문하실 항목을 선택해 주세요');
		 	return false;
		}
		
		// 수량에 0보다 큰 수만 입력 가능하도록
		if($(".changeAmount").val() == 0){
			alert('수량을 조정해 주세요');
			return false;
		}
		
		$("form").attr("action", "recipeRecomm")
		$("form").submit();	
	}) */
	
	//전체삭제
	$("#delAllCart").on("click", function() {
		$(this).toggleClass('is-checked');
		var cnt = 0;
		$(".check").each(function(idx, data) {
			if(this.checked == true){
				cnt ++; // 
			}
			
		});
		
		if(cnt == 0){	// 아무것도 선택되지 않았을때
			alert('삭제하실 항목을 선택해 주세요');
		 	return false;
		}
		$("form").attr("action", "loginCheck/delAllCart");
		$("form").submit();
	})
	//전체선택
	$("#allCheck").on("click", function() {
		var result= this.checked;
		$(".check").each(function(idx, data) {
			this.checked= result;
		});
		$(".allCheck2").each(function(idx, data) {
			this.checked= result;
		});

	});
	
	//전체선택2
	$("#allCheck2").on("click", function() {
		var result= this.checked;
		$(".check").each(function(idx, data) {
			this.checked= result;
		});

		$(".allCheck").each(function(idx, data) {
			this.checked= result;
		});
		
	});
	
	// 체크 버튼 처리
	$(".check").on("click", function() {
		$(this).toggleClass('is-checked');
		$(".check").each(function(idx, data) {
			if(this.checked == false){ // false가 한개라도 있으면(전체가 선택되지 않으면 => cnt > 0)
				$(".allCheck").each(function(idx, data) {
					this.checked= false;
				});
				$(".allCheck2").each(function(idx, data) {
					this.checked= false;
				});
			}
			
		});
		
		var cnt = 0;
		$(".check").each(function(idx, data) {
			if(this.checked == false){
				cnt ++; // false가 한개라도 있으면(전체가 선택되지 않으면 => cnt > 0)
			}
			
		});
		
		if(cnt == 0){	// 전체선택 일때
			$(".allCheck").each(function(idx, data) {
				this.checked= true;
			});
			$(".allCheck2").each(function(idx, data) {
				this.checked= true;
			});
		}

	});
	
	//삭제버튼 이벤트처리
	$(".deleteBtn").on("click", function () {
		console.log("deleteBtn 클릭 ");
		var num= $(this).attr("data-num");
		var xxx= $(this);
		$.ajax({
			url: "loginCheck/cartDelete",
			type:"get",
			dataType: "text",
			data: {
				num: num
			},
			success: function(data, status, xhr) {
				console.log("success");
				//dom삭제 
				xxx.parents().filter("tr").remove();
			},
			error: function(xhr, status, error) {
				console.log(error);
			}			
		});//end ajax
	});//end event
	
	$(".upbutton").on("click", function() {
		var num=$(this).attr("data-num");
		console.log(num);
		var result = $("#cartAmount" + num).val();
		result = parseInt(result) + 1;
		if(result > 999){
			alert("최대주문수량은 999개 입니다.")
			return false;
		}
		$("#cartAmount" + num).val(result);
		
		var gAmount= $("#cartAmount"+num).val();
		var gPrice =  $(this).attr("data-price");
		console.log(num, gPrice);
		$.ajax({
			url: "loginCheck/cartUpdate",
			type: "get",
			dataType: "text",
			data: {
				num: num,
				gAmount: gAmount
			},
			success: function (data, status, xhr) {
				var total= 
						parseInt(gAmount)*parseInt(gPrice);
				$("#sum"+num).text(total.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + "원");				
			},
			error: function (xhr, status,error) {
				console.log(error);
			}//end error			
		});//end ajax
	})
	
	$(".downbutton").on("click", function() {
		var num=$(this).attr("data-num");
		console.log(num);
		var result = $("#cartAmount" + num).val();
		if(result != 1){
			result = parseInt(result) - 1;
		}
		
		$("#cartAmount" + num).val(result);
		
		var gAmount= $("#cartAmount"+num).val();
		var gPrice =  $(this).attr("data-price");
		console.log(num, gPrice);
		$.ajax({
			url: "loginCheck/cartUpdate",
			type: "get",
			dataType: "text",
			data: {
				num: num,
				gAmount: gAmount
			},
			success: function (data, status, xhr) {
				var total= 
						parseInt(gAmount)*parseInt(gPrice);
				$("#sum"+num).text(total.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + "원");				
			},
			error: function (xhr, status,error) {
				console.log(error);
			}//end error			
		});//end ajax
		
	})
	
	$(".changeAmount").on("keyup", function () {
		var num=$(this).attr("data-num");
		console.log(num);
		
		var result = $("#cartAmount" + num).val();
		
		$("#cartAmount" + num).val(result);
		
		var gAmount= $("#cartAmount"+num).val();
		var gPrice = $(this).attr("data-price");
		console.log(num, gPrice);
		$.ajax({
			url: "loginCheck/cartUpdate",
			type: "get",
			dataType: "text",
			data: {
				num: num,
				gAmount: gAmount
			},
			success: function (data, status, xhr) {
				var total= 
						parseInt(gAmount)*parseInt(gPrice);
				$("#sum"+num).text(total.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + "원");				
			},
			error: function (xhr, status,error) {
				console.log(error);
			}//end error			
		});//end ajax
	})
	
})//end ready
 
</script>

<div class="wrap">
	<table align="center" cellspacing="0" cellpadding="0" border="0">
	
		<tr>
			<td height="30">
		</tr>
	
		<tr>
			<td colspan="100%" class="td_default" align="center"><font
				size="5"><b>장바구니</b></font>
			</td>
		</tr>
	
		<tr>
			<td height="15">
		</tr>
	
		<tr>
			<td height="7">
		</tr>
	
		<tr>
			<td class="td_default" align="left">
				<input class="allCheck" type="checkbox" name="allCheck" id="allCheck"> 
			</td>
			<td>
				<strong>&nbsp;전체선택</strong>
			</td>
	
		</tr>
	
		<tr>
			<td height="7">
		</tr>
		
		
		
		<tr>
			<td colspan="100%">
				<hr size="2" color="CCCCCC">
			</td>
		</tr>
	
	
	
		<form name="myForm">

	<!-- 반복시작 -->
	<c:forEach var="x" items="${cartList}">
			<tr>
				<td height="10">
			</tr>
	
			<tr>
				<%-- <input type="hidden" name="gCategory" id="gCategory" value="${x.gCategory}"> --%>
				<td class="td_default" align="left"> 
					<!-- checkbox는 체크된 값만 서블릿으로 넘어간다. 
					따라서 value에 삭제할 num값을 설정한다. -->
					<input type="checkbox"
						name="check" id="check81" class="check" 
						value="${x.num}">
				</td>
				
				<td class="td_default" width="110">
					<img src="images/items/${x.gImage}.png" border="0" align="right" width="80" />
				</td>
				
				<td class="td_default" width="200" style='padding-left: 30px'>
				${x.gName}
					</td>
				<td class="td_default" align="center" width="110">
					<span id="ggPrice${x.num}">
						<fmt:formatNumber value="${x.gPrice}" pattern="#,###"/>원
					</span>
				</td>
				<td>
					<img src="images/minus.png" id="down${x.num}" class="downbutton" 
					data-num="${x.num}" data-price="${x.gPrice}"
					width="30" height="30">&nbsp;
				</td>
				<td width="70">
					<div class="input_gAmount">
						 <input class="changeAmount" type="text" name="cartAmount"
						id="cartAmount${x.num}" style="text-align: right" maxlength="3"
						size="2" value="${x.gAmount}" data-num="${x.num}" data-price="${x.gPrice}" numberOnly> 
					</div>
				</td>
				<td>
					&nbsp;<img src="images/plus.png" id="up${x.num}" class="upbutton" 
					data-num="${x.num}" data-price="${x.gPrice}"
					width="30" height="30"> 
				</td>
				<td class="td_default" align="center" width="100"
					style='padding-left: 5px'><span id="sum${x.num}" class="sum">
					<fmt:formatNumber value="${x.gPrice * x.gAmount}" pattern="#,###"/>원
					</span></td>
<%-- 				<td><input type="button" value="주문" class="orderBtn"
					data-num="${x.num}"></td> --%>
				<td class="td_default" align="center" width="30"
					style='padding-left: 10px'>
					<img src="images/x.png" class="deleteBtn"
					data-num="${x.num }" width="20" height="20">
				</td>
				<td height="10"></td>
			</tr>
			
			
	 <!-- 반복끝 --> 
	</c:forEach>
		</form>
		<tr>
			<td height="10">
		</tr>
		<tr>
			<td colspan="100%">
				<hr size="2" color="CCCCCC">
			</td>
		</tr>
		<tr>
			<td height="10">
		</tr>
	
		<tr>
			<td  align="left">
				<input class="allCheck2" type="checkbox" name="allCheck2" id="allCheck2"> 
			</td>
			<td colspan="2">
				<strong>&nbsp;전체선택</strong>
				&nbsp;|&nbsp;
				<button id="delAllCart" style="border: none; background: none">선택 삭제</button>
			</td>

			<td colspan="7" align="right">
				<!-- <button id="recipeBtn" style="border: none; background: none">
					<img src="images/recipeBtn.png" width="300" height="60">
				</button> -->
				<button id="orderAllBtn" style="border: none; background: none">
					<img src="images/order.png" width="300" height="60">
				</button>
			</td>
		</tr>
		<tr>
			<td height="20">
		</tr>
	
	</table>
</div>
    