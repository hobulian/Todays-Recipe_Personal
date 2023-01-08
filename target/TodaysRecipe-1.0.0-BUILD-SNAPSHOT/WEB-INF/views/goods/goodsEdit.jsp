<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
	$(function() {
		$(".removeBtn").on("click", function() {
			console.log("삭제 버튼 클릭 ");
			var gCode = $(this).attr("data-gCode");
			var xxx = $(this);
			if (confirm(gCode + "품번의 항목을 삭제하시겠습니까?") == true) {
				$.ajax({
					url : "goodsRemove",
					type : "get",
					dataType : "text",
					data : {
						gCode : gCode
					},
					success : function(data, status, xhr) {
						alert(gCode + "품번의 항목이 삭제되었습니다");
						console.log("success");
						//dom삭제 
						xxx.parents().filter("tr").remove();
						window.location.reload();
					},
					error : function(xhr, status, error) {
						console.log(error);
					}
				});//end ajax
			} else {
				return false
			}
		});//end event
		//수정버튼이벤트 처리 

		$(".updateBtn").on(
				"click",
				function() {
					var gCode = $(this).attr("data-gCode");
					var gCategory = $("#gCategory" + gCode).val();
					var gImage = $("#gImage" + gCode).val();
					var gName = $("#gName" + gCode).val();
					var gUnit = $("#gUnit" + gCode).val();
					var gWeight = $("#gWeight" + gCode).val();
					var gPrice = $("#gPrice" + gCode).val();
					var gStock = $("#gStock" + gCode).val();
					if ((gCode == "") || (gCategory == "") || (gName == "")
							|| (gUnit == "")) {
						alert("필수 항목은 빈칸으로 둘 수 없습니다");
						return false;
					} else if ((gPrice == "0") || (gStock == "0")) {
						alert("가격과 수량을 확인해주세요");
						return false;
					} else {
						if (confirm(gCode + "품번의 항목을 수정하시겠습니까?") == true) {
							$.ajax({
								url : "goodsUpdate",
								type : "get",
								dataType : "text",
								data : {
									gCode : gCode,
									gCategory : gCategory,
									gImage : gImage,
									gName : gName,
									gUnit : gUnit,
									gWeight : gWeight,
									gPrice : gPrice,
									gStock : gStock
								},
								success : function(data, status, xhr) {
									alert(gCode + "품번의 항목이 수정되었습니다");
									console.log("success");
								},
								error : function(xhr, status, error) {
									alert("오류. 기입된 항목을 다시 확인하세요");
									console.log(error);
								}//end error			
							});//end ajax
						} else {
							return false
						}
					}
				}); //end click

		$(".addBtn")
				.on(
						"click",
						function() {
							var CodePrefix = $(this).attr("data-CodePrefix");
							var ImgPrefix = $(this).attr("data-ImgPrefix");
							var gCode = $("#gCodeAdd").val();
							var gCategory = $("#gCategoryAdd").val();
							var gImage = $(this).attr("data-ImgPrefix");
							var gName = $("#gNameAdd").val();
							var gUnit = $("#gUnitAdd").val();
							var gWeight = $("#gWeightAdd").val();
							var gPrice = $("#gPriceAdd").val();
							var gStock = $("#gStockAdd").val();
							if ((gCode == "") || (gCategory == "")
									|| (gName == "") || (gUnit == "")) {
								alert("상품 추가를 위해 필수 항목을 입력하세요");
								return false;
							} else if ((gPrice == "0") || (gStock == "0")) {
								alert("가격과 수량을 확인해주세요");
								return false;
							} else {
								if (confirm("추가하려는 항목의 정보가 다음이 맞습니까?"
										+ "\n품번: " + CodePrefix + gCode
										+ "    |  상품명: " + gName + "\n단위: "
										+ gUnit + "    |  중량/용량: " + gWeight
										+ "\n가격: " + gPrice + "    |  재고: "
										+ gStock) == true) {
									$
											.ajax({
												url : "goodsAdd",
												type : "get",
												dataType : "text",
												data : {
													gCode : CodePrefix + gCode,
													gImage : ImgPrefix + gCode,
													gCategory : gCategory,
													gName : gName,
													gUnit : gUnit,
													gWeight : gWeight,
													gPrice : gPrice,
													gStock : gStock
												},
												success : function(data,
														status, xhr) {
													alert(CodePrefix + gCode
															+ "품번의 항목이 추가되었습니다");
													console.log("success");
													window.location.reload();
												},
												error : function(xhr, status,
														error) {
													alert("항목 추가에 실패하였습니다. 입력된 항목을 확인해주세요");
													console.log(error);
												}//end error		
											});//end ajax
								} else {
									return false
								}
							}
						}); //end click 

		//전체선택
		$("#allCheck").on("click", function() {
			var result = this.checked;
			$(".check").each(function(idx, data) {
				this.checked = result;
			});
			$(".allCheck2").each(function(idx, data) {
				this.checked = result;
			});
		}); //end click 

		//전체선택2
		$("#allCheck2").on("click", function() {
			var result = this.checked;
			$(".check").each(function(idx, data) {
				this.checked = result;
			});
			$(".allCheck").each(function(idx, data) {
				this.checked = result;
			});
		}); //end click 

		//일괄 삭제
		$("#removeAllGoods").on("click", function() {
			var ccount = 0;
			checkboxes = document.getElementsByName('gCcheck');
			for (var i = 0, n = checkboxes.length; i < n; i++) {
				console
				if (checkboxes[i].checked) {
					ccount++
				}
				;
			}
			if (ccount == 0) {
				alert("일괄 삭제할 품목들을 선택해주세요");
				return false;
			} else {
				if (confirm("총 " + ccount + "개의 항목을 삭제합니다") == true) {
					$("form").attr("action", "goodsRemoveAll");
					$("form").submit();
					alert("총 " + ccount + "개의 항목이 삭제되었습니다");
				} else {
					return false
				}
			}
		});
	});
