<#include "../../head.ftl" />
<script type="text/javascript">
	$(function(){
		var height=$(window).height();
		var width=$(window).width();
		$("#dataGrid").jqGrid({
	        colNames: ["资产编号","资产编号","设备类别","设备名称","设备品牌","设备型号","数量","使用情况","维修情况","获得方式","使用地点","操作"],
	        colModel: [
	       		{name: "id",width:180,sortable:false,align:"center",hidden:true,formatter:function(key,options,rowObject){
	            	if(rowObject['isBlanklines'] || key==null){
	            		return "";
	            	}
	            	return key;
	            }},
	            {name: "num",width:180,sortable:false,align:"center",formatter:function(key,options,rowObject){
	            	if(rowObject['isBlanklines'] || key==null){
	            		return "";
	            	}
	            	return key;
	            }},
	            {name: "device_type_name",width:150,sortable:false,align:"center",formatter:function(key,options,rowObject){
	            	if(rowObject['isBlanklines'] || key==null){
	            		return "";
	            	}
	            	return key;
	            }},
	            {name: "device_name",width:150,sortable:false,align:"center",formatter:function(key,options,rowObject){
	            	if(rowObject['isBlanklines'] || key==null){
	            		return "";
	            	}
	            	return key;
	            }},
	            {name: "brand_name",width:100,sortable:false,align:"center",formatter:function(key,options,rowObject){
	            	if(rowObject['isBlanklines'] || key==null){
	            		return "";
	            	}
	            	return key;
	            }},
	            {name: "brand_format_name",width:100,sortable:false,align:"center",formatter:function(key,options,rowObject){
	            	if(rowObject['isBlanklines'] || key==null){
	            		return "";
	            	}
	            	return key;
	            }},
	            {name: "amount",width:60,sortable:false,align:"center",formatter:function(key,options,rowObject){
	            	if(rowObject['isBlanklines'] || key==null){
	            		return "";
	            	}
	            	return key;
	            }},
	            {name: "use_situation_name",width:100,sortable:false,align:"center",formatter:function(key,options,rowObject){
	            	if(rowObject['isBlanklines'] || key==null){
	            		return "";
	            	}
	            	return key;
	            }},
	            {name: "service_situation_name", width:100,sortable:false,align:"center",formatter:function(key,options,rowObject){
	            	if(rowObject['isBlanklines'] || key==null){
	            		return "";
	            	}
	            	return key;
	            }},
	            {name: "storage_mode_name",width:100,sortable:false,align:"center",formatter:function(key,options,rowObject){
	            	if(rowObject['isBlanklines'] || key==null){
	            		return "";
	            	}
	            	return key;
	            }},
	            {name: "",width:100,sortable:false,align:"center",formatter:function(key,options,rowObject){
	            	if(rowObject['isBlanklines']){
	            		return "";
	            	}
	            	if(rowObject['department_name']==null || rowObject['room_num']==null){
	            		return "";
	            	}
                	return rowObject['department_name'] + "(" +rowObject['room_num'] + ")";
	            }},
	            {name: "",width:200,sortable:false,align:"center",formatter:function(key,options,rowObject){
	            	if(rowObject['isBlanklines']){
	            		return "";
	            	}
	            	var html='';
	            	<#if isDisplay('5_1_2')>
	            	   html += '<a href="${gzUrl('gdzcgl/zcxx/initUpdate.do?id=')}' + rowObject['id'] + '" title="修改">修改</a>&nbsp;&nbsp;&nbsp;&nbsp;';
	            	</#if>   
	            	if(rowObject['use_situation_id']==1 && rowObject['service_situation_id']==0){
	            	<#if isDisplay('5_1_4')>
	            	   html += '<a href="${gzUrl('gdzcgl/zcxx/initUpdateStatus.do?assetsInfoLog.type=1&id=')}' + rowObject['id'] + '" title="发放">发放</a>&nbsp;&nbsp;&nbsp;&nbsp;';
	            	</#if>     
	            	}
	            	if(rowObject['use_situation_id']==0){
	            	 <#if isDisplay('5_1_5')>   
	            	   html += '<a href="${gzUrl('gdzcgl/zcxx/initUpdateStatus.do?assetsInfoLog.type=2&id=')}' + rowObject['id'] + '" title="归还">归还</a>&nbsp;&nbsp;&nbsp;&nbsp;';
	            	 </#if>   
	            	}
	            	if(rowObject['use_situation_id']==1 && rowObject['service_situation_id']==0){
	            	 <#if isDisplay('5_1_6')>       
	            	   html += '<a href="${gzUrl('gdzcgl/zcxx/initUpdateStatus.do?assetsInfoLog.type=3&id=')}' + rowObject['id'] + '" title="维修">维修</a>&nbsp;&nbsp;&nbsp;&nbsp;';
	            	 </#if>     
	            	}
	            	if(rowObject['service_situation_id']==1){ 
	            	<#if isDisplay('5_1_7')>    
	            	   html += '<a href="${gzUrl('gdzcgl/zcxx/initUpdateStatus.do?assetsInfoLog.type=4&id=')}' + rowObject['id'] + '" title="正常使用">正常使用</a>&nbsp;&nbsp;&nbsp;&nbsp;';
	            	 </#if>    
	            	}   
                	return html;
	            }}
	        ],
	        datatype: "json", //将这里改为使用JSON数据  
	        url:'${gzUrl('gdzcgl/zcxx/list.do')}', //这是Action的请求地址  
	        mtype: 'POST',
	        postData:{
	        	'num':$("#num").val(),
	        	'deviceTypeId':$("#deviceTypeId").val(),
            	'deviceId':$("#deviceId").val(),
            	'brandId':$("#brandId").val(),
            	'brandFormatId':$("#brandFormatId").val(),
            	'storageModeId':$("#storageModeId").val(),
            	'useSituationId':$("#useSituationId").val(),
            	'serviceSituationId':$("#serviceSituationId").val()
            },
	        pager: $("#pager"),
	        rowNum:20,
	        shrinkToFit:false,
	        rownumbers:false,
	        hidegrid:false,
	        multiselect: true,
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
	        gridComplete: function() {
                var rowIds = jQuery("#dataGrid").jqGrid('getDataIDs');
                for(var k=0; k<rowIds.length; k++) {
                   var curRowData = jQuery("#dataGrid").jqGrid('getRowData', rowIds[k]);
                   var curChk = $("#"+rowIds[k]+"").find(":checkbox");
                   curChk.attr('name', 'checkbox_assetsId');   //给每一个checkbox赋名字
                   curChk.attr('value', curRowData['id']);   //给checkbox赋值
                   curChk.attr('title', curRowData['id']);   //给checkbox赋予额外的属性值
                   //curChk.attr('checked', 'true');   //设置所有checkbox被选中
                }
                //下面的代码顺序不能变(这是页面上所有行被真选中[所有行被黄色])
                //$("#cb_listTable").attr("checked", true);
                //$("#cb_listTable").click();   //input框
                //$("#jqgh_listTable_cb").click();   //div标签
                //$("#listTable_cb").click();   //th标签
            },
			caption: "资产信息列表"
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
                	'num':$("#num").val(),
                	'deviceTypeId':$("#deviceTypeId").val(),
	            	'deviceId':$("#deviceId").val(),
	            	'brandId':$("#brandId").val(),
	            	'brandFormatId':$("#brandFormatId").val(),
                	'storageModeId':$("#storageModeId").val(),
                	'useSituationId':$("#useSituationId").val(),
                	'serviceSituationId':$("#serviceSituationId").val()
                }  
            }).trigger('reloadGrid');    
	    });
	    $("#create").button().click(function( event ) {
	    	event.preventDefault();
	    	window.location.href="${gzUrl('gdzcgl/zcxx/initAdd.do')}";
	    });
	    $("#export_1").button().click(function( event ) {
	    	var ids = "";
	    	jQuery("input[type=checkbox][name=checkbox_assetsId]:checked").each(function(){ //由于复选框一般选中的是多个,所以可以循环输出选中的值    
	    		if(jQuery(this).val()!=""){
	    			if(ids != ""){
	    				ids += ",";
		    		}
		    		ids += jQuery(this).val();
	    		}
			});
			if(ids!=""){
				window.open("${gzUrl('gdzcgl/zcxx/export1.do?ids=')}" + ids);
			}
	    });
	     <#--
	    $("#dr").button().click(function( event ) {
	    	event.preventDefault();
	    	window.location.href="${gzUrl('gdzcgl/zcxx/initIntroduction.do')}";
	    });-->
	    $("#form select").combobox();
	    $("#deviceTypeId").combobox({
			change:changeDeviceType(),
			select:function(){
				changeDeviceType();
			}
		});
		$("#pageloading").hide();
	});
	
	function changeDeviceType() {
			$.get("${gzUrl('xtsz/sjzd/sb/ajaxList.do?typeId=')}" + $("#deviceTypeId").val() + "&timestamp=" + Date.parse(new Date()), null, function(data){
				var deviceList = eval("("+data+")");
			    var deviceSelect = document.getElementById("deviceId");
			    var deviceCount = deviceSelect.options.length;
			    for(var i = 0; i<deviceCount; i++){
			      	deviceSelect.options.remove(0);//每次删除下标都是0
			   	} 
			   	var option = document.createElement("OPTION"); 
			    option.value = -100;  
			    option.innerHTML = "不限";
			    deviceSelect.appendChild(option);
		 		for(var i=0; i<deviceList.length; i++){
				    var option = document.createElement("OPTION"); 
				    option.value = deviceList[i].id;  
				    option.innerHTML = deviceList[i].name;
				    deviceSelect.appendChild(option);
				    //if(i==0){
			   		//	$("#deviceId" +" option[value='" + deviceList[i].id + "']").attr("selected", "selected");
			   		//}
		   		}
			   	$("#deviceId").combobox("destroy");
		   		$("#deviceId").combobox({
		   			change:changeDevice(),
		   			select:function(){
		   				changeDevice();
		   			}
		   		});
			});
	}
	
	function changeDevice() {
			$.get("${gzUrl('xtsz/sjzd/sbpp/ajaxList.do?deviceId=')}" + $("#deviceId").val() + "&timestamp=" + Date.parse(new Date()), null, function(data){
				var brandList = eval("("+data+")");
			    var brandSelect = document.getElementById("brandId");
			    var brandCount = brandSelect.options.length;
			    for(var i = 0; i<brandCount; i++){
			      	brandSelect.options.remove(0);//每次删除下标都是0
			   	}
			   	var option = document.createElement("OPTION"); 
			    option.value = -100;  
			    option.innerHTML = "不限";
			    brandSelect.appendChild(option);
		 		for(var i=0; i<brandList.length; i++){
				    var option = document.createElement("OPTION"); 
				    option.value = brandList[i].id;  
				    option.innerHTML = brandList[i].name;
				    brandSelect.appendChild(option);
				    //if(i==0){
			   		//	$("#brandId" +" option[value='" + brandList[i].id + "']").attr("selected", "selected");
			   		//}
		   		}
			   	$("#brandId").combobox("destroy");
		   		$("#brandId").combobox({
			   		change:changeBrand(),
		   			select:function(){
		   				select:changeBrand();
		   			}
		   		});
			});
	}
	
	function changeBrand() {
			$.get("${gzUrl('xtsz/sjzd/ppxh/ajaxList.do?brandId=')}" + $("#brandId").val() + "&timestamp=" + Date.parse(new Date()), null, function(data){
				var brandFormatList = eval("("+data+")");
			    var brandFormatSelect = document.getElementById("brandFormatId");
			    var brandFormatCount = brandFormatSelect.options.length;
			    for(var i = 0; i<brandFormatCount; i++){
			      	brandFormatSelect.options.remove(0);//每次删除下标都是0
			   	} 
			   	var option = document.createElement("OPTION"); 
			    option.value = -100;  
			    option.innerHTML = "不限";
			    brandFormatSelect.appendChild(option);
		 		for(var i=0; i<brandFormatList.length; i++){
				    var option = document.createElement("OPTION"); 
				    option.value = brandFormatList[i].id;  
				    option.innerHTML = brandFormatList[i].name;
				    brandFormatSelect.appendChild(option);
				    //if(i==0){
			   		//	$("#brandFormatId" +" option[value='" + brandFormatList[i].id + "']").attr("selected", "selected");
			   		//}
		   		}
			   	$("#brandFormatId").combobox("destroy");
		   		$("#brandFormatId").combobox(
		   		);
			});
	}
