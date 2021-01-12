<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<%@ include file="/WEB-INF/views/includes/header.jsp"%>
<link rel="stylesheet" href="/resources/css/Navbar.css">
<link rel="stylesheet" href="/resources/css/Footer.css">
<link rel="stylesheet" href="/resources/css/chart.css">
<link rel="preconnect" href="https://fonts.gstatic.com">

 <script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>

</head>
<body>

	<%@ include file="/WEB-INF/views/includes/nav.jsp"%>
	
	<div class="mainPage">

	<div class="title">
       <p id="userName" style="padding: 0;">${user.nick}</p>
       <p>의 차트</p>
    </div>

	<div class= visBox>
		<div class="box1">
		<!--  여기여기   캔버스 style="" 부분 추가되었습니다.  -->
		 <canvas class="linechart" id="chartcanvas" style="height:90%; width:88%;margin: 2px;"></canvas>
		</div>
		
		<div class="box1">
				<!--  여기여기   캔버스 style="" 부분 수정했습니다.  -->
		 <canvas class="piechart" id="myChartOne" style="height:95%; width:100%;" ></canvas> 
		</div>
	</div>
	<div class="title2">
        <p>추천 영상</p>
    </div>
    
    <div id="rec" class="likeBox">
    	
    
    </div>
	
</div>	
<%-- <%@ include file="/WEB-INF/views/includes/footer.jsp"%> --%>
	

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.6.0/Chart.js"></script>
<script src="/resources/js/unizChart.js"></script>

<script type="text/javascript">
$(document).ready(function() {
	var userSN = '<c:out value="${user.userSN}"/>';
	
	getList({userSN:userSN});
});	
</script>
<script>


var chartLabels = [];
var chartData = [];
var chartPieLabels = [];
var chartPieData = [];
var userSN = '<c:out value="${user.userSN}"/>';
var nick = '<c:out value="${user.nick}"/>';

$.getJSON("http://localhost:9090/chartList", function(data){
	

	$.each(data, function(inx, obj){

		chartLabels.push(obj.unizkeyword);

		chartData.push(obj.count);

	});

	lineChart();


	console.log("create Chart")

});

var lineChartData = {
		
		labels : chartLabels,

		datasets : [

			{
				label : "전체 선호도",
				fillColor : "rbga(151,187,205,0.2)",
				strokeColor : "rbga(151,187,205,1)",
				pointColor : "rbga(151,187,205,1)",
				pointStrokeColor : "#fff",
				pointHighlightFill : "#fff",
				pointHighlightStroke : "rbga(151,187,205,1)",
				backgroundColor: "rgba(204,204,204, 0.7)",
				borderColor: "rgba(54, 162, 235, 1)",
				data : chartData
			}
				 ]
}

function lineChart(){

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


//pie차트
$.getJSON("http://localhost:9090/chartList/"+userSN, function(data){
	
	$.each(data, function(inx, obj){

		chartPieLabels.push(obj.unizkeyword);

		chartPieData.push(obj.count);

	});
	
	pieChart();

	console.log("create Chart")

});


function pieChart(){

let myChartOne = document.getElementById('myChartOne').getContext('2d');

let barChart = new Chart(myChartOne, {
    type: 'pie',
    data: {
        labels: chartPieLabels,
        datasets: [{
            label: '전체 선호도',
            data : chartPieData,
            backgroundColor: [
                "#E45E56",
                "#FF914C",
                "#860B5E",
                "#BA305C",
                "#4B0156",
                "#4D3D8F",
                "#3F6EC1",
                "#00CEFF",
                "#1B9EE6",
                "#E45E56",
                "#1E9FE4"
            ],
            borderColor: [
            	"#E45E56",
                "#FF914C",
                "#860B5E",
                "#BA305C",
                "#4B0156",
                "#4D3D8F",
                "#3F6EC1",
                "#00CEFF",
                "#1B9EE6",
                "#E45E56",
                "#1E9FE4"
            ],
            borderWidth: 1
        }]
    },
    options: {
        title: {
            display: 'true',
            text: nick+'님의 선호도',
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