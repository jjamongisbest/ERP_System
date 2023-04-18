$("#btn").click(function() { // 버튼 클릭 시
	$.ajax({
		"url": "../service?command=salesTotal",
		"method": "POST",
		"timeout": 0
	}).done(function(response) {
		columnChart1(response);
	});
});

$("#btn2").click(function() { // 버튼 클릭 시
	$.ajax({
		"url": "../service?command=monthlyTotal",
		"method": "POST",
		"timeout": 0
	}).done(function(response) {
		columnChart2(response);
	});
});

google.charts.load('current', { packages: ['corechart'] });

// 구글 시각화 API가 로딩이 완료되면,

// 인자로 전달된 콜백함수를 내부적으로 호출하여 차트를 그리는 메소드

// 화면이 실행될때 함께 실행된다.

//google.charts.setOnLoadCallback(columnChart1);

// 묶은 세로 막대형 차트 1

function columnChart1(response) {

	// 버튼 클릭 시 ajax를 사용하여 서버로부터 json 배열 객체를 가져왔다고 가정함


	var arr = [
		['등급별', '매출액'],
	];

	// response에서 grade와 total 값을 추출하여 arr에 추가
	response.forEach(function(data) {
		let grade = data.grade;
		let total = data.total;
		arr.push([grade, total]);
	});

	var dataTable = google.visualization.arrayToDataTable(arr);


	// 실 데이터를 가진 데이터테이블 객체를 반환하는 메소드

	var dataTable = google.visualization.arrayToDataTable(arr);

	// 옵션객체 준비

	var options = {

		title: '전체 매출',

		hAxis: {

			title: '등급별 매출',

			titleTextStyle: {

				color: 'black'

			}

		}

	};

	// 차트를 그릴 영역인 div 객체를 가져옴

	var objDiv = document.getElementById('column_chart_div1');

	// 인자로 전달한 div 객체의 영역에 컬럼차트를 그릴수 있는 차트객체를 반환

	var chart = new google.visualization.ColumnChart(objDiv);

	// 차트객체에 데이터테이블과 옵션 객체를 인자로 전달하여 차트 그리는 메소드

	chart.draw(dataTable, options);

} // drawColumnChart1()의 끝

function columnChart2(response) {
	var arr = [
		['월별', '매출액'],
	];

	// response에서 grade와 total 값을 추출하여 arr에 추가
	response.forEach(function(data) {
		let month = data.month;
		let total = data.total_sales;
		arr.push([month, total]);
	});

	var dataTable = google.visualization.arrayToDataTable(arr);


	// 실 데이터를 가진 데이터테이블 객체를 반환하는 메소드

	var dataTable = google.visualization.arrayToDataTable(arr);

	// 옵션객체 준비

	var options = {

		title: '전체 매출',

		hAxis: {

			title: '월별 매출',

			titleTextStyle: {

				color: 'black'

			}

		}

	};

	// 차트를 그릴 영역인 div 객체를 가져옴

	var objDiv = document.getElementById('column_chart_div1');

	// 인자로 전달한 div 객체의 영역에 컬럼차트를 그릴수 있는 차트객체를 반환

	var chart = new google.visualization.ColumnChart(objDiv);

	// 차트객체에 데이터테이블과 옵션 객체를 인자로 전달하여 차트 그리는 메소드

	chart.draw(dataTable, options);

} // drawColumnChart1()의 끝