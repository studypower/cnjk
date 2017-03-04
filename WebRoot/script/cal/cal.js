﻿var debug = 2; // -1: disable; 0: all; N: show level N debug msg.
/*******************************************************************************
 * 个人偏好设定
 ******************************************************************************/

var conWeekend = 3; // 周末颜色显示: 1=黑色, 2=绿色, 3=红色, 4=隔周休

/*******************************************************************************
 * 日期资料
 ******************************************************************************/
// 农历数据信息
var lunarInfo = new Array(0x04bd8, 0x04ae0, 0x0a570, 0x054d5, 0x0d260, 0x0d950, 0x16554, 0x056a0, 0x09ad0, 0x055d2, 0x04ae0, 0x0a5b6, 0x0a4d0, 0x0d250, 0x1d255, 0x0b540, 0x0d6a0, 0x0ada2, 0x095b0,
		0x14977, 0x04970, 0x0a4b0, 0x0b4b5, 0x06a50, 0x06d40, 0x1ab54, 0x02b60, 0x09570, 0x052f2, 0x04970, 0x06566, 0x0d4a0, 0x0ea50, 0x06e95, 0x05ad0, 0x02b60, 0x186e3, 0x092e0, 0x1c8d7, 0x0c950,
		0x0d4a0, 0x1d8a6, 0x0b550, 0x056a0, 0x1a5b4, 0x025d0, 0x092d0, 0x0d2b2, 0x0a950, 0x0b557, 0x06ca0, 0x0b550, 0x15355, 0x04da0, 0x0a5d0, 0x14573, 0x052d0, 0x0a9a8, 0x0e950, 0x06aa0, 0x0aea6,
		0x0ab50, 0x04b60, 0x0aae4, 0x0a570, 0x05260, 0x0f263, 0x0d950, 0x05b57, 0x056a0, 0x096d0, 0x04dd5, 0x04ad0, 0x0a4d0, 0x0d4d4, 0x0d250, 0x0d558, 0x0b540, 0x0b5a0, 0x195a6, 0x095b0, 0x049b0,
		0x0a974, 0x0a4b0, 0x0b27a, 0x06a50, 0x06d40, 0x0af46, 0x0ab60, 0x09570, 0x04af5, 0x04970, 0x064b0, 0x074a3, 0x0ea50, 0x06b58, 0x055c0, 0x0ab60, 0x096d5, 0x092e0, 0x0c960, 0x0d954, 0x0d4a0,
		0x0da50, 0x07552, 0x056a0, 0x0abb7, 0x025d0, 0x092d0, 0x0cab5, 0x0a950, 0x0b4a0, 0x0baa4, 0x0ad50, 0x055d9, 0x04ba0, 0x0a5b0, 0x15176, 0x052b0, 0x0a930, 0x07954, 0x06aa0, 0x0ad50, 0x05b52,
		0x04b60, 0x0a6e6, 0x0a4e0, 0x0d260, 0x0ea65, 0x0d530, 0x05aa0, 0x076a3, 0x096d0, 0x04bd7, 0x04ad0, 0x0a4d0, 0x1d0b6, 0x0d250, 0x0d520, 0x0dd45, 0x0b5a0, 0x056d0, 0x055b2, 0x049b0, 0x0a577,
		0x0a4b0, 0x0aa50, 0x1b255, 0x06d20, 0x0ada0)

