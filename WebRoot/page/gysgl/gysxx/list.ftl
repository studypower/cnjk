<#include "../../head.ftl" />
<script type="text/javascript">
	$(function(){
		var height=$(window).height();
		var width=$(window).width();
		$("#dataGrid").jqGrid({
	        colNames: ["供应商名称","营业执照编号","营业执照附件","营业执照过期时间","类别","综合等级","最后年检时间","状态","操作"],
	        colModel: [
	            {name: "name",width:150,sortable:false,align:"center",formatter:function(key,options,rowObject){
	            	if(rowObject['isBlanklines'] || key==null){
	            		return "";
	            	}
	            	var html='';
	            	html += '<a href="javascript:infoObj('+rowObject['id']+')" title="'+rowObject['name']+'">'+rowObject['name']+'</a>';
	            	return html;
	            }},
	            {name: "business_license_num",width:120,sortable:false,align:"center",formatter:function(key,options,rowObject){
	            	if(rowObject['isBlanklines'] || key==null){
	            		return "";
	            	}
	            	var html='';
	            	if(rowObject['business_license_expiry_status']==2){
	            		html += "<font color='red'>";
	            	} else if(rowObject['business_license_expiry_status']==1){
	            		html += "<font color='#0000FF'>";
	            	} else{
	            		html += "<font>";
	            	}
	            	html += key;
	            	html += "</font>";
	            	return html;
	            }},
	            {name: "business_license_file_url",width:150,sortable:false,align:"center",formatter:function(key,options,rowObject){
	            	if(rowObject['isBlanklines'] || key==null){
	            		return "";
	            	}
	                var html='';
	            	html += '<a href="${gzUrl('')}' + key + '" title="点击查看" target="_blank">点击查看</a>';
	            	return html;
	            }},
	            {name: "business_license_expiry_time",width:150,sortable:false,align:"center",formatter:function(key,options,rowObject){
	            	if(rowObject['isBlanklines'] || key==null){
	            		return "";
	            	}
	            	return key;
	            }},
	            {name: "type_name",width:80,sortable:false,align:"center",formatter:function(key,options,rowObject){
	            	if(rowObject['isBlanklines'] || key==null){
	            		return "";
	            	}
	            	return key;
	            }},
	            {name: "complex_level",width:100,sortable:false,align:"center",formatter:function(key,options,rowObject){
	            	if(rowObject['isBlanklines'] || key==null){
	            		return "";
	            	}
	            	if(key==1){
	            		return "优秀";
	            	} else if(key==2){
	            		return "合格";
	            	} else if(key==3){
	            		return "不合格";
	            	}
	            }},
	            {name: "last_inspection_time",width:120,sortable:false,align:"center",formatter:function(key,options,rowObject){
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
	            	} else if(key==1){
	            		return "启用";
	            	}
	            }},
	            {name: "",width:240,sortable:false,align:"center",formatter:function(key,options,rowObject){
	            	if(rowObject['isBlanklines']){
	            		return "";
	            	}
	            	var html='';
	                <#if isDisplay('4_1_2')>	
	            	    html += '<a href="javascript:infoObj('+rowObject['id']+')" title="详情">详情</a>';
	                </#if>	
	            	html += '&nbsp;&nbsp;';
	                <#if isDisplay('4_1_3')>	
	            	   html += '<a href="${gzUrl('gysgl/gysxx/initUpdate.do?id=')}' + rowObject['id'] + '" title="修改">修改</a>';
	               </#if>		
	            	html += '&nbsp;&nbsp;';
	               <#if isDisplay('4_1_5_1')>		
	            	   html += '<a href="${gzUrl('gysgl/gysxx/zsxx/initList.do?supplierId=')}' + rowObject['id'] + '" title="证书列表">证书列表</a>';
	               </#if>	
	            	html += '&nbsp;&nbsp;';
	            	<#if isDisplay('4_3_2')>	
	            	   html += '<a href="${gzUrl('gysgl/gysnj/initAdd.do?supplierId=')}' + rowObject['id'] + '" title="年度评审">年度评审</a>';
	            	</#if>   
	            	if(rowObject['status']==0){
	            		html += '<a href="javascript:auditObj('+rowObject['id']+')" title="审核">审核</a>&nbsp;&nbsp;&nbsp;&nbsp;';
	            	}
                	return html;
	            }}
	        ],
	        datatype: "json", //将这里改为使用JSON数据  
	        url:'${gzUrl('gysgl/gysxx/list.do')}', //这是Action的请求地址  
	        mtype: 'POST',
	        postData:{
            	'type':$("#type").val(),
            	'complexLevel':$("#complexLevel").val()
            },
	        pager: $("#pager"),
	        rowNum:20,
	        shrinkToFit:false,
	        rownumbers:false,
	        hidegrid:false,
	        multiselect: false,
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
			caption: "供应商信息列表"
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
                	'type':$("#type").val(),
                	'name':$("#name").val(),
                	'businessLicenseNum':$("#businessLicenseNum").val(),
                	'complexLevel':$("#complexLevel").val()
                }  
            }).trigger('reloadGrid');    
	    });
	    $("#exportData").button().click(function( event ) {
            event.preventDefault();
	    	$.get("${gzUrl('gysgl/gysxx/exportData.do?')}type=" + $("#type").val() + "&name="+ $("#name").val() + "&businessLicenseNum=" + $("#businessLicenseNum").val() + "&complexLevel=" + $("#complexLevel").val() + "&timestamp=" + Date.parse(new Date()), null, returnBack);
	    });
	    $("#create").button().click(function( event ) {
	    	event.preventDefault();
	    	window.location.href="${gzUrl('gysgl/gysxx/initAdd.do')}";
	    });
	    $("#type").combobox();
	    $("#complexLevel").combobox();
		$("#pageloading").hide();
	});
	
	function returnBack(data){
	  	var result = eval("("+data+")");
      	if(result[0]==1){
         	alert("导出成功");
         	window.open('${gzUrl('')}' + result[1]);
      	}else{
        	alert("导出失败");
		}
	}
	
	function infoObj(id) {
		$("#dialog").dialog({
    		 height: 450,
    		 width: 850,
    		 modal: true,
    		 resizable: false,
    		 close: function( event, ui ) {
    			 $("#dialog_iframe").css("display","none");
    		 },
    		 buttons:[
    		 {
    			 text:"关闭",
    			 click:function(){
    			 	jQuery("#dataGrid").jqGrid('setGridParam',{  
			            postData:{
			            }  
			        }).trigger('reloadGrid');
    				$(this).dialog("close");
    				$("#dialog_iframe").attr("src","${gzUrl('page/blank.html')}");
    			 }
    		 }]
    	});
    	$("#dialog_iframe").css("display","block");
    	$("#dialog_iframe").attr("src","${gzUrl('gysgl/gysxx/info.do')}?id=" + id + "&randomNum=" + Math.random());
	}
