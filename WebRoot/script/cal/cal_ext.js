function drawCld_(tY, tM, To) {
	var gNum, color1, color2;
	switch (conWeekend) {
	case 1:
		color1 = '#565656';
		color2 = color1;
		break;
	case 2:
		color1 = 'green';
		color2 = color1;
		break;
	case 3:
		color1 = 'red';
		color2 = color1;
		break;
	default:
		color1 = 'green';
		color2 = 'red';
	}
	var html = "";
	html += '<table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" class="tablecalc">';
	html += '<tr style="height:15px;padding:0px;margin: 0px;"><td colspan=7 style="padding:0px;margin: 0px;height:15px;background-color: #f0f0f0"><b>' + (tM + 1) + '月</b></td></tr>';
	html += '<tr>';
	html += '<td style="height:20px;background-color: #f0f0f0">一</td>';
	html += '<td style="height:20px;background-color: #f0f0f0">二</td>';
	html += '<td style="height:20px;background-color: #f0f0f0">三</td>';
	html += '<td style="height:20px;background-color: #f0f0f0">四</td>';
	html += '<td style="height:20px;background-color: #f0f0f0">五</td>';
	html += '<td style="height:20px;background-color: #f0f0f0">六</td>';
	html += '<td style="height:20px;background-color: #f0f0f0">日</td>';
	html += '</tr>';
	
	for (i = 0; i < 1; i++) {
		html += '<tr>';
		for (j = -6; j <=0; j++) {
			gNum = i * 7 + j;
			html += '<td class="fontsd"><span id="sd' + gNum + '"';
			var color = "red";
			if (j == 0)
				color = 'red';
			if (j == 6) {
				if (i % 2 == 1)
					color = color2;
				else
					color = color1;
			}
			html += 'color="' + color + '" ></span><br>';
			html += '<span id="ld' + gNum + '" class="fontld"></span>';
			html += '</td>';
		}
		html += '</tr>';
	}
	
	for (i = 0; i < 6; i++) {
		html += '<tr>';
		for (j = 1; j < 8; j++) {
			gNum = i * 7 + j;
			html += '<td class="fontsd"><span id="sd' + gNum + '"';
			var color = "red";
			if (j == 0)
				color = 'red';
			if (j == 6) {
				if (i % 2 == 1)
					color = color2;
				else
					color = color1;
			}
			html += 'color="' + color + '" ></span><br>';
			html += '<span id="ld' + gNum + '" class="fontld"></span>';
			html += '</td>';
		}
		html += '</tr>';
	}
	html += '</table>';
	$(To).html(html);
	drawCld(tY, tM, To);
}