// 太阳历每月天数
var solarMonth = new Array(31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31);
// 天干
var Gan = new Array("甲", "乙", "丙", "丁", "戊", "己", "庚", "辛", "壬", "癸");
// 地支
var Zhi = new Array("子", "丑", "寅", "卯", "辰", "巳", "午", "未", "申", "酉", "戌", "亥");
// 属相
var Animals = new Array("鼠", "牛", "虎", "兔", "龙", "蛇", "马", "羊", "猴", "鸡", "狗", "猪");
// 节气
var solarTerm = new Array("小寒", "大寒", "立春", "雨水", "惊蛰", "春分", "清明", "谷雨", "立夏", "小满", "芒种", "夏至", "小暑", "大暑", "立秋", "处暑", "白露", "秋分", "寒露", "霜降", "立冬", "小雪", "大雪", "冬至");
// ?????
var sTermInfo = new Array(0, 21208, 42467, 63836, 85337, 107014, 128867, 150921, 173149, 195551, 218072, 240693, 263343, 285989, 308563, 331033, 353350, 375494, 397447, 419210, 440795, 462224,
		483532, 504758);
//
var nStr1 = new Array('日', '一', '二', '三', '四', '五', '六', '七', '八', '九', '十');
//
var nStr2 = new Array('初', '十', '廿', '卅', '　');
// 英语月份简写
var monthName = new Array("JAN", "FEB", "MAR", "APR", "MAY", "JUN", "JUL", "AUG", "SEP", "OCT", "NOV", "DEC");

// 国历节日 *表示节假日
var sFtv = new Array("0101*元旦", "0214 情人节", "0308 妇女节", "0312 植树节", "0315 消费者权益日", "0324 世界防治结核病日", "0407 卫生日", "0422 地球日", "0501*劳动节", "0504 青年节", "0505 碘缺乏病防治日", "0508 红十字日", "0512 护士节",
		"0515 家庭日", "0520 学生营养日", "0523 牛奶日", "0531 无烟日", "0601 儿童节", "0605 环境日", "0606 爱眼日", "0625 土地日", "0626 反毒品日", "0711 世界人口日", "0808 父亲节", "0908 扫盲日", "0910 教师节", "0920 爱牙日", "0927 旅游日",
		"1006 老人节", "1008 高血压日 视觉日", "1009 邮政日", "1015 盲人节", "1016 粮食日", "1114 糖尿病日", "1201 艾滋病日", "1203 残疾人日", "1225 圣诞节");
// 农历节日 *表示节假日
var lFtv = new Array("0101*春节", "0115 元宵", "0505 端午", "0707 七夕", "0715 中元", "0815 中秋", "0909 重阳", "1208 腊八", "1223 小年", "0100*除夕");
// 按周计算 月周日
var wFtv = new Array("0520 母亲节", "0530 助残日", "0630 父亲节", "0932 和平日", "0940 聋人节");
function log(level, msg) {
	if (debug == 0 || debug == level)
		return;
		if (window.console) {
			//window.console.log("[DEBUG]" + msg);
		}
}

function lYearDays(y) {
	var i, sum = 348;
	for (i = 0x8000; i > 0x8; i >>= 1)
		sum += (lunarInfo[y - 1900] & i) ? 1 : 0;
	return (sum + leapDays(y));
}

function leapDays(y) {
	if (leapMonth(y))
		return ((lunarInfo[y - 1900] & 0x10000) ? 30 : 29);
	else
		return (0);
}

function leapMonth(y) {
	return (lunarInfo[y - 1900] & 0xf);
}

function monthDays(y, m) {
	return ((lunarInfo[y - 1900] & (0x10000 >> m)) ? 30 : 29);
}

