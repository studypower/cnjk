<#include "../../head.ftl" />
<link href="${gzUrl('script/artDialog4.1.7/skins/blue.css')}" type="text/css" rel="stylesheet" />
<script src="${gzUrl('script/artDialog4.1.7/jquery.artDialog.js')}" charset="utf-8"></script>
<script src="${gzUrl('script/My97DatePicker/WdatePicker.js')}" ></script>
<script type="text/javascript">

	function del(id) {
		if (confirm("确定要删除吗！")) {
			$.get("${gzUrl('oagl/tzgg/del.do')}?id=" + id, function() {
				$("#search_btn").click();
			});
		}
	}

	function top1(top, id) {
		$.post("${gzUrl('oagl/tzgg/top.do')}", {
			"id" : id,
			"top" : top
		}, function() {
			$("#search_btn").click();
		});
	}
	
	$(function() {
		$("#status").combobox();
		$("#create,#zjqSort,#search_btn,#export_btn").button();
		$("#startTime").datepicker({
			dateFormat : "yy-mm-dd"
		});
		$("#endTime").datepicker({
			dateFormat : "yy-mm-dd"
		});

		$("#dataGrid").jqGrid({
			colNames : [ "编号", "标题","状态","部门", "发布人", "发布时间", "操作" ],
			colModel : [ {
				name : "id",
				width : 50,
				sortable : true,
				align : "center",
				formatter : function(key, options, rowObject) {
					return rowObject["id"];
				}
			}, {
				name : "notice",
				width : 250,
				sortable : false,
				align : "left",
				formatter : function(key, options, rowObject) {
					if(rowObject["top"]=="1"){
						return "&nbsp;&nbsp;<span style='color:red' >"+ rowObject["notice"] +"</span>";
					}
					return "&nbsp;&nbsp;"+rowObject["notice"];
				}
			},
			 {
				name : "status",
				width : 80,
				sortable : false,
				align : "left",
				formatter : function(key, options, rowObject) {
					if(rowObject["status"]=="1"){
						return "&nbsp;&nbsp;已发布";
					}else if(rowObject["status"]=="2"){
						return "&nbsp;&nbsp;草稿";
					}
					return "&nbsp;&nbsp;";
				}
			}
			, {
				name : "department_name",
				width : 150,
				sortable : false,
				align : "center",
				formatter : function(key, options, rowObject) {
					return rowObject["department_name"]
				}
			}, {
				name : "publisher_name",
				width : 150,
				sortable : false,
				align : "center",
				formatter : function(key, options, rowObject) {
					return rowObject["publisher_name"]
				}
			}, {
				name : "publish_date",
				width : 150,
				sortable : false,
				align : "center",
				formatter : function(key, options, rowObject) {
					return rowObject["publish_date"]
				}
			}, {
				name : "",
				width : 180,
				sortable : false,
				align : "center",
				formatter : function(key, options, rowObject) {
					var top = rowObject["top"];
					var publisher = rowObject["publisher"];
					var curUser = "${currentUser.name}";
					var html = "";
					html += "<a href='${gzUrl('oagl/tzgg/view.do')}?id="+ rowObject["id"] + "' target='_blank' >查看</a>&nbsp;";
					var stauts = rowObject["status"];
					 <#if isDisplay('12_1_3')>
							if (top == "1") {
								html += "<a href='###' onclick='top1(0," + rowObject["id"] + ")'>解除置顶</a>&nbsp;";
							} else {
								html += "<a href='###' onclick='top1(1," + rowObject["id"] + ")'>置顶</a>&nbsp;";
							}
					</#if>
					if (curUser == publisher||"${currentUser.grade}"=="1") {
						  <#if isDisplay('12_1_2')>
							html += "<a href='${gzUrl('oagl/tzgg/edit.do')}?id=" + rowObject["id"] + "'>编辑</a>&nbsp;";
						  </#if>
						  <#if isDisplay('12_1_4')>
							html += "<a href='###' onclick='del(" + rowObject["id"] + ")' >删除</a>";
						  </#if>
					}
					return html;
				}
			} ],
			datatype : "json", //将这里改为使用JSON数据
			url : "${gzUrl('oagl/tzgg/list.do')}", //这是Action的请求地址
			mtype : 'POST',
			postData : {
				'status' : $("#status").val(),
				'startTime' : $("#startTime").val(),
				'endTime' : $("#endTime").val(),
				'keyword' : $("#notice_keyword").val()
			},
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
		//查询
		$("#search_btn").click(function(event) {
			event.preventDefault();
			jQuery("#dataGrid").jqGrid('setGridParam', {
				postData : {
					'status' : $("#status").val(),
					'startTime' : $("#startTime").val(),
					'endTime' : $("#endTime").val(),
					'keyword' : $("#notice_keyword").val()
				}
			}).trigger('reloadGrid');
		});
		//创建通知公告
		$("#create").click(function(event) {
			location.href = "${gzUrl('oagl/tzgg/add.do')}";
		});
		$("#zjqSort").click(function(){
			$.getJSON("${gzUrl('oagl/tzgg/findTops.do')}",function(json){
				var html = "<form id='topForm' action='${gzUrl('oagl/tzgg/saveTops.do')}' method='post' target='_biframe' >";
				html += "<table width='400' style='font-size:12px' cellpadding=0 cellspacing=0 >";
				html += "<tr>";
				html += "<td>编号</td>";
				html += "<td>标题</td>";
				html += "<td>排序号</td>";
				html += "</tr>";
				$.each(json,function(i,obj){
					var orderby = obj.orderby==null?"":obj.orderby;
					html += "<tr>";
					html += "<td><input name=\"id\" type=\"hidden\" value=\""+obj.id+"\"/>"+obj.id+"</td>";
					html += "<td>"+obj.notice+"</td>";
					html += "<td><input name=\"orderby\" style='width:30px' type=\"text\" value=\""+orderby+"\"/></td>";
					html += "</tr>";
				});
				html += "</table></from>";
				art.dialog({
					id : "dialog",
					content : html,
					title:'置顶排序',
					padding : "0px",
					width : 400,
					lock : true,
					ok : function(){
						var b = true;
						$("input[name=orderby]","#topForm").each(function(){
							var reg = new RegExp("^[0-9]*$");  
						    if(this.value==""){
						        alert("请输入数字!");
						     	b=false;
						    	return;
						    }
						    if(!reg.test(this.value)){  
						        alert("请输入数字!");
						        b=false;
						        return;
						    } 
						    if(!/^[0-9]*$/.test(this.value)){  
						        alert("请输入数字!");
						        b=false;
						        return;
						    } 
						});
						if(b){
							$("#topForm").submit();
							window.setTimeout(function(){
								$("#search_btn").click();
							},1000);
							return true;
						}else{
							return false;
						}
					},
					cancel : true
				});
			});
		});
		$("#export_btn").click(function(){
			var url="${gzUrl('oagl/tzgg/list.do')}?methodType=exportData";
			var params= new Array();
			params.push(url);
			params.push("status="+$("#status").val());
			params.push("startTime="+$("#startTime").val());
			params.push("endTime="+$("#endTime").val());
			params.push("notice_keyword="+$("#notice_keyword").val());
			window.open(params.join("&"));
		});
		$("#pageloading").hide();
	});
	
</script>
<style>
.from_div {
	padding: 3px;
	margin: 3px;
	border: 1px solid silver;
	margin: 3px;
}
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
</style>
</head>
<body>
	<iframe name="_biframe" src="" style="display:none" ></iframe>
	<div id="pageloading"></div>
	<div class="osx-container">
		<div class="osx-modal-header">
			<div class="osx-modal-icon"></div>
			<div class="osx-modal-title">您现在所在的位置：OA系统->通知公告</div>
		</div>
		<div class="osx-modal-content" id="osx-modal-content">
			<div class="from_div" id="form">
				<form action="" method="post">
					<table>
						<tr>
							<td style="min-width: 150px;">
								<select id="status" name="status_">
									<option value="-1">所有</option>
									<option value="-2">我发布的</option>
									<option value="2">我的草稿</option>
								</select>
							</td>
							<#if isDisplay('12_1_2')>
							<td><input type="button" id="create" value="创建" /></td>
							</#if>
							<#if isDisplay('12_1_3')>
							<td><input type="button" id="zjqSort" value="置顶区排序" /></td>
							</#if>
							<td><input type="text" id="notice_keyword" name="notice_keyword" class="text ui-widget-content ui-corner-all" style="width: 200px" /></td>
							<td style="min-width: 280px;"><b style="font-size:14px">发布日期：</b> <input type="text" id="startTime" name="startTime" style="width: 80px;" class="Wdate text ui-widget-content ui-corner-all" /> - <input
								type="text" id="endTime" name="endTime" style="width: 80px;" class="Wdate text ui-widget-content ui-corner-all" /></td>
							<td><input type="button" id="search_btn" value="搜索" /></td>
							<td><input type="button" id="export_btn" value="导出" /></td>
						</tr>
					</table>
				</form>
			</div>
		</div>
		<table id="dataGrid"></table>
		<div id="pager"></div>
	</div>
</body>
<#include "../../foot.ftl" />
