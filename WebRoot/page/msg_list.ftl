<#include "head.ftl" />
<script type="text/javascript">
	$(function(){
		var height=$(window).height();
		var width=$(window).width();
		$("#dataGrid").jqGrid({
	        colNames: ["消息标题","消息内容","消息时间","阅读状态","操作"],
	        colModel: [
	        	{name: "msg_title",width:"200",sortable:false,align:"center",formatter:function(key,options,rowObject){
	        		if(rowObject['isBlanklines']){
	            		return "";
	            	}
	            	return '<a href="javascript:infoObj(' + rowObject['id'] + ')">'+key+'</a>';
	            }},
	            {name: "msg_content",width:"400",sortable:false,align:"center",formatter:function(key,options,rowObject){
	            	if(rowObject['isBlanklines']){
	            		return "";
	            	}
	            	return '<a href="javascript:infoObj(' + rowObject['id'] + ')">'+key+'</a>';
	            }},
	            {name: "msg_time",width:"150",sortable:false,align:"center",formatter:function(key,options,rowObject){
	            	if(rowObject['isBlanklines']){
	            		return "";
	            	}
	            	return key;
	            }},
	            {name: "msg_status",width:"100",sortable:false,align:"center",formatter:function(key,options,rowObject){
	            	if(rowObject['isBlanklines']){
	            		return "";
	            	}
	            	if(key==1){
	            		return "已阅读";
	            	}
	            	return "未阅读";
	            }},
	            {name: "",width:"150",sortable:false,align:"center",formatter:function(key,options,rowObject){
	            	var _html = '';
	            	if(rowObject['msg_status']==0){
	            		_html += '<a href="javascript:readMsg(' + rowObject['id'] + ')">置为已阅读</a>&nbsp;&nbsp;';
	            	}
	            	if(rowObject['msg_status']!=null){
	            		_html += '<a href="javascript:delMsg(' + rowObject['id'] + ')">删除</a>';
	            	}
	            	return _html;
	            }}
	        ],
	        datatype: "json", //将这里改为使用JSON数据  
	        url:'${gzUrl('msgList.do')}', //这是Action的请求地址  
	        mtype: 'POST',
	        pager: $("#pager"),
	        rowNum:20,
	        shrinkToFit:false,
	        rownumbers:false,
	        hidegrid:false,
	        multiselect: false,
	        viewrecords:true,
	        height:"100%",
	        width:"100%", 
	        rowList:[20,40,60],
	        loadComplete: function(){
	        	var rowNum = $("#dataGrid").getGridParam("rowNum");
	        	var records = $("#dataGrid").getGridParam("records");
	        	var page = $("#dataGrid").getGridParam("page");
	        	for(var i=0;i<(page * rowNum - records);i++){
	        		$("#dataGrid").jqGrid("addRowData",i+1,{"isBlanklines":true});
	        	}
	        },
			caption: "消息列表"
	    });
		$("#dataGrid").navGrid("#pager",{edit:false,add:false,del:false,refresh:true,search:false});
		$(document.body).css({"overflow-x":"auto","overflow-y":"auto"});
	    $(window).resize(function(){
	    	var $window=$(window);
			$("#dataGrid").setGridHeight("100%");
			$("#dataGrid").setGridWidth("100%");
		});
		$("#pageloading").hide();
	});
	
	function infoObj(id) {
		$("#dialog").dialog({
    		 height: 300,
    		 width: 670,
    		 modal: true,
    		 resizable: false,
    		 close: function( event, ui ) {
    			 $("#dialog_iframe").css("display","none");
    		 },
    		 buttons:[
    		 {
    			 text:"关闭",
    			 click:function(){
    			 	$.get("${gzUrl('readMsg.do')}?timestamp=" + Date.parse(new Date()) + "&id=" + id, null, returnBack);
    				$(this).dialog("close");
    				$("#dialog_iframe").attr("src","${gzUrl('page/blank.html')}");
    			 }
    		 }]
    	});
    	$("#dialog_iframe").css("display","block");
    	$("#dialog_iframe").attr("src","${gzUrl('msgInfo.do')}?id=" + id + "&randomNum=" + Math.random());
	}
	
	function readMsg(id){
		$.get("${gzUrl('readMsg.do')}?timestamp=" + Date.parse(new Date()) + "&id=" + id, null, returnBack);
	}
	
	function delMsg(id){
		var r = confirm("确认要删除？删除后数据无法还原。"); 
		if (r==true) { 
			$.get("${gzUrl('delMsg.do')}?timestamp=" + Date.parse(new Date()) + "&id=" + id, null, returnBack);
		}
	}
	
	function returnBack(data){
		jQuery("#dataGrid").jqGrid('setGridParam',{
        }).trigger('reloadGrid');    
    }
	
</script>
<body>
	<div id="pageloading"></div> 
	<div class="osx-container">
		<div class="osx-modal-header">
			<div class="osx-modal-icon"></div>
			<div class="osx-modal-title">您现在所在的位置：消息阅读</div>
		</div>
		<div class="osx-modal-content" id="osx-modal-content">
			<div id="form" style="padding: 5px; ">
				<form action="" method="post">
					<table border="0">
				    	<tr>
							<td colspan="3">
								<input type="button" id="readAllMsgButton" value="一键将所有消息置为已阅读" style="font-size: ;font-family: 'yakov_wryh';width: 200px;"/>
								<script>
									$("#readAllMsgButton").button().click(function( event ) {
										$.get("${gzUrl('readMsg.do')}?timestamp=" + Date.parse(new Date()) + "&id=0", null, returnBack);
									});
								</script>
							</td>
				    	</tr>
					</table>
				</form>
			</div>
			<table id="dataGrid"></table>
			<div id="pager"></div>
		</div>
	</div>
	<div id="dialog" title="消息明细" style="padding: 0px;">
		<iframe id="dialog_iframe" name="dialog_iframe" src="" frameborder="0" width="100%" height="100%" style="overflow: hidden;display: none;"></iframe>
	</div>
</body>
<#include "foot.ftl" />