function Lunar(objDate) {
	var m = ""; // msg for log
	var i, leap = 0, temp = 0;
	var baseDate = new Date(1900, 0, 31);
	// changed by hmisty 2005/07/23
	 //var offset = (objDate - baseDate)/86400000;
	//var offset = Math.floor((objDate.getTime() + 2206425600000) / 86400000);
	//objDate.getTime()=1420041600000 chrome 
	//objDate.getTime()=61378185600000-59958144000000L IE
	
	var offset = Math.floor((objDate.getTime() + 2206425600000) / 86400000);
	if(offset>500000){
		//console.log("IE");
		offset = Math.floor((objDate.getTime()-59958144000000 + 2206425600000) / 86400000);
	}
	m += "objDate=" + objDate.getTime() + ", new Date(1900,0,31)=" + baseDate.getTime();
	m += "offset=" + offset;

	this.dayCyl = offset + 40;
	this.monCyl = 14;

	for (i = 1900; i < 2050 && offset > 0; i++) {
		temp = lYearDays(i);
		offset -= temp;
		this.monCyl += 12;
	}

	if (offset < 0) {
		offset += temp;
		i--;
		this.monCyl -= 12;
	}

	this.year = i;
	this.yearCyl = i - 1864;

	leap = leapMonth(i);
	this.isLeap = false;
	
	for (i = 1; i < 13 && offset > 0; i++) {
		if (leap > 0 && i == (leap + 1) && this.isLeap == false) {
			--i;
			this.isLeap = true;
			temp = leapDays(this.year);
		} else {
			temp = monthDays(this.year, i);
		}

		if (this.isLeap == true && i == (leap + 1))
			this.isLeap = false;

		offset -= temp;
		if (this.isLeap == false)
			this.monCyl++;
	}

	if (offset == 0 && leap > 0 && i == leap + 1)
		if (this.isLeap) {
			this.isLeap = false;
		} else {
			this.isLeap = true;
			--i;
			--this.monCyl;
		}

	if (offset < 0) {
		offset += temp;
		--i;
		--this.monCyl;
	}
	this.month = i;
	this.day = offset + 1;

	m += "\noffset=" + offset + ", year=" + this.year + ", yearCyl=" + this.yearCyl + ", month=" + this.month + ",\n monthCyl=" + this.monthCyl + ", day=" + this.day + ", dayCyl=" + this.dayCyl;
	log(2, m);
}

function solarDays(y, m) {
	if (m == 1)
		return (((y % 4 == 0) && (y % 100 != 0) || (y % 400 == 0)) ? 29 : 28);
	else
		return (solarMonth[m]);
}

function cyclical(num) {
	return (Gan[num % 10] + Zhi[num % 12]);
}

function calElement(sYear, sMonth, sDay, week, lYear, lMonth, lDay, isLeap, cYear, cMonth, cDay) {

	this.isToday = false;
	this.sYear = sYear;
	this.sMonth = sMonth;
	this.sDay = sDay;
	this.week = week;
	this.lYear = lYear;
	this.lMonth = lMonth;
	this.lDay = lDay;
	this.isLeap = isLeap;
	this.cYear = cYear;
	this.cMonth = cMonth;
	this.cDay = cDay;

	this.color = '';

	this.lunarFestival = '';
	this.solarFestival = '';
	this.solarTerms = '';

}

function sTerm(y, n) {
	log(1, "y=" + y + " n=" + n + " sTermInfo[n]=" + sTermInfo[n] + " Date.UTC(1900,0,6,2,5)=" + Date.UTC(1900, 0, 6, 2, 5) + " Date.UTC(1970,0,1,0,0)=" + Date.UTC(1970, 0, 1, 0, 0));
	// changed by hmisty 2005/07/23
	// var offDate = new Date( ( 31556925974.7*(y-1900) + sTermInfo[n]*60000 ) +
	// Date.UTC(1900,0,6,2,5) );
	var offDate = new Date((31556925974.7 * (y - 1900) + sTermInfo[n] * 60000) - 2208549300000);
	// Negative epoch (time_t) values are not officially supported by the
	// POSIX standards. On some systems, they are known not to work.
	// -- perldoc Time::Local

	return (offDate.getUTCDate());
}

