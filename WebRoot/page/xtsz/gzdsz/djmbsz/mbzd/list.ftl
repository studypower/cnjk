<#include "../../../../head.ftl" />
<script type="text/javascript">
	$(function(){
		var height=$(window).height();
		var width=$(window).width();
		$("#dataGrid").jqGrid({
	        colNames: ["系统编号","字段名称","字段别名","类型","长度","为空","默认值","顺序","状态","创建时间","操作"],
	        colModel: [
	            {name: "id",width:60,sortable:false,align:"center",formatter:function(key,options,rowObject){
	            	if(rowObject['isBlanklines'] || key==null){
	            		return "";
	            	}
	            	return key;
	            }},
	            {name: "name",width:150,sortable:false,align:"center",formatter:function(key,options,rowObject){
	            	if(rowObject['isBlanklines'] || key==null){
	            		return "";
	            	}
	            	return key;
	            }},
	            {name: "column_name",width:150,sortable:false,align:"center",formatter:function(key,options,rowObject){
	            	if(rowObject['isBlanklines'] || key==null){
	            		return "";
	            	}
	            	return key;
	            }},
	            {name: "column_type",width:100,sortable:false,align:"center",formatter:function(key,options,rowObject){
	                if(rowObject['isBlanklines'] || key==null){
	            		return "";
	            	}
	            	if(key=='int'){
	            		return "整数";
	            	} else if(key=='double'){
	            		return "浮点数";
	            	} else if(key=='varchar'){
	            		return "字符";
	            	} else if(key=='text'){
	            		return "长字符";
	            	} else if(key=='date'){
	            		return "日期";
	            	} else if(key=='datetime'){
	            		return "日期时间";
	            	}
	            }},
	            {name: "column_length",width:80,sortable:false,align:"center",formatter:function(key,options,rowObject){
	            	if(rowObject['isBlanklines'] || key==null){
	            		return "";
	            	}
	            	return key;
	            }},
	            {name: "column_required",width:80,sortable:false,align:"center",formatter:function(key,options,rowObject){
	                if(rowObject['isBlanklines'] || key==null){
	            		return "";
	            	}
	            	if(key==0){
	            		return "是";
	            	} else{
	            		return "否";
	            	}
	            }},
	            {name: "column_default",width:80,sortable:false,align:"center",formatter:function(key,options,rowObject){
	            	if(rowObject['isBlanklines'] || key==null){
	            		return "";
	            	}
	            	return key;
	            }},
	            {name: "index_num",width:60,sortable:false,align:"center",formatter:function(key,options,rowObject){
	            	if(rowObject['isBlanklines'] || key==null){
	            		return "";
	            	}
	            	return key;
	            }},
	            {name: "status",width:80,sortable:false,align:"center",formatter:function(key,options,rowObject){
	                if(rowObject['isBlanklines'] || key==null){
	            		return "";
	            	}
	            	if(key==0){
	            		return "禁用";
	            	} else{
	            		return "启用";
	            	}
	            }},
	            {name: "create_time",width:150,sortable:false,align:"center",formatter:function(key,options,rowObject){
	            	if(rowObject['isBlanklines'] || key==null){
	            		return "";
	            	}
	            	return key;
	            }},
	            {name: "",width:250,sortable:false,align:"center",formatter:function(key,options,rowObject){
	                if(rowObject['isBlanklines']){
	            		return "";
	            	}
	              	var html='';
	              	if(rowObject['table_id']!=0){
		              	if(rowObject['status']==0){
		            		html += '<a href="${gzUrl('xtsz/gzdsz/djmbsz/mbzd/status.do?status=1&id=')}'+rowObject['id']+'&tableId=${tableId?if_exists}" title="启用">启用</a>&nbsp;&nbsp;';
		            	} else if(rowObject['status']==1){
		            		html += '<a href="${gzUrl('xtsz/gzdsz/djmbsz/mbzd/status.do?status=0&id=')}'+rowObject['id']+'&tableId=${tableId?if_exists}" title="禁用">禁用</a>&nbsp;&nbsp;';
		            	}
	            	}
	            	html += '<a href="${gzUrl('xtsz/gzdsz/djmbsz/mbzd/info.do?id=')}'+rowObject['id']+'" title="详情">详情</a>&nbsp;&nbsp;';
	            	if(rowObject['table_id']!=0){
	            		html += '<a href="${gzUrl('xtsz/gzdsz/djmbsz/mbzd/initUpdate.do?id=')}'+rowObject['id']+'" title="修改">修改</a>&nbsp;&nbsp;';
	            		html += '<a href="javascript:deleteColumn('+rowObject['id']+');" title="删除">删除</a>&nbsp;&nbsp;';
	            	}
                	return html;
	            }}
	        ],
	        datatype: "json", //将这里改为使用JSON数据  
	        url:'${gzUrl('xtsz/gzdsz/djmbsz/mbzd/list.do')}', //这是Action的请求地址  
	        mtype: 'POST',
	        postData:{
            	'tableId':${tableId?if_exists}
            },
	        pager: $("#pager"),
	        rowNum:20,
	        shrinkToFit:false,
	        rownumbers:false,
	        hidegrid:false,
	        multiselect:false,
	        viewrecords:true,
	        height:"100%",
	        width: '100%', 
	        rowList:[20,40,60],
	        loadComplete: function(){
	           var rowNum = $("#dataGrid").getGridParam("rowNum");
	           var records = $("#dataGrid").getGridParam("records");
	           var page = $("#dataGrid").getGridParam("page");
	           for(var i=0;i<(page * rowNum - records);i++){
	        	  $("#dataGrid").jqGrid("addRowData",i+1,{"isBlanklines":true});
	           }
	        },
			caption: "模板字段列表"
	    });
		$("#dataGrid").navGrid("#pager",{edit:false,add:false,del:false,refresh:true,search:false});
	    $(document.body).css({"overflow-x":"auto","overflow-y":"auto"});
	    $(window).resize(function(){
	    	var $window=$(window);
			$("#dataGrid").setGridHeight("100%");
			$("#dataGrid").setGridWidth("100%");
		});
	    $("#addBtn").button().click(function( event ) {
	    	event.preventDefault();
	    	window.location.href="${gzUrl('xtsz/gzdsz/djmbsz/mbzd/initAdd.do?tableId=')}${tableId?if_exists}";
	    });
		$("#pageloading").hide();
	});
	
	function deleteColumn(id) {
		var goto = confirm("删除后，数据库中的数据也会做相应删除，此操作不可逆，确定要执行？");
		if(goto){
			window.location.href="${gzUrl('xtsz/gzdsz/djmbsz/mbzd/delete.do?id=')}" + id + "&tableId=${tableId?if_exists}";
		}
	}
</script>
<body>
	<div id="pageloading"></div> 
	<div class="osx-container">
		<div class="osx-modal-header">
			<div class="osx-modal-icon"></div>
			<div class="osx-modal-title">您现在所在的位置：系统设置->工资单设置->单据模版设置->模板字段设置</div>
		</div>
		<div class="osx-modal-content" id="osx-modal-content">
			<div id="form" style="padding: 5px; ">
				<form action="" method="post">
					<table border="0" width="730">
						<tr>
							<td colspan="2">
								<input type="button" id="addBtn" value="创建" style="font-size: ;font-family: 'yakov_wryh';width: 120px;"/>
							</td>
						</tr>
					</table>
				</form>
			</div>
			<table id="dataGrid"></table>
			<div id="pager"></div>
		</div>
	</div>
</body>
<#include "../../../../foot.ftl" />
