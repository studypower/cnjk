<#include "../../head.ftl" />
<link href="${gzUrl('script/artDialog4.1.7/skins/blue.css')}" type="text/css" rel="stylesheet" />
<script src="${gzUrl('script/artDialog4.1.7/jquery.artDialog.js')}" charset="utf-8"></script>
<script src="${gzUrl('script/My97DatePicker/WdatePicker.js')}" ></script>
<style>
*{
  font-size:14px;
}
.ui-jqgrid tr.ui-row-ltr td {
font-size: 14px;
}
.ui-jqgrid .ui-jqgrid-htable th div {
font-size: 14px;
}
body{
	overflow: overlay;
	overflow:scroll;
}
.ddtable th{
	padding:3px;
	height:22px;
	border: 1px solid silver;
	border-left:0px;
}
.ddtable td{
	padding:2px;
	border: 1px solid silver;
	border-left:0px;
	border-top:0px;
}
.ddtable tr td:FIRST-CHILD,.ddtable tr th:FIRST-CHILD{
	border-left: 1px solid silver;
}

</style>
</head>
<body>
	<div id="pageloading"></div>
	<div class="osx-container">
		<div class="osx-modal-header">
			<div class="osx-modal-icon"></div>
			<div class="osx-modal-title">您现在所在的位置：OA系统->考勤管理->工作时间段设置</div>
		</div>
		<div class="osx-modal-content" id="osx-modal-content">
			<div class="from_div" id="form">
				<form action="#" method="post">
					<table>
						<tr>
							<td style="min-width: 100px;text-align: right;">时间段类型:</td>
							<td style="min-width: 150px;text-align: left;">
								<select id="model_type" name="model_type">
								<option value="-1">---全部---</option>
									<#if modelList?exists>
										<#list modelList as model>
											<option value="${model.model_type}">${model.model_type_name}</option>
										</#list>
									</#if>
								</select>
							</td>
							<td style="min-width: 100px;text-align: right;">状态:</td>
							<td style="min-width: 150px;text-align: left;">
								<select id="is_use" name="is_use">
									<option value="-1">---全部---</option>
									<option value="1">启用</option>
									<option value="0">禁用</option>
								</select>
							</td>
						</tr>
						<tr>
							<td style="text-align: right;"><input type="button" id="search_btn" value="搜索" style="width:120px"/></td>
							<td><input type="button" id="addNew_btn" value="新增" style="width:120px"/></td>
							<td colspan="3">&nbsp;</td>
						</tr>
					</table>
				</form>
			</div>
		</div>
		<table id="dataGrid"></table>
		<div id="pager"></div>
	</div>
	<iframe name="_biframe" id="_biframe" src="" style="display:none" ></iframe>
	<div id="div_tpl" style="display:none">
		<table cellpadding="0" cellspacing="3" style="width:320px;">
			<tr>
				<td style="text-align: left;width:90px;"><b>时间段类型：</b></td>
				<td><input id="model_type_name_" name="model_type_name_" type="text" oldName="" maxlength="25" style="width:165px;" class="text ui-widget-content ui-corner-all" /><input id="model_type_" name="model_type_" type="hidden" /></td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td colspan="4" style="text-align: left;"><b>时间段设置：</b></td>
			</tr>
			<tr>
				<td colspan="4">
					<table class="ddtable" cellpadding="0" cellspacing="0" style="width:100%;">
						<tr>
							<th style="text-align: center;width:40px;">序号</th>
							<th style="text-align: center;">开始时间</th>
							<th style="text-align: center;">结束时间</th>
						</tr>
						<tr id="md1">
							<td style="text-align: center;"><b>1</b><input type="hidden" name="type1" value="1"/><input type="hidden" id="id1" name="id1" /></td>
							<td style="text-align: center;"><input type="text" id="d1_1" name="d1_1" maxlength="5" class="Wdate text ui-widget-content ui-corner-all" style="width:75px" onClick="WdatePicker({dateFmt:'HH:mm',maxDate:'#F{$dp.$D(\'d1_2\')}'})"/></td>
							<td style="text-align: center;"><input type="text" id="d1_2" name="d1_2" maxlength="5" class="Wdate text ui-widget-content ui-corner-all" style="width:75px" onClick="WdatePicker({dateFmt:'HH:mm',maxDate:'#F{$dp.$D(\'d2_1\')}',minDate:'#F{$dp.$D(\'d1_1\')}'})" /></td>
						</tr>
						<tr id="md2">
							<td style="text-align: center;"><b>2</b><input type="hidden" name="type2" value="2"/><input type="hidden" id="id2" name="id2" /></td>
							<td style="text-align: center;"><input type="text" id="d2_1" name="d2_1" maxlength="5" class="Wdate text ui-widget-content ui-corner-all" style="width:75px" onClick="WdatePicker({dateFmt:'HH:mm',maxDate:'#F{$dp.$D(\'d2_2\')}',minDate:'#F{$dp.$D(\'d1_2\')}'})" /></td>
							<td style="text-align: center;"><input type="text" id="d2_2" name="d2_2" maxlength="5" class="Wdate text ui-widget-content ui-corner-all" style="width:75px" onClick="WdatePicker({dateFmt:'HH:mm',maxDate:'#F{$dp.$D(\'d3_1\')}',minDate:'#F{$dp.$D(\'d2_1\')}'})" /></td>
						</tr>
						<tr id="md3">
							<td style="text-align: center;"><b>3</b><input type="hidden" name="type3" value="3"/><input type="hidden" id="id3" name="id3" /></td>
							<td style="text-align: center;"><input type="text" id="d3_1" name="d3_1" maxlength="5" class="Wdate text ui-widget-content ui-corner-all" style="width:75px" onClick="WdatePicker({dateFmt:'HH:mm',maxDate:'#F{$dp.$D(\'d3_2\')}',minDate:'#F{$dp.$D(\'d2_2\')}'})" /></td>
							<td style="text-align: center;"><input type="text" id="d3_2" name="d3_2" maxlength="5" class="Wdate text ui-widget-content ui-corner-all" style="width:75px" onClick="WdatePicker({dateFmt:'HH:mm',maxDate:'#F{$dp.$D(\'d4_1\')}',minDate:'#F{$dp.$D(\'d3_1\')}'})" /></td>
						</tr>
						<tr id="md4">
							<td style="text-align: center;"><b>4</b><input type="hidden" name="type4" value="4"/><input type="hidden" id="id4" name="id4" /></td>
							<td style="text-align: center;"><input type="text" id="d4_1" name="d4_1" maxlength="5" class="Wdate text ui-widget-content ui-corner-all" style="width:75px" onClick="WdatePicker({dateFmt:'HH:mm',maxDate:'#F{$dp.$D(\'d4_2\')}',minDate:'#F{$dp.$D(\'d3_2\')}'})" /></td>
							<td style="text-align: center;"><input type="text" id="d4_2" name="d4_2" maxlength="5" class="Wdate text ui-widget-content ui-corner-all" style="width:75px" onClick="WdatePicker({dateFmt:'HH:mm',minDate:'#F{$dp.$D(\'d4_1\')}'})" /></td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</div>