function calendar(y, m) {
	log(1, "i am in calendar() now");
	var sDObj, lDObj, lY, lM, lD = 1, lL, lX = 0, tmp1, tmp2;
	var lDPOS = new Array(3);
	var n = 0;
	var firstLM = 0;

	sDObj = new Date(y, m, 1);

	this.length = solarDays(y, m);
	this.firstWeek = sDObj.getDay();

	log(1, "this.length: " + this.length);
	log(1, "begin loop for(var i=0;i<this.length;i++)");
	for (var i = 0; i < this.length; i++) {

		if (lD > lX) {
			sDObj = new Date(y, m, i + 1);
			lDObj = new Lunar(sDObj);
			lY = lDObj.year;
			lM = lDObj.month;
			lD = lDObj.day;
			
			lL = lDObj.isLeap;
			lX = lL ? leapDays(lY) : monthDays(lY, lM);

			if (n == 0)
				firstLM = lM;
			lDPOS[n++] = i - lD + 1;
		}

		// log(1, "lDObj.dayCyl: "+lDObj.dayCyl);
		
		this[i] = new calElement(y, m + 1, i + 1, nStr1[(i + this.firstWeek) % 7], lY, lM, lD++, lL, cyclical(lDObj.yearCyl), cyclical(lDObj.monCyl), cyclical(lDObj.dayCyl++));

		if ((i + this.firstWeek) % 7 == 0)
			this[i].color = '#ff5f07';
		if ((i + this.firstWeek) % 14 == 13)
			this[i].color = '#ff5f07';
	}
	log(1, "end loop for(var i=0;i<this.length;i++)");

	tmp1 = sTerm(y, m * 2) - 1;
	tmp2 = sTerm(y, m * 2 + 1) - 1;
	log(1, "m: " + m + " tmp1: " + tmp1 + " " + solarTerm[m * 2] + " tmp2: " + tmp2 + " " + solarTerm[m * 2 + 1]);
	this[tmp1].solarTerms = solarTerm[m * 2];
	this[tmp2].solarTerms = solarTerm[m * 2 + 1];
	if (m == 3)
		this[tmp1].color = '#ff5f07';

	log(1, "begin loop for(i in sFtv)");
	for (i in sFtv){
		try{
			if (sFtv[i].match(/^(\d{2})(\d{2})([\s\*])(.+)$/))
				if (Number(RegExp.$1) == (m + 1)) {
					this[Number(RegExp.$2) - 1].solarFestival += RegExp.$4 + ' ';
					if (RegExp.$3 == '*')
						this[Number(RegExp.$2) - 1].color = '#ff5f07';
				}
		}catch(e){
			//console.log("异常="+e);
		}
     }
	log(1, "begin loop for(i in wFtv)");
	for (i in wFtv){
		try{
			if (wFtv[i].match(/^(\d{2})(\d)(\d)([\s\*])(.+)$/))
				if (Number(RegExp.$1) == (m + 1)) {
					tmp1 = Number(RegExp.$2);
					tmp2 = Number(RegExp.$3);
					this[((this.firstWeek > tmp2) ? 7 : 0) + 7 * (tmp1 - 1) + tmp2 - this.firstWeek].solarFestival += RegExp.$5 + ' ';
				}
		}catch(e){
			//console.log("异常="+e);
		}
	}
	log(1, "begin loop for(i in lFtv)");
	for (i in lFtv){
		try{
		if (lFtv[i].match(/^(\d{2})(.{2})([\s\*])(.+)$/)) {
			log(1, lFtv[i]);
			tmp1 = Number(RegExp.$1) - firstLM;
			if (tmp1 == -11)
				tmp1 = 1;
			if (tmp1 >= 0 && tmp1 < n) {
				tmp2 = lDPOS[tmp1] + Number(RegExp.$2) - 1;
				if (tmp2 >= 0 && tmp2 < this.length) {
					log(1, "tmp2 >= 0 && tmp2(" + tmp2 + ")<this.length(" + this.length + ")");
					log(1, RegExp.$4);
					log(1, this[tmp2].lunarFestival);
					this[tmp2].lunarFestival += RegExp.$4 + ' ';
					log(1, RegExp.$3);
					if (RegExp.$3 == '*')
						this[tmp2].color = '#ff5f07';
				}
			}
		}
		}catch(e){//console.log("异常="+e);
		}
	}
	log(1, "begin 黑色星期五");
	if ((this.firstWeek + 12) % 7 == 5)
		this[12].solarFestival += '黑色星期五 ';

	if (y == tY && m == tM) {
		this[tD - 1].isToday = true;
	}
}

