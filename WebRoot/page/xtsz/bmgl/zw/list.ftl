<#include "../../../head.ftl" />
<script type="text/javascript">
	$(function(){
		var height=$(window).height();
		var width=$(window).width();
		$("#dataGrid").jqGrid({
	        colNames: ["关联编号","科室名称","职位名称","操作"],
	        colModel: [
	            {name: "id",width:80,sortable:false,align:"center",formatter:function(key,options,rowObject){
	            	if(rowObject['isBlanklines'] || key==null){
	            		return "";
	            	}
	            	return key;
	            }},
	            {name: "department_name", width:150,sortable:false,align:"center",formatter:function(key,options,rowObject){
	            	if(rowObject['isBlanklines'] || key==null){
	            		return "";
	            	}
	            	return key;
	            }},
	            {name: "position_name",width:150,sortable:false,align:"center",formatter:function(key,options,rowObject){
	            	if(rowObject['isBlanklines'] || key==null){
	            		return "";
	            	}
	            	return key;
	            }},
	            {name: "",width:200,sortable:false,align:"center",formatter:function(key,options,rowObject){
	                if(rowObject['isBlanklines']){
	            		return "";
	            	}
	            	var html='';
            		html += '<a href="${gzUrl('xtsz/bmgl/zw/initUpdate.do')}?id=' + rowObject['id'] + '&departmentId=${departmentId}">修改</a>';
            		html += '&nbsp;&nbsp;&nbsp;&nbsp;<a href="${gzUrl('xtsz/bmgl/zw/del.do')}?id=' + rowObject['id'] + '&departmentId=${departmentId}">删除</a>';
                	return html;
	            }}
	        ],
	        datatype: "json", //将这里改为使用JSON数据  
	        url:'${gzUrl('xtsz/bmgl/zw/list.do')}?departmentId=${departmentId}', //这是Action的请求地址  
	        mtype: 'POST',
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
			caption: "科室职位列表"
	    });
		$("#dataGrid").navGrid("#pager",{edit:false,add:false,del:false,refresh:true,search:false});
		$(document.body).css({"overflow-x":"auto","overflow-y":"auto"});
	    $(window).resize(function(){
	    	var $window=$(window);
			$("#dataGrid").setGridHeight("100%");
			$("#dataGrid").setGridWidth("100%");
		});
	   $("#search").button().click(function( event ) {
	    	event.preventDefault();
	    	jQuery("#dataGrid").jqGrid('setGridParam',{  
                postData:{
                	'name':$("#name").val()
                }  
            }).trigger('reloadGrid');    
	    });
	    $("#create").button().click(function( event ) {
	    	event.preventDefault();
	    	window.location.href="${gzUrl('xtsz/bmgl/zw/initAdd.do')}?departmentId=${departmentId}";
	    });
		$("#pageloading").hide();
	});
</script>
<body>
	<div id="pageloading"></div> 
	<div class="osx-container">
		<div class="osx-modal-header">
			<div class="osx-modal-icon"></div>
			<div class="osx-modal-title">您现在所在的位置： 系统设置->科室职位设置->科室职位</div>
		</div>
		<div class="osx-modal-content" id="osx-modal-content">
			<div id="form" style="padding: 5px; ">
				<form action="" method="post">
					<table border="0" width="730">
					      <tr>
							<td width="330">
							  <label for="name" class="query_condition_lbl">职位名称:&nbsp;&nbsp;&nbsp;</label>
							    <input type="text" id="name" name="name" class="text ui-widget-content ui-corner-all" />
							</td>
						    <td width="500">
					        </td>
				    	</tr>
						<tr>
							<td colspan="2">
							    <input type="button" id="search" value="搜索" style="font-size: ;font-family: 'yakov_wryh';width: 120px;"/>
								<input type="button" id="create" value="创建" style="font-size: ;font-family: 'yakov_wryh';width: 120px;"/>
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
<#include "../../../foot.ftl" />