</body>
<script type="text/javascript">
	//设置启用，并将原有的启用状态设置为禁用
	var setIsUse = function(id){
		if(confirm("启用该选项，将会禁用掉原有的选项，确定启用吗?")){
			$.post("${gzUrl('oagl/gzsjdsz/setIsUse.do')}",{id:id},function(j){
				if(j=='true'){
					alert("启用设置完成");
					jQuery("#dataGrid").jqGrid('setGridParam', {
					postData : {
						'model_type' : $("#model_type").val(),
						'is_use' : $("#is_use").val()
					}
				}).trigger('reloadGrid');
				}else{
					alert("启用设置失败");
				}
			});
		}
	}
	//设置删除信息	
	var setDelete = function(model_type){
		if(confirm("确定要删除该时间段吗?")){
			$.post("${gzUrl('oagl/gzsjdsz/setDelete.do')}",{model_type:model_type},function(j){
				if(j=='true'){
					$("#search_btn").click();
				}
			});
		}
	}
	
	var showEdit = function(id){
		$.post("${gzUrl('oagl/gzsjdsz/initEdit.do')}",{id:id},function(j){
			var html ="<form method='post' id='editForm' target='_biframe' action='${gzUrl('oagl/gzsjdsz/edit.do')}' >"+$("#div_tpl").html()+"</form>";
			art.dialog({
					id : "dialog",
					content : html,
					title:'编辑工作时间段',
					padding : "0px",
					width : 320,
					lock : true,
					init:function(){
						if(j&&j.length>0){
							for(var i in j){
								var o = j[i];
								if(i==0){
									$("#model_type_name_","#editForm").attr("oldName",o.model_type_name).val(o.model_type_name);
									$("#model_type_","#editForm").val(o.model_type);
								}
								$("#id"+o.type,"#editForm").val(o.id);
								$("#d"+o.type+"_1","#editForm").val(o.start_time);
								$("#d"+o.type+"_2","#editForm").val(o.end_time);
							}
						}
					},
					ok : function(){
						var model_type_name_ = $("#model_type_name_","#editForm").val();//新名称
						var model_type_name_oldName = $("#model_type_name_","#editForm").attr("oldName");//老的名称
						var model_type_ = $("#model_type_","#editForm").val();
						if($.trim(model_type_name_)==""){
							alert("时间段类型名称不能为空！");
							return false;							
						}
						var f = true;
						$("#md1 input:text,#md2 input:text,#md3 input:text,#md4 input:text").each(function(){
							if(f&&this.value==""){
								f=false;
							}
						});
						if(!f){
							alert("时间段设置不能为空！");
							return false;
						}
						$.post("${gzUrl('oagl/gzsjdsz/valModelName.do')}",{
							model_type_name_:model_type_name_
						},function(j){
							if(j&&j[0]&&j[0].model_type_name!=model_type_name_oldName){//验证类型名称是否重复
								alert("新修改的'时间段类型名称'存在重复，请重新填写！");
								return false;
							}
							$("#editForm").submit();
							var interval = setInterval(function(){
								if($("#_biframe").contents()[0].body.innerText=="true"){
									$("#search_btn").click();
									clearInterval(interval);
									var list = art.dialog.list;
										for (var i in list) {
										    list[i].close();
										}
								}
							},300);
						},"json");
						return false;
					},
					okVal:'保存',
					cancel : true
				});
			
		},"json");
	}
	
	//保存新内容，isuse=0表示直接保存，isuse=1,保存并启用
	var addNew = function(isuse){
		var model_type_name_ = $("#model_type_name_","#addNewForm").val();//新名称
		var model_type_name_oldName = $("#model_type_name_","#addNewForm").attr("oldName");//老的名称
		var model_type_ = $("#model_type_","#addNewForm").val();
		
		if($.trim(model_type_name_)==""){
			alert("时间段类型名称不能为空！");
			return false;						
		}
		var f = true;
		$("#md1 input:text,#md2 input:text,#md3 input:text,#md4 input:text").each(function(){
			if(f&&this.value==""){
				f=false;
			}
		});
		if(!f){
			alert("时间段设置不能为空！");
			return false;
		}
		$.post("${gzUrl('oagl/gzsjdsz/valModelName.do')}",{
			model_type_name_:model_type_name_
		},function(j){
			if(j&&j.length>0){//验证类型名称是否重复
				alert("新修改的'时间段类型名称'存在重复，请重新填写！");
				return false;
			}
			$("#addNewForm").append("<input type='hidden' name='is_use' value='"+isuse+"'/>");
			$("#addNewForm").submit();
			var interval = setInterval(function(){
				if($("#_biframe").contents()[0].body.innerText=="true"){
					$("#search_btn").click();
					clearInterval(interval);
					var list = art.dialog.list;
						for (var i in list) {
						    list[i].close();
						}
				}
			},300);
		},"json");
	}
	
	//新增窗口
	var showAddNew = function(){
		var html ="<form method='post' id='addNewForm' target='_biframe' action='${gzUrl('oagl/gzsjdsz/addNew.do')}' >"+$("#div_tpl").html()+"</form>";
		art.dialog({
					id : "dialog",
					content : html,
					title:'新增工作时间段',
					padding : "0px",
					width : 300,
					lock : true,
					ok : function(){
						addNew(0);
						return false;
					},
					okVal:'保存',
					cancel : true,
					 button: [{
				            name: '保存并启用',
				            callback: function () {
				            	if(confirm("保存成功后将会禁用原有的启用时间段，确定需要保存并启用吗？")){
				            		addNew(1);
				            	}
				                return false;
				            }
				       }]
				});
	}
	
	$(function(){
			//公共调用方法
            function Merger(gridName, CellName) {
                //得到显示到界面的id集合
                var mya = $("#" + gridName + "").getDataIDs();
                //当前显示多少条
                var length = mya.length;
                for (var i = 0; i < length; i++) {
                    //从上到下获取一条信息
                    var before = $("#" + gridName + "").jqGrid('getRowData', mya[i]);
                    //定义合并行数
                    var rowSpanTaxCount = 1;
                    for (j = i + 1; j <= length; j++) {
                        //和上边的信息对比 如果值一样就合并行数+1 然后设置rowspan 让当前单元格隐藏
                        var end = $("#" + gridName + "").jqGrid('getRowData', mya[j]);
                        if ($(before[CellName]).text() == $(end[CellName]).text()) {
                            rowSpanTaxCount++;
                            $("#" + gridName + "").setCell(mya[j], CellName, '', { display: 'none' });
                        } else {
                            rowSpanTaxCount = 1;
                            break;
                        }
                        $("#" + CellName + "_" + mya[i] + "").attr("rowspan", rowSpanTaxCount);
                    }
                }
            }
	
		jQuery("#dataGrid").jqGrid({
				recordtext: "{0}-{1}-{2}",
				loadComplete:function(){
					var htmlObj = $($("#pager_right").html());
					var textObj = $("#pager_right").text();
					var textObjs = textObj.split("-");
					if(textObjs.length>1){
						htmlObj.text(textObjs[0]+" - "+((parseInt(textObjs[1]))/4)+" 共 "+textObjs[2]+" 条");
						$("#pager_right").html(htmlObj);
					}
				}, 
				datatype : "json",
				url : "${gzUrl('oagl/gzsjdsz/list.do')}",
				mtype : 'POST',
				rowNum: 20,
				rowList: [20,40,60],
			   	colNames:['编号','时间段类型','作息时间','开始时间','结束时间','状态','操作'],
			   	colModel:[
			   		{name:'id',index:'id', width:50,sortable : false,align : "center"},
			   		{name:'model_type_name',index:'model_type_name', width:'100px',sortable : false,editable:true},
			   		{name:'model_name',index:'model_name', width:100,sortable : false,align : "center"},
			   		{name:'start_time',index:'start_time', width:100,sortable : false,align : "center"},
					{name:'end_time',index:'end_time', width:100,sortable : false,align : "center"},
			   		{name:'is_use',index:'is_use', width:100,sortable : false,align : "center",
			   			formatter : function(key, options, rowObject) {
			   				var is_use = rowObject["is_use"];
			   				if(is_use=='1'){
			   					return "启用";
			   				}else{
			   					return "禁用";
			   				}
						}},
					{name:'editWork', width:100,sortable : false,align : "center",
						formatter : function(key, options, rowObject) {
			   				var is_use = rowObject["is_use"];
			   				var html="";
			   				html += "<a href='###' onclick='showEdit("+rowObject["id"]+")'>修改</a>";
			   				if(is_use=='0'){
			   					html += "&nbsp;&nbsp;<a href='###' onclick='setIsUse("+rowObject["id"]+")'>启用</a>";
			   					html += "&nbsp;&nbsp;<a href='###' onclick='setDelete("+rowObject["model_type"]+");'>删除</a>";
			   				}
			   				return html+"<div style='display:none'>"+rowObject["model_type"]+"</div>";
						},cellattr: function(rowId, tv, rawObject, cm, rdata) {
                            return " id = 'editWork_" + rowId+"' ";
                        }},
			   	],
			   	pager: "#pager",
			   	viewrecords: true,
			   	grouping:true,
			   	postData : {
				'model_type' : $("#model_type").val(),
				'is_use' : $("#is_use").val()
				},
			   	height : "100%",
				width : "100%",
			   	groupingView : {
			   		groupField : ['model_type_name'],
			   		groupColumnShow : [true],
			   		groupText : ['<b>{0}</b>']
			   	},
			   	gridComplete: function() {
			   		 Merger("dataGrid", "editWork");
			   	},
			   	caption: "工作时间段列表"
			});
		$("#is_use").combobox();
		$("#model_type").combobox();
		$("#search_btn").button().click(function(){
			jQuery("#dataGrid").jqGrid('setGridParam', {
					postData : {
						'model_type' : $("#model_type").val(),
						'is_use' : $("#is_use").val()
					}
				}).trigger('reloadGrid');
		});
		$("#addNew_btn").button().click(showAddNew);
		$("#pageloading").hide();
	});
</script>
<#include "../../foot.ftl" />