// ==== 中文日期
function cDay(d) {

	var s;
	switch (d) {
	case 10:
		s = '初十';
		break;
	case 20:
		s = '二十';
		break;
	case 30:
		s = '三十';
		break;
	default:
		s = nStr2[Math.floor(d / 10)];
		s += nStr1[d % 10];
	}
	return (s);

}
// ==== 中文日期(月，日)
function cDayToday(m, d) {
	var nStr1 = new Array('日', '一', '二', '三', '四', '五', '六', '七', '八', '九', '十');
	var nStr2 = new Array('初', '十', '廿', '卅', '　');
	var s;
	if (m > 10) {
		s = '十' + nStr1[m - 10]
	} else {
		s = nStr1[m]
	}
	s += '月'
	switch (d) {
	case 10:
		s += '初十';
		break;
	case 20:
		s += '二十';
		break;
	case 30:
		s += '三十';
		break;
	default:
		s += nStr2[Math.floor(d / 10)];
		s += nStr1[d % 10];
	}
	return (s);
}

var cld;

function drawCld(SY, SM) {
	log(1, "i am in drawCld() now");

	var i, sD, s, size;
	// var sObj,lObj;

	log(1, "begin to create calendar cld");
	cld = new calendar(SY, SM);
	log(1, "calendar cld creation finished");

	// document.getElementById("gz").innerHTML = '&nbsp;&nbsp;农历' + cyclical(SY
	// - 1900 + 36) + '年 &nbsp;&nbsp;【' + Animals[(SY - 4) % 12] + '】';
	// log(1, "innerHTML of gz is " + document.getElementById("gz").innerHTML);
	
	for (i = 0; i < 42; i++) {

		sObj = document.getElementById('sd' + i);
		lObj = document.getElementById('ld' + i);
		// sObj=eval('sd'+ i);
		// lObj=eval('ld'+ i);

		sObj.className = '';

		sD = i - cld.firstWeek;
		
		if (sD > -1 && sD < cld.length) { // 日期内
			sObj.innerHTML = sD + 1;

			if (cld[sD].isToday)
				sObj.className = 'todyaColor'; // 今日颜色

			sObj.style.color = cld[sD].color; // 法定假日颜色

			if (cld[sD].lDay == 1) // 显示农历月
				lObj.innerHTML = '<b>' + (cld[sD].isLeap ? '闰' : '') + cld[sD].lMonth + '月' + (monthDays(cld[sD].lYear, cld[sD].lMonth) == 29 ? '小' : '大') + '</b>';
			else
				// 显示农历日
				lObj.innerHTML = cDay(cld[sD].lDay);

			s = cld[sD].lunarFestival;
			if (s.length > 0) { // 农历节日
				if (s.length > 3)
					s = s.substr(0, 3) + '..';
				s = s.fontcolor('red');
			} else { // 公历节日
				s = cld[sD].solarFestival;
				if (s.length > 0) {
					size = (s.charCodeAt(0) > 0 && s.charCodeAt(0) < 128) ? 8 : 4;
					if (s.length > size + 2)
						s = s.substr(0, size) + '..';
					s = (s == '黑色星期五') ? s.fontcolor('black') : s.fontcolor('blue');
				} else { // 廿四节气
					s = cld[sD].solarTerms;
					if (s.length > 0)
						s = s.fontcolor('limegreen');
				}
			}

			if (cld[sD].solarTerms == '清明')
				s = '清明节'.fontcolor('red');
			if (cld[sD].solarTerms == '芒种')
				s = '芒种'.fontcolor('red');
			if (cld[sD].solarTerms == '夏至')
				s = '夏至'.fontcolor('red');
			if (cld[sD].solarTerms == '冬至')
				s = '冬至'.fontcolor('red');

			if (s.length > 0)
				lObj.innerHTML = s;

		} else { // 非日期
			sObj.innerHTML = '';
			lObj.innerHTML = '';
		}
	}
}

