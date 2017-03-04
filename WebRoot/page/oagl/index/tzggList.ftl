<#include "../../head.ftl" />
<style>
body{
	overflow: overlay;
	overflow:scroll;
}
*{
	font-size:14px;
}
.ui-jqgrid tr.ui-row-ltr td {
font-size: 14px;
}
.ui-jqgrid .ui-jqgrid-htable th div {
font-size: 14px;
}
#dataGrid tr{
	height:35px;
}
#dataGrid tr:hover{
	background: #5C9CCC
}
</style>
</head>
<body>
	<div id="pageloading"></div>
	<div class="osx-container">
		<div class="osx-modal-header">
			<div class="osx-modal-icon"></div>
			<div class="osx-modal-title">您现在所在的位置：OA系统->首页->通知公告列表</div>
		</div>
		<table id="dataGrid"></table>
		<div id="pager"></div>
	</div>
</body>
<script type="text/javascript">
	$(function() {
		$("#dataGrid").jqGrid({
			colNames : [ "编号", "标题", "发布人", "发布时间" ],
			colModel : [ 
			{name : "id",width : 60,sortable : false,align : "center"}, 
			{name : "notice",width : 480,sortable : false,align : "left",
				formatter : function(key, options, rowObject) {
					var value = "";
					if(rowObject["top"]=="1"){value = "&nbsp;&nbsp;<span style='color:red' >"+ rowObject["notice"] +"</span>";}
					else{value ="&nbsp;&nbsp;"+rowObject["notice"];}
					 return "<a href='${gzUrl('oagl/tzgg/view.do')}?id="+ rowObject["id"] + "' target='_blank' >"+value+"<a>";
				}
			},
			 {name : "publisher",width : 150,sortable : false,align : "center"}, 
			 {name : "publish_date",width : 150,sortable : false,align : "center"} 
			],
			datatype : "json", //将这里改为使用JSON数据
			url : "${gzUrl('oagl/index/tzggList.do')}", //这是Action的请求地址
			mtype : 'POST',
			postData : {},
			pager : $("#pager"),
			rowNum : 20,
			shrinkToFit : false,
			rownumbers : false,
			hidegrid : false,
			multiselect : false,
			viewrecords : true,
			height : "100%",
			width : '100%',
			rowList : [ 20, 40, 60 ],
			loadComplete : function() {
				var rowNum = $("#dataGrid").getGridParam("rowNum");
			},
			caption : "通知公告列表"
		});
		$("#pageloading").hide();
	});
</script>
<#include "../../foot.ftl" />