</script>
<body>
	<div id="pageloading"></div> 
	<div class="osx-container">
		<div class="osx-modal-header">
			<div class="osx-modal-icon"></div>
			<div class="osx-modal-title">您现在所在的位置：固定资产管理->资产信息</div>
		</div>
		<div class="osx-modal-content" id="osx-modal-content">
			<div id="form" style="padding: 5px; ">
				<form action="" method="post">
					<table border="0" width="1200">
						<tr>
							<td width="300">
								<label for="num" class="query_condition_lbl">资产编号:</label>
								<input type="text" id="num" name="num" class="text ui-widget-content ui-corner-all"/>
							</td>
							<td width="300">
							</td>
							<td width="300">
							</td>
							<td width="300">
							</td>
						</tr>
						<tr>
							<td width="300">
								<label for="deviceTypeId" class="query_condition_lbl">设备类别:</label>
                                <select id="deviceTypeId" name="deviceTypeId" class="select01">
                                	<option value="-100">不限</option>
	                                <#if dataDeviceTypeList?exists>
	                                  <#list dataDeviceTypeList as dataDeviceType>
                                         <option value="${dataDeviceType.id}">${dataDeviceType.name}</option>
                                      </#list>
                                    </#if>
                               	</select>
							</td>
							<td width="300">
								<label for="deviceId" class="query_condition_lbl">设备名称:</label>
                                <select id="deviceId" name="deviceId" class="select01">
                                	<option value="-100">不限</option>
                               	</select>
							</td>
							<td width="300">
								<label for="brandId" class="query_condition_lbl">设备类别:</label>
                                <select id="brandId" name="brandId" class="select01">
                                	<option value="-100">不限</option>
                               	</select>
							</td>
							<td width="300">
								<label for="brandFormatId" class="query_condition_lbl">设备类别:</label>
                                <select id="brandFormatId" name="brandFormatId" class="select01">
                                	<option value="-100">不限</option>
                               	</select>
							</td>
						</tr>
						<tr>
							<td width="300">
							    <label for="storageModeId" class="query_condition_lbl">获得方式:</label>
						        <select name="storageModeId" id="storageModeId" class="text ui-widget-content" style="width:151px;">
						           <option value="-100">不限</option>
							       <#if storageModeList?exists>
							   		<#list storageModeList as storageMode>
							   		   <option value="${storageMode.get('value')}">${storageMode.name}</option>
							   		</#list>
							   	   </#if>	
							   </select>
							</td>
						    <td width="300">
						        <label for="useSituationId" class="query_condition_lbl">使用情况:</label>
						        <select name="useSituationId" id="useSituationId" class="text ui-widget-content" style="width:151px;">
						           <option value="-100">不限</option>
							       <#if useSituationList?exists>
							   		<#list useSituationList as useSituation>
							   		   <option value="${useSituation.get('value')}">${useSituation.name}</option>
							   		</#list>
							   	   </#if>	
							   </select>
					        </td>
					        <td width="300">
							    <label for="serviceSituationId" class="query_condition_lbl">维修情况:</label>
						        <select name="serviceSituationId" id="serviceSituationId" class="text ui-widget-content" style="width:151px;">
						           <option value="-100">不限</option>
							       <#if serviceSituationList?exists>
							   		<#list serviceSituationList as serviceSituation>
							   		   <option value="${serviceSituation.get('value')}">${serviceSituation.name}</option>
							   		</#list>
							   	   </#if>	
							   </select>
							</td>
							<td>
							</td>
				    	</tr>
						<tr>
							<td colspan="3">
							   <input type="button" id="search" value="搜索" style="font-size: ;font-family: 'yakov_wryh';width: 120px;"/>
							   <#if isDisplay('5_1_3')>
								<input type="button" id="create" value="创建" style="font-size: ;font-family: 'yakov_wryh';width: 120px;"/>
							   </#if>
							   <#if isDisplay('5_1_8')>
							   <input type="button" id="export_1" value="打印标签" style="font-size: ;font-family: 'yakov_wryh';width: 120px;"/>
							   </#if>
							    <#--
							   <input type="button" id="dr" value="导入" style="font-size: ;font-family: 'yakov_wryh';width: 120px;"/>	 -->	
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
