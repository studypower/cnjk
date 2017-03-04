<#include "../../head.ftl" />
<script type="text/javascript">
	$(function(){
		var height=$(window).height();
		var width=$(window).width();
		$("#dataGrid").jqGrid({
	        colNames: ["科室名称",<#if baseId?exists && baseId!=0>"上级科室",</#if><#if baseId?exists && baseId==0>"下级科室",</#if>"当前状态","操作"],
	        colModel: [
	            {name: "name", width:150,sortable:false,align:"center",formatter:function(key,options,rowObject){
	            	if(rowObject['isBlanklines'] || key==null){
	            		return "";
	            	}
	            	return key;
	            }},
	           <#if baseId?exists && baseId!=0> 
	            {name: "baseName", width:150,sortable:false,align:"center",formatter:function(key,options,rowObject){
	            	if(rowObject['isBlanklines'] || key==null){
	            		return "";
	            	}
	            	return key;
	            }},
	           </#if>
	           <#if baseId?exists && baseId==0> 
	            {name: "child_department_names",width:150,sortable:false,align:"center",formatter:function(key,options,rowObject){
	                if(rowObject['isBlanklines'] || key==null){
	            		return "";
	            	}
	            	return key;
	            }},
	           </#if> 
	            {name: "status",width:100,sortable:false,align:"center",formatter:function(key,options,rowObject){
	                if(rowObject['isBlanklines'] || key==null){
	            		return "";
	            	}
	            	if(key==1){
	            	  return "启用";
	            	}else if(key==0){
	            	  return "禁用";
	            	}
	            }},
	            {name: "",width:200,sortable:false,align:"center",formatter:function(key,options,rowObject){
	                if(rowObject['isBlanklines']){
	            		return "";
	            	}
	            	var html='';
            		html += '<a href="${gzUrl('xtsz/bmgl/initUpdate.do')}?id=' + rowObject['id'] + '&baseId=' +rowObject['base_id']+ '" title="修改">修改</a>';
            		if(rowObject['status']==1){
            		   html += '&nbsp;&nbsp;&nbsp;<a href="javascript:updateStatus('+rowObject['id']+',0,'+rowObject['base_id']+');" title="禁用">禁用</a>';
            		}else if(rowObject['status']==0){
            		   html += '&nbsp;&nbsp;&nbsp;<a href="javascript:updateStatus('+rowObject['id']+',1,'+rowObject['base_id']+');" title="启用">启用</a>';
            		}
            		<#if baseId?exists && baseId==0>
            		html += '&nbsp;&nbsp;&nbsp;<a href="${gzUrl('xtsz/bmgl/initList.do')}?baseId=' + rowObject['id'] + '" title="下级科室列表">下级科室列表</a>';
            		</#if>
            		<#--
            		html += '<a href="javascript:deleteDepartment('+rowObject['id']+','+rowObject['base_id']+');" title="删除">删除</a>&nbsp;&nbsp;&nbsp;';
            		-->
                	return html;
	            }}
	        ],
	        datatype: "json", //将这里改为使用JSON数据  
	        url:'${gzUrl('xtsz/bmgl/list.do?baseId=${baseId?if_exists}')}', //这是Action的请求地址  
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
			caption: "科室列表"
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
	    	window.location.href="${gzUrl('xtsz/bmgl/initAdd.do?baseId=${baseId?if_exists}')}";
	    });
		$("#pageloading").hide();
	});
	
	function deleteDepartment(id,baseId) {
		var goto = confirm("删除后，数据库中的数据也会做相应删除，此操作不可逆，确定要执行？");
		if(goto){
			window.location.href="${gzUrl('/xtsz/bmgl/del.do?baseId=${baseId?if_exists}&id=')}" + id+"&baseId="+baseId;
		}
	}
	
    function updateStatus(id,status,baseId) {
			window.location.href="${gzUrl('/xtsz/bmgl/updateStatus.do?baseId=${baseId?if_exists}&id=')}" + id+"&status="+status+"&baseId="+baseId;
	}
	
	<#if result?exists>
	   <#if result=0>
	     alert("删除失败");
	   <#elseif result=-1>
	     alert("删除失败,该科室下存在人员信息");
	   <#elseif result=-1>
	     alert("删除失败,该科室存在下级科室,请先删除下级科室");  
	   </#if> 
    </#if>	    
</script>

<body>
	<div id="pageloading"></div> 
	<div class="osx-container">
		<div class="osx-modal-header">
			<div class="osx-modal-icon"></div>
			<div class="osx-modal-title">您现在所在的位置： 系统设置->科室设置->科室管理</div>
		</div>
		<div class="osx-modal-content" id="osx-modal-content">
			<div id="form" style="padding: 5px; ">
				<form action="" method="post">
					<table border="0" width="730">
					    <tr>
							<td width="330">
							  <label for="name" class="query_condition_lbl">科室名称:&nbsp;&nbsp;&nbsp;</label>
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
<#include "../../foot.ftl" />