function drawCld(SY, SM, Target) {
	var curYear_ = new Date().getYear() + 1900;
	var curMoh_ = new Date().getMonth() + 1;
	var curDay_ = new Date().getDate();
	var curDD_ = curYear_+""+curMoh_+""+curDay_;
	var curD_ = curYear_+ ""+ (curMoh_<10?"0":"") + curMoh_ + "" + (curDay_<10?"0":"") + curDay_;//当前系统时间
	var i, sD, s, size;
	cld = new calendar(SY, SM);
	for (i = -6; i <= 42; i++) {
		// 必须引入jquery
		// 0从星期一开始，7表示星期日
		
		sObj = $('#sd' + i, Target)[0];
		lObj = $('#ld' + i, Target)[0];
		sObj.className = '';
		sD = i - cld.firstWeek;
	
		if (sD > -1 && sD < cld.length) { // 日期内
			var ddd = sD + 1;
			sObj.innerHTML = ddd;
			var std = $(sObj).parent();
			std.css("cursor", "pointer");
			std.attr("isclick", "true");
			
			var xday = SY + "-" + (SM < 9 ? "0" : "") + (SM + 1) + "-" + (ddd < 10 ? "0" : "") + ddd;//表格单元日期
			var XDAY_ = SY + "" + (SM < 9 ? "0" : "") + (SM + 1) + "" + (ddd < 10 ? "0" : "") + ddd;
			std.attr("ddv", xday);
			if(XDAY_>=curDD_){//将大于当前日期的表格元素设置为可选样式，该样式留带以后使用
				std.addClass("regionSelect");
			}
			
			if (cld[sD].isToday)
				sObj.className = 'todyaColor'; // 今日颜色
			sObj.style.color = cld[sD].color; // 法定假日颜色
			if (cld[sD].lDay == 1) // 显示农历月
				lObj.innerHTML = '<b>' + (cld[sD].isLeap ? '闰' : '') + cld[sD].lMonth + '月' + (monthDays(cld[sD].lYear, cld[sD].lMonth) == 29 ? '小' : '大') + '</b>';
			else
				// 显示农历日
				lObj.innerHTML = cDay(cld[sD].lDay);

			s = cld[sD].lunarFestival;
			if (s.length > 0) { // 农历节日
				if (s.length > 3)
					s = s.substr(0, 3) + '..';
				s = s.fontcolor('red');
			} else { // 公历节日
				s = cld[sD].solarFestival;
				if (s.length > 0) {
					size = (s.charCodeAt(0) > 0 && s.charCodeAt(0) < 128) ? 8 : 4;
					if (s.length > size + 2)
						s = s.substr(0, size) + '..';
					s = (s == '黑色星期五') ? s.fontcolor('black') : s.fontcolor('blue');
				} else { // 廿四节气
					s = cld[sD].solarTerms;
					if (s.length > 0)
						s = s.fontcolor('limegreen');
				}
			}
			if (cld[sD].solarTerms == '清明')
				s = '清明'.fontcolor('red');
			if (cld[sD].solarTerms == '芒种')
				s = '芒种'.fontcolor('red');
			if (cld[sD].solarTerms == '夏至')
				s = '夏至'.fontcolor('red');
			if (cld[sD].solarTerms == '冬至')
				s = '冬至'.fontcolor('red');
			if (s.length > 0)
				lObj.innerHTML = s;
		} else { // 非日期
			sObj.innerHTML = '';
			lObj.innerHTML = '';
		}
	}
	
	if($("tr:eq(2)",Target).text()==""&&$("tr:eq(8)",Target).text()==""){
		$("tr:eq(2)",Target).remove();
	}else if($("tr:eq(2)",Target).text()==""||$("tr:eq(8)",Target).text()=="") {
		if($("tr:eq(2)",Target).text()==""){
			$("tr:eq(2)",Target).remove();
		}else{
			$("tr:eq(8)",Target).remove();
		}
	}
}

