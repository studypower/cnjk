<#include "../../head.ftl" />
<script type="text/javascript">
	$(function(){
		var height=$(window).height();
		var width=$(window).width();
		$("#dataGrid").jqGrid({
	        colNames: ["导航key","导航名称","导航url","上级导航key","上级导航名称","子导航列表","状态","操作"],
	        colModel: [
	            {name: "key",width:150,sortable:false,align:"center",formatter:function(key,options,rowObject){
	            	if(rowObject['isBlanklines'] || key==null){
	            		return "";
	            	}
	            	return key;
	            }},
	            {name: "name", width:200,sortable:false,align:"center",formatter:function(key,options,rowObject){
	            	if(rowObject['isBlanklines'] || key==null){
	            		return "";
	            	}
	            	return key;
	            }},
	            {name: "url", width:200,sortable:false,align:"center",formatter:function(key,options,rowObject){
	            	if(rowObject['isBlanklines'] || key==null){
	            		return "";
	            	}
	            	return key;
	            }},
	            {name: "parent_key", width:100,sortable:false,align:"center",formatter:function(key,options,rowObject){
	            	if(rowObject['isBlanklines'] || key==null){
	            		return "";
	            	}
	            	return key;
	            }},
	            {name: "parent_name", width:100,sortable:false,align:"center",formatter:function(key,options,rowObject){
	            	if(rowObject['isBlanklines'] || key==null){
	            		return "";
	            	}
	            	return key;
	            }},
	            {name: "",width:100,sortable:false,align:"center",formatter:function(key,options,rowObject){
	                if(rowObject['isBlanklines']){
	            		return "";
	            	}
	            	var html='';
	            	if(rowObject['url']==null || rowObject['url']==""){
	            	   html += '<a href="${gzUrl('xtsz/dhsz/initList.do')}?parentKey=' + rowObject['key']+ '">子导航列表</a>';
	            	}
	            	return html;
	            }},
	            {name: "status", width:100,sortable:false,align:"center",formatter:function(key,options,rowObject){
	                if(rowObject['isBlanklines'] || key==null){
	            		return "";
	            	}
	            	if(key == 1){
	            	   	return "启用";
	            	} else{
	            		return "禁用";
	            	}
	            }},
	            {name: "",width:200,sortable:false,align:"center",formatter:function(key,options,rowObject){
	                if(rowObject['isBlanklines']){
	            		return "";
	            	}
	            	var html='';
            		html += '<a href="${gzUrl('xtsz/dhsz/initUpdate.do')}?key=' + rowObject['key'] + '" title="修改">修改</a>&nbsp;&nbsp;';
            		html += '<a href="${gzUrl('xtsz/dhsz/del.do')}?key=' + rowObject['key'] + '" title="删除">删除</a>';
                	return html;
	            }}
	        ],
	        datatype: "json", //将这里改为使用JSON数据  
	        url:'${gzUrl('xtsz/dhsz/list.do?parentKey=${parentKey?if_exists}')}', //这是Action的请求地址  
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
			caption: "导航列表"
	    });
		$("#dataGrid").navGrid("#pager",{edit:false,add:false,del:false,refresh:true,search:false});
	    $(document.body).css({"overflow-x":"auto","overflow-y":"auto"});
	    $(window).resize(function(){
	    	var $window=$(window);
			$("#dataGrid").setGridHeight("100%");
			$("#dataGrid").setGridWidth("100%");
		});
	    $("#create").button().click(function( event ) {
	    	event.preventDefault();
	    	window.location.href="${gzUrl('xtsz/dhsz/initAdd.do?parentKey=${parentKey?if_exists}')}";
	    });
		$("#pageloading").hide();
	});
</script>
</head>
<body>
	<div id="pageloading"></div> 
	<div class="osx-container">
		<div class="osx-modal-header">
			<div class="osx-modal-icon"></div>
			<div class="osx-modal-title">您现在所在的位置： 系统设置->导航设置</div>
		</div>
		<div class="osx-modal-content" id="osx-modal-content">
			<div id="form" style="padding: 5px; ">
				<form action="" method="post">
					<table border="0" width="730">
						<tr>
							<td colspan="2">
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
