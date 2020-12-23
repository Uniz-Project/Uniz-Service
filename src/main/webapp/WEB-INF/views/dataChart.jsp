<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<%@ include file="/WEB-INF/views/includes/header.jsp"%>
<link rel="stylesheet" href="/resources/css/footer.css">
<link rel="stylesheet" href="/resources/css/chart.css">
<link rel="preconnect" href="https://fonts.gstatic.com">

 <script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>

</head>
<body>

	<%@ include file="/WEB-INF/views/includes/nav.jsp"%>
	
	<div class="mainPage">

	<div class="title">
       <p id="userName">쿼카님</p>
       <p>의 차트</p>
    </div>

	<div class= visBox>
		<div class="box1">
		 <canvas class="linechart" id="chartcanvas" ></canvas>
		</div>
		
		<div class="box1">
		 <canvas class="piechart" id="myChartOne" ></canvas> 
		</div>
	</div>
	<div class="title2">
        <p>추천 영상</p>
    </div>
    <div class="likeBox">
            <div class="likeBox1"></div>
            <div class="likeBox1"></div>
            <div class="likeBox1"></div>
            <div class="likeBox1"></div>
            <div class="likeBox1"></div>
            <div class="likeBox1"></div>
            <div class="likeBox1"></div>
            <div class="likeBox1"></div>
    </div>
	
</div>	
<%@ include file="/WEB-INF/views/includes/footer.jsp"%>
	

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.6.0/Chart.js"></script>

<script>


var chartLabels = [];

var chartData = [];

var chartPieLabels = [];

var chartPieData = [];

var userSN = '<c:out value="${user.userSN}"/>';
var nick = '<c:out value="${user.nick}"/>';



$.getJSON("http://localhost:8080/chartList", function(data){
	

	$.each(data, function(inx, obj){

		chartLabels.push(obj.unizkeyword);

		chartData.push(obj.count);

	});

	createChart();


	console.log("create Chart")

});

var lineChartData = {
		
		labels : chartLabels,

		datasets : [

			{
				label : "전체 유니즈 ",
				fillColor : "rbga(151,187,205,0.2)",
				strokeColor : "rbga(151,187,205,1)",
				pointColor : "rbga(151,187,205,1)",
				pointStrokeColor : "#fff",
				pointHighlightFill : "#fff",
				pointHighlightStroke : "rbga(151,187,205,1)",
				data : chartData
			}

				 ]

}


function createChart(){

	let ctx = document.getElementById("chartcanvas").getContext("2d");

	LineChartDemo = Chart.Line(ctx,{
		data : lineChartData,
		options :{
			scales : {
				yAxes : [{
					ticks :{
						beginAtZero : true

				}

				}]
			}
		}
	})
}

$.getJSON("http://localhost:8080/chartList/"+userSN, function(data){
	

	
	$.each(data, function(inx, obj){

		chartPieLabels.push(obj.unizkeyword);

		chartPieData.push(obj.count);

	});
	
	createChart2();

	console.log("create Chart")

});



//pie차트
function createChart2(){

let myChartOne = document.getElementById('myChartOne').getContext('2d');



let barChart = new Chart(myChartOne, {
    type: 'pie',
    data: {
        labels: chartPieLabels,
        datasets: [{
            label: '시청순위',
            data : chartPieData,
            backgroundColor: [
                "rgba(255, 99,  132, 0.4)",
                "rgba(54,  162, 235, 0.4)",
                "rgba(255, 206, 86,  0.4)",
                "rgba(75,  192, 192, 0.4)",
                "rgba(153, 102, 255, 0.4)",
                "rgba(255, 159, 64,  0.4)",
                "rgba(255, 102, 255, 0.4)",
                "green",
                "rgba(54,  162, 235, 0.4)",
                "rgba(255, 206, 86,  0.4)",
                "rgba(75,  192, 192, 0.4)",
                "rgba(153, 102, 255, 0.4)",
                "rgba(255, 159, 64,  0.4)",
                "rgba(255, 102, 255, 0.4)",
                "rgba(204, 204, 204, 0.4)"
            ],
            borderColor: [
                "rgba(255, 99, 132, 1)",
                "rgba(54, 162, 235, 1)",
                "rgba(255, 206, 86, 1)",
                "rgba(75, 192, 192, 1)",
                "rgba(153, 102, 255, 1)",
                "rgba(255, 159, 64, 1)",
                "rgba(255, 102, 255, 1)",
                "rgba(204,204,204, 0.7)"
            ],
            borderWidth: 1
        }]
    },
    options: {
        title: {
            display: 'true',
            text: nick+'님이 많이본 순위',
            // fontSize: 30,
            fontColor: 'black'
        },
        /* legend: {
            display: true,
            position: 'top' // right, left, bottom, top
        }, */
        tooltips: {
            enabled: true
        }
    }
})
};
        </script>





</body>
</html>