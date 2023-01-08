<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {

        var data = google.visualization.arrayToDataTable([
          ['Category', 'Total'],
          ${result}
        ]);

        var options = {
          'title': '카테고리별 매출',
        };

        var chart = new google.visualization.PieChart(document.getElementById('piechart'));

        chart.draw(data, options);
      }
</script>
<div style="width: 10%; float: left;">
	<jsp:include page="../table/adminMenu.jsp"/>
</div>
<div style="width: 80%; float: left; text-align: center;">
	<jsp:include page="../admin/dashBoardMenu.jsp" flush="true" /><br>
</div>
<br>
<div id="piechart" style="width: 900px; height: 500px; margin: 0 auto;"></div>