</script>

<div style="width: 10%; float: left;">
	<jsp:include page="../table/adminMenu.jsp"></jsp:include>
</div>
<div style="width: 88%; float: right">
	<jsp:include page="../admin/editMenu.jsp" flush="true" /><BR>
</div>
<form name="goodEditForm" method="GET" action="#">
	<input type="hidden" name=gCategoryEdit id="gCategoryEdit"
		value=<%=request.getParameter("gCategory")%>>
	<table style='padding: 5px; border: 1px; border-collapse: collapse'>
		<%
				String c = request.getParameter("gCategory");
				String cm = "";
				String ci = "";
				if (c.equals("Bakery")) {
					cm = "B";
					ci = "bakery";
				} else if (c.equals("Beverage")) {
					cm = "BE";
					ci = "beverage";
				} else if (c.equals("Can")) {
					cm = "C";
					ci = "can";
				} else if (c.equals("Fruit")) {
					cm = "F";
					ci = "fruit";
				} else if (c.equals("Grain")) {
					cm = "G";
					ci = "grain";
				} else if (c.equals("Kimchi")) {
					cm = "K";
					ci = "kimchi";
				} else if (c.equals("Meat")) {
					cm = "M";
					ci = "meat";
				} else if (c.equals("Milk")) {
					cm = "MI";
					ci = "milk";
				} else if (c.equals("Retort")) {
					cm = "R";
					ci = "retort";
				} else if (c.equals("Seafood")) {
					cm = "S";
					ci = "seafood";
				} else if (c.equals("Snack")) {
					cm = "SN";
					ci = "snack";
				} else if (c.equals("Spices")) {
					cm = "SP";
					ci = "spices";
				} else if (c.equals("Vegetable")) {
					cm = "V";
					ci = "vegetable";
				};
			%>

		<tr>
			<td align="center" colspan='2'></td>
			<td align="center">품번(<%=cm%>)
			</td>
			<td align="center">상품명</td>
			<td align="center">단위</td>
			<td align="center">중량/용량(선택)</td>
			<td align="center">가격</td>
			<td align="center">재고</td>
			<td></td>
		</tr>
		<tr>
			<td align="center" colspan='2'></td>
			<td align="center"><input type="hidden" name=gCategory
				id="gCategoryAdd" value=<%=request.getParameter("gCategory")%>>
				<input type="number" name=gCode id="gCodeAdd" min='1' max='999'>
				<script>
						var result = 1;
						var max = 0;
						var arr = [];
					</script> <c:forEach var="dto" items="${goodsEdit}" varStatus="status">
					<script>
							var gcStr = "${dto.gCode}";
							var num = parseInt(gcStr.replace(/[^0-9]/g, ""));
							var count = parseInt("${status.count}");
							arr.push(num);
							if (num > max) {
								max = num
							}
						</script>
				</c:forEach> <script>
						arr.sort(function(a, b) {
							if (a > b)
								return 1;
							if (a === b)
								return 0;
							if (a < b)
								return -1;
						});
						try {
							arr.forEach(function(item, index) {
								if (item != index + 1) {
									if (index == 0) {
										result = index;
									} else {
										result = index + 1;
									};
									throw new Error("stop loop");
								}
							});
						} catch (e) {
						}
						if (result == 0) {
							result++;
						} else if (result == 1) {
							result = max + 1;
						};
						if (result < 10) {
							result = "00" + result;
						} else if (result < 100) {
							result = "0" + result;
						}
						document.getElementById("gCodeAdd").value = result;
					</script></td>
			<td align="center"><input type="text" name=gName id="gNameAdd"></td>
			<td align="center"><input type="text" name=gUnit id="gUnitAdd"
				size=5 maxlength=4></td>
			<td align="center"><input type="text" name=gWeight
				id="gWeightAdd"></td>
			<td align="center"><input type="number" name=gPrice
				id="gPriceAdd" min='0' max='999999' step='10' value=0></td>
			<td align="center"><input type="number" name=gStock
				id="gStockAdd" min='0' max='9999' value=0></td>
			<td align="center" colspan=2><input type="button" value="상품 추가"
				style="width: 125px; height: 23px" class="addBtn"
				data-CodePrefix=<%=cm%> data-ImgPrefix=<%=ci%>></td>
		</tr>
		<tr height="30px" style="border-bottom: 2px double #444444;">
			<td align="right"><input class="allCheck" type="checkbox"
				name="allCheck" id="allCheck"></td>
			<td></td>
			<td align="center" colspan=6><b style="font-size: 20px">상품
					목록</b></td>
			<td colspan='2'><button id="removeAllGoods"
					style="width: 125px; height: 23px">일괄 삭제</button></td>
		</tr>
		<c:forEach var="dto" items="${goodsEdit}" varStatus="status">
			<tr>
				<td class="td_default" align="right"><input type="checkbox"
					name="gCcheck" id="gCcheck" class="check" value="${dto.gCode}">
				</td>
				<td align="center"><img src="images/items/${dto.gImage}.png"
					border="0" height="40" width="40" width="50"><input
					type="hidden" name=gImage id="gImage${dto.gCode}"
					value="${dto.gImage}"></td>
				<td><input type="hidden" name=gCategory
					id="gCategory${dto.gCode}" value="${dto.gCategory}"><input
					type="text" name=gCode id="gCode${dto.gCode}" value="${dto.gCode}"
					size=5 maxlength=4 disabled style="text-align: center;"></td>
				<td class="td_default"><input type="text" name=gName
					id="gName${dto.gCode}" value="${dto.gName}"></td>
				<td class="td_default"><input type="text" name=gUnit
					id="gUnit${dto.gCode}" value="${dto.gUnit}" size=5 maxlength=4></td>
				<td class="td_default"><input type="text" name=gWeight
					id="gWeight${dto.gCode}"
					value=<c:if test="${dto.gWeight != null}">
						"${dto.gWeight}"
					</c:if>
					<c:if test="${dto.gWeight == null}">
						""
					</c:if>></td>
				<td class="td_default"><input type="number" name=gPrice
					id="gPrice${dto.gCode}" value="${dto.gPrice}" min='0' max='999999'
					step='10'></td>
				<td class="td_default"><input type="number" name=gStock
					id="gStock${dto.gCode}" value="${dto.gStock}" min='0' max='9999'></td>
				<td><input type="button" value="수정" class="updateBtn"
					data-gCode="${dto.gCode}" style="width: 62px; height: 23px"></td>
				<td><input type="button" value="제거" class="removeBtn"
					data-gCode="${dto.gCode}" style="width: 62px; height: 23px"></td>
			</tr>
			<c:if test="${status.count%20 == 0 }">
				<tr style="border-top: 1px solid #444444;">
					<td height="5"></td>
				</tr>
			</c:if>
		</c:forEach>
	</table>
</form>