</script>
<body>
	<div id="pageloading"></div> 
	<div class="osx-container">
		<div class="osx-modal-header">
			<div class="osx-modal-icon"></div>
			<div class="osx-modal-title">您现在所在的位置：供应商管理->供应商信息</div>
		</div>
		<div class="osx-modal-content" id="osx-modal-content">
			<div id="form" style="padding: 5px; ">
				<form action="" method="post">
					<table border="0" width="800">
						<tr>
							<td width="110">
								<label for="name" class="query_condition_lbl">供应商名称:</label>
							</td>
							<td width="200">	
								<input type="text" id="name" name="name" class="text ui-widget-content ui-corner-all"/>
							</td>
						    <td width="100">
						      	<label for="type" class="query_condition_lbl">供应商类别:</label>
						    </td>
							<td width="">	
							    <select name="type" id="type" class="text ui-widget-content" style="width:151px;">
							    	<option value="-100">不限</option>
							   		<#list supplierTypeList as supplierType>
							   		<option value="${supplierType.id}">${supplierType.name}</option>
							   		</#list>
							    </select>
					        </td>
				    	</tr>
				    	<tr>
							<td width="">
								<label for="businessLicenseNum" class="query_condition_lbl">营业执照编号:</label>
							</td>
							<td width="">	
								<input type="text" id="businessLicenseNum" name="businessLicenseNum" class="text ui-widget-content ui-corner-all"/>
							</td>
						    <td width="">
						      	<label for="complexLevel" class="query_condition_lbl">综合等级:&nbsp;&nbsp;&nbsp;</label>
							</td>
							<td width="">	
							    <select name="complexLevel" id="complexLevel" class="text ui-widget-content" style="width:151px;">
							        <option value="0">不限</option>
							    	<option value="1">优秀</option>
							    	<option value="2">合格</option>
							    	<option value="3" <#if from?if_exists="welcome" >selected</#if>>不合格</option>
							    </select>
					        </td>
				    	</tr>
						<tr>
							<td colspan="4">
								<input type="button" id="search" value="搜索" style="font-size: ;font-family: 'yakov_wryh';width: 120px;"/>
							  	<#if isDisplay('4_1_4')>	
								<input type="button" id="create" value="创建" style="font-size: ;font-family: 'yakov_wryh';width: 120px;"/>
							  	</#if>
							  	<input type="button" id="exportData" value="导出" style="font-size: ;font-family: 'yakov_wryh';width: 120px;"/>
							  	&nbsp;&nbsp;&nbsp;&nbsp;
							  	<font color='red' style="font-size:12px;">红色：</font><font style="font-size:12px;">执照已过期</font>&nbsp;&nbsp;&nbsp;&nbsp;
								<font color='#0000FF' style="font-size:12px;">深蓝色：</font><font style="font-size:12px;">执照即将过期</font>
							</td>
						</tr>
					</table>
				</form>
			</div>
			<table id="dataGrid"></table>
			<div id="pager"></div>
		</div>
	</div>
	<div id="dialog" title="供应商详细" style="padding: 0px;">
		<iframe id="dialog_iframe" name="dialog_iframe" src="" frameborder="0" width="100%" height="100%" style="overflow: hidden;display: none;"></iframe>
	</div>
</body>
<#include "../../foot.ftl" />
