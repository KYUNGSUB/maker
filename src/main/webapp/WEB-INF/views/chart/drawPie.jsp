<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Draw Pie chart</title>
<!--Load the AJAX API-->
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/resources/js/jquery/jquery-1.11.3.min.js"></script>
<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/resources/js/monitoring/display.js"></script>
</head>
<body>
	<label>시작일: </label><span id="startDay">2019-03-01</span>&nbsp;
	<label>종료일: </label><span id="endDay">2019-03-11</span>&nbsp;
	<button id="prevBtn">&lt;</button>
	<span id="current">2019-03-11</span>
	<button id="nextBtn">&gt;</button>&nbsp;
	<label>데이터 유형: </label>
	<select id="dataType">
		<option value="temp">온도</option>
		<option value="humid">습도</option>
		<option value="light">조도</option>
		<option value="soil">토양</option>
	</select><br>
	<button id="change-chart">Change to Classic</button>
	<br><br>
    <!--Div that will hold the pie chart-->
    <div id="chart_div"></div>
</body>
</html>