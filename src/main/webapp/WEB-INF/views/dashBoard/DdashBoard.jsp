<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- Load the AJAX API -->
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<!--jQuery CDN -->
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<script type="text/javascript">
    
  //<![CDATA[
    // Load the Visualization API and the corechart package.
    // Visualization API및 corechart패키지를 로드합니다.
    google.charts.load('current', {'packages' : ['corechart']});

    // Set a callback to run when the Google Visualization API is loaded
    //Google Visualization API가 로드될 때 실행할 콜백을 설정합니다.
    google.charts.setOnLoadCallback(drawChart);

    //Callback that creates and populates a data table,
    //instantiates the pie chart, passes in the data and
    // draws it.
    //데이터 테이블을 만들고 채우는 콜백입니다.
    //원형 차트를 인스턴스화하고 데이터를 전달하며 그립니다.
    
      function drawChart() {

        var data = new google.visualization.DataTable();
        data.addColumn('string', 'orderday');
        data.addColumn('number', 'sales');
        data.addRows([
        	${daysales}
        ]);

        var options = {
          title: '일별 매출 통계'
        };

        var chart = new google.visualization.BarChart(document.getElementById('barchart'));

        chart.draw(data, options);
      }
    
    $(function () {
    	// 날짜 데이터 비동기 전송
    	$("#setDay").on("click", function () {
    		console.log("setDay 클릭 ");
    		
    		var startDay= $("#startDay").val();
    		var endDay= $("#endDay").val();
    		
    		if (startDay > endDay || startDay == "" || endDay == "") {
				alert("날짜를 확인해 주세요.");
				event.preventDefault();
			}
    		
    		$.ajax({
    			url: "selectDay",
    			type:"get",
    			dataType: "text",
    			data: {
    				startDay : startDay,
    				endDay : endDay
    			},
    			success: function(data, status, xhr) {
    				console.log("success");
    			},
    			error: function(xhr, status, error) {
    				console.log(error);
    			}			
    		});//end ajax
    	});//end event
	})
</script>
<div style="width: 10%; float: left;">
	<jsp:include page="../table/adminMenu.jsp"/>
</div>
<div style="width: 80%; float: left; text-align: center;">
	<jsp:include page="../admin/dashBoardMenu.jsp" flush="true" /><br>
</div>
<form action="selectDay">
	<div style="margin: 0 auto; width: 450px;">
		<span>시작일</span> <input type="date" id="startDay" name="startDay" /> ~
		<span>종료일</span> <input type="date" id="endDay" name="endDay" />
		<button id="setDay">날짜 설정</button>
	</div>
	<br>
</form>
<div id="barchart" style="width: 900px; height: 500px; margin: 0 auto;"></div>