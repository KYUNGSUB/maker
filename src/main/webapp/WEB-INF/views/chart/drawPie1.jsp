<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Draw Pie chart</title>
<!--Load the AJAX API-->
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">

      // Load the Visualization API and the corechart package.
      google.charts.load('current', {'packages':['corechart']});

      // Set a callback to run when the Google Visualization API is loaded.
      google.charts.setOnLoadCallback(drawChart);

      // Callback that creates and populates a data table,
      // instantiates the pie chart, passes in the data and
      // draws it.
      function drawChart() {
    	  // Define the chart to be drawn.
          var data = new google.visualization.DataTable();
          data.addColumn('string', 'Element');
          data.addColumn('number', 'Percentage');
          data.addRows([
            ['Nitrogen', 0.78],
            ['Oxygen', 0.21],
            ['Other', 0.01]
          ]);

          // Instantiate and draw the chart.
          var chart = new google.visualization.PieChart(document.getElementById('myPieChart'));
          chart.draw(data, null);
      }
    </script>
</head>
<body>
    <!--Div that will hold the pie chart-->
    <div id="myPieChart"></div>
</body>
</html>