function changeCld() {
	var y, m;
	y = document.getElementById("sy").selectedIndex + 1900;
	m = document.getElementById("sm").selectedIndex;
	drawCld(y, m);
}

function pushBtm(K) {
	switch (K) {
	case 'YU':
		if (document.getElementById("sy").selectedIndex > 0)
			document.getElementById("sy").selectedIndex--;
		break;
	case 'YD':
		if (document.getElementById("sy").selectedIndex < 149)
			document.getElementById("sy").selectedIndex++;
		break;
	case 'MU':
		if (document.getElementById("sm").selectedIndex > 0) {
			document.getElementById("sm").selectedIndex--;
		} else {
			document.getElementById("sm").selectedIndex = 11;
			if (document.getElementById("sy").selectedIndex > 0)
				document.getElementById("sy").selectedIndex--;
		}
		break;
	case 'MD':
		if (document.getElementById("sm").selectedIndex < 11) {
			document.getElementById("sm").selectedIndex++;
		} else {
			document.getElementById("sm").selectedIndex = 0;
			if (document.getElementById("sy").selectedIndex < 149)
				document.getElementById("sy").selectedIndex++;
		}
		break;
	default:
		document.getElementById("sy").selectedIndex = tY - 1900;
		document.getElementById("sm").selectedIndex = tM;
	}
	changeCld();
}

var Today = new Date();
var tY = Today.getFullYear();
var tM = Today.getMonth();
var tD = Today.getDate();

var width = "130"; // detail层宽度
var offsetx = 2;
var offsety = 16;

var x = 0;
var y = 0;
var show = 0;
var sw = 0;
var cnt = 0;

var dStyle;
document.onmousemove = mEvn;

function mOut() {
	if (cnt >= 1) {
		sw = 0
	}
	if (sw == 0) {
		show = 0;
	} else
		cnt++;
}

// 获取鼠标坐标
function mEvn(e) {
	if (!show)
		return;
	if (window.event) {
		x = event.x;
		y = event.y;
		if (document.body.scrollLeft) {
			x += document.body.scrollLeft;
			y += document.body.scrollTop;
		}
		// changed by hmisty 2005/07/23
		dStyle.left = (x + offsetx - (width / 2)) + "px";
		dStyle.top = (y + offsety) + "px";
	} else {
		dStyle.left = (e.pageX + offsetx - (width / 2)) + "px";
		dStyle.top = (e.pageY + offsety) + "px";
	}
}

function changeTZ() {
	document.getElementById("city").innerHTML = document.getElementById("tz").value.substr(6);
	setCookie("TZ", document.getElementById("tz").selectedIndex);
}

function tick() {
	var today;
	today = new Date();
	document.getElementById("clock").innerHTML = today.getFullYear() + "年" + today.getMonth() + "月" + today.getDay() + "日" + today.getTime();
	window.setTimeout("tick()", 1000);
}

function setCookie(name, value) {
	var today = new Date()
	var expires = new Date()
	expires.setTime(today.getTime() + 1000 * 60 * 60 * 24 * 365)
	document.cookie = name + "=" + escape(value) + "; expires=" + expires.toGMTString()
}

function getCookie(Name) {
	var search = Name + "=";
	if (document.cookie.length > 0) {
		offset = document.cookie.indexOf(search);
		if (offset != -1) {
			offset += search.length;
			end = document.cookie.indexOf(";", offset);
			if (end == -1)
				end = document.cookie.length;
			return unescape(document.cookie.substring(offset, end));
		} else
			return "";
	}
}

