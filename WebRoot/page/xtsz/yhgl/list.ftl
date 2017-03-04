<#include "../../head.ftl" />
<script type="text/javascript">
	$(function(){
		var height=$(window).height();
		var width=$(window).width();
		$("#dataGrid").jqGrid({
	        colNames: ["帐号名称","职工姓名","职工科室","帐号状态","操作"],
	        colModel: [
	            {name: "name", width:100,sortable:false,align:"center",formatter:function(key,options,rowObject){
	            	if(rowObject['isBlanklines'] || key==null){
	            		return "";
	            	}
	            	return key;
	            }},
	            {name: "staffName", width:100,sortable:false,align:"center",formatter:function(key,options,rowObject){
	            	if(rowObject['isBlanklines'] || key==null){
	            		return "";
	            	}
	            	return key;
	            }},
	            {name: "departmentName", width:200,sortable:false,align:"center",formatter:function(key,options,rowObject){
	            	if(rowObject['isBlanklines'] || key==null){
	            		return "";
	            	}
	            	return key;
	            }},
	            {name: "status", width:200,sortable:false,align:"center",formatter:function(key,options,rowObject){
	            	if(rowObject['isBlanklines'] || key==null){
	            		return "";
	            	}
	            	if(key==0){
	            		return "停用";
	            	} else{
	            		return "启用";
	            	}
	            }},
	            {name: "",width:200,sortable:false,align:"center",formatter:function(key,options,rowObject){
	               if(rowObject['isBlanklines']){
	            		return "";
	            	}
	            	var html='';
            		if(rowObject['grade']==0){
            			if(rowObject['status']==0){
		            		html += '&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:status(' + rowObject['id'] + ',1);" title="启用">启用</a>';
		            	} else{
		            		html += '<a href="${gzUrl('xtsz/yhgl/initUpdate.do')}?id=' + rowObject['id'] + '" title="修改">修改</a>';
		            		html += '&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:status(' + rowObject['id'] + ',0);" title="停用">停用</a>';
		            	}
            			html += '&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:unbundling(' + rowObject['id'] + ');" title="解绑">解绑</a>';
            			html += '&nbsp;&nbsp;&nbsp;&nbsp;<a href="${gzUrl('xtsz/yhgl/del.do')}?id=' + rowObject['id'] + '" title="删除">删除</a>';
            		}
                	return html;
	            }}
	        ],
	        datatype: "json", //将这里改为使用JSON数据  
	        url:'${gzUrl('xtsz/yhgl/list.do')}', //这是Action的请求地址  
	        mtype: 'POST',
         	postData:{
                'name':$("#name").val(),
            	'staffName':$("#staffName").val(),
            	'departmentId':$("#departmentId").val()
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
			caption: "帐号列表"
	    });
	    $("#dataGrid").navGrid("#pager",{edit:false,add:false,del:false,refresh:true,search:false});
	    $(document.body).css({"overflow-x":"auto","overflow-y":"auto"});
	    $("#search").button().click(function( event ) {
	    	event.preventDefault();
	    	jQuery("#dataGrid").jqGrid('setGridParam',{  
                postData:{
                    'name':$("#name").val(),
                	'staffName':$("#staffName").val(),
                	'departmentId':$("#departmentId").val()
                }  
            }).trigger('reloadGrid');    
	    });
	    $(window).resize(function(){
	    	var $window=$(window);
			$("#dataGrid").setGridHeight("100%");
			$("#dataGrid").setGridWidth("100%");
		});
	    $("#create").button().click(function( event ) {
	    	event.preventDefault();
	    	window.location.href="${gzUrl('xtsz/yhgl/initAdd.do')}";
	    });
	    $("#departmentId").combobox();
		$("#pageloading").hide();
	});
	
	function unbundling(id){
		$.get("${gzUrl('xtsz/yhgl/unbundling.do')}?id="+ id +"&timestamp="+Date.parse(new Date()), null, callback);
	}
	
	function callback(data){
		jQuery("#dataGrid").jqGrid('setGridParam',{  
            postData:{
                'name':$("#name").val(),
            	'staffName':$("#staffName").val(),
            	'departmentId':$("#departmentId").val()
            }  
        }).trigger('reloadGrid');
        alert('解绑成功');
	}
	
	function status(id,status){
		$.get("${gzUrl('xtsz/yhgl/status.do')}?id="+ id +"&status=" + status +"&timestamp=" + Date.parse(new Date()), null, callback1);
	}
	
	function callback1(data){
		jQuery("#dataGrid").jqGrid('setGridParam',{  
            postData:{
                'name':$("#name").val(),
            	'staffName':$("#staffName").val(),
            	'departmentId':$("#departmentId").val()
            }  
        }).trigger('reloadGrid');
	}
</script>
<body>
	<div id="pageloading"></div> 
	<div class="osx-container">
		<div class="osx-modal-header">
			<div class="osx-modal-icon"></div>
			<div class="osx-modal-title">您现在所在的位置：系统设置->帐号设置</div>
		</div>
		<div class="osx-modal-content" id="osx-modal-content">
			<div id="form" style="padding: 5px; ">
				<form action="" method="post">
					<table border="0" width="750">
					    <tr>
							<td width="250">
								<label for="name" class="edit_lbl">帐号名称:</label>
								<input type="text" id="name" name="name"  class="text ui-widget-content ui-corner-all"/>
							</td>
							<td width="250">
								<label for="staffName" class="edit_lbl">职工姓名:</label>
								<input type="text" id="staffName" name="staffName"  class="text ui-widget-content ui-corner-all"/>
							</td>
							<td width="250">
								<label for="departmentId" class="edit_lbl">所属科室:</label>
							    <select name="departmentId" id="departmentId" class="text ui-widget-content" style="width:151px;">
					           		<option value="-100">不限</option>
        	                        <#list departmentInfoList as departmentInfo>
                                    <option value="${departmentInfo.id}">${departmentInfo.name}</option>
                                    </#list>  
							    </select>
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
