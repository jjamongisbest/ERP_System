let chart = new CanvasJS.Chart("chartContainer", {
	animationEnabled: true,
	exportEnabled: true,
	title: {
		text: "JSP Column Chart from Database"
	},
	data: [{
		type: "bar", //change type to bar, line, area, pie, etc
		dataPoints: [{
			"x" : 1.0,
			"y" : 2.0
		}]
	}]
});

chart.render();