function fillSelect() {
	syd = document.getElementById("sy");
	syd.innerHTML = "";
	for (i = 1900; i < 2050; i++) {
		ins = document.createElement("OPTION");
		ins.innerHTML = i;
		syd.appendChild(ins);
	}
	smd = document.getElementById("sm");
	smd.innerHTML = "";
	for (i = 1; i < 13; i++) {
		ins = document.createElement("OPTION");
		ins.innerHTML = i;
		smd.appendChild(ins);
	}
}

function fillCalendar() {
	var gNum;
	var tablex = document.createElement("table");
	tablex.setAttribute("id", "week");
	for (i = 0; i < 6; i++) {
		var trx1 = document.createElement("tr");
		var trx2 = document.createElement("tr");
		trx1.setAttribute("class", "tr1");
		trx2.setAttribute("class", "tr2");
		for (j = 0; j < 7; j++) {
			gNum = i * 7 + j;
			var tdx = document.createElement("td");
			tdx.setAttribute("id", "sd" + gNum);
			tdx.setAttribute("onMouseOver", 'mOvr(' + gNum + ')');
			tdx.setAttribute("onMouseOut", "mOut()");
			if (j == 0) {
				tdx.setAttribute("class", "aorange");
			} else if (j == 6) {
				if (i % 2 == 1)
					tdx.setAttribute("class", "aorange");
				else
					tdx.setAttribute("class", "agreen");
			} else {
				tdx.setAttribute("class", "one");
			}
			trx1.appendChild(tdx);

			tdx = document.createElement("td");
			tdx.setAttribute("id", "ld" + gNum);
			tdx.setAttribute("onMouseOver", 'mOvr(' + gNum + ')');
			tdx.setAttribute("onMouseOut", "mOut()");
			trx2.appendChild(tdx);
		}
		tablex.appendChild(trx1);
		tablex.appendChild(trx2);
	}
	document.getElementById("calendar").appendChild(tablex);
}
// 界面初始化

function TimeAdd(UTC, T) {
	var PlusMinus, DST, y;
	if (T.substr(0, 1) == "-") {
		PlusMinus = -1;
	} else {
		PlusMinus = 1;
	}
}

function YYMMDD() {
	var cl = '<font color="#0000df" STYLE="font-size:9pt;">';
	if (Today.getDay() == 0)
		cl = '<font color="#c00000" STYLE="font-size:9pt;">';
	if (Today.getDay() == 6)
		cl = '<font color="#00c000" STYLE="font-size:9pt;">';
	// return(cl+SY+'年'+(SM+1)+'月'+SD+'日</font>');
	return (tY + '年' + (tM + 1) + '月' + tD + '日');
}
function weekday() {
	var day = new Array("星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六");
	var cl = '<font color="#ff0000" STYLE="font-size:9pt;">';
	if (Today.getDay() == 0)
		cl = '<font color="#c00000" STYLE="font-size:9pt;">';
	if (Today.getDay() == 6)
		cl = '<font color="#00c000" STYLE="font-size:9pt;">';
	// return(cl+ day[now.getDay()]+ '</font>');
	return (day[Today.getDay()]);
}
function solarDay1() {
	var sDObj = new Date(tY, tM, tD);
	var lDObj = new Lunar(sDObj);
	var cl = '<font color="violet" STYLE="font-size:9pt;">';
	var tt = '【' + Animals[(SY - 4) % 12] + '】' + cyclical(lDObj.monCyl) + '月 ' + cyclical(lDObj.dayCyl++) + '日';
	return (cl + tt + '</font>');
}
function solarDay2() {
	var sDObj = new Date(tY, tM, tD);
	var lDObj = new Lunar(sDObj);
	var cl = '<font color="#000066" STYLE="font-size:9pt;">';
	// 农历BB'+(cld[d].isLeap?'闰 ':' ')+cld[d].lMonth+' 月 '+cld[d].lDay+' 日
	var tt = cyclical(tY - 1900 + 36) + '年' + cDayToday(lDObj.month, lDObj.day);
	// return(cl+tt+'</font>');
	return (tt);
}

