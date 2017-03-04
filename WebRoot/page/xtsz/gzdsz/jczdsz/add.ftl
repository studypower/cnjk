<#include "../../../head.ftl" />
<script type="text/javascript">
	$(function(){
		$("#tabs" ).tabs();
		$("#tabs").height($(window).height()-35);
		$("#tabs > div").height($(window).height()-102);
		$(window).resize(function(){
			var height=$(window).height();
			$("#tabs").height(height-35);
			$("#tabs > div").height(height-102);
		});
		$("#saveBtn").button().click(function( event ) {
	    	event.preventDefault(); 
	    	 var reg =/^[a-zA-Z][a-zA-Z0-9_]*[a-zA-Z0-9]*$/; 
	         if($("#name").val()==""){
			     alert("请填写字段名称");
			     return false;
			 }
			 if($("#columnName").val()==""){
			     alert("请填写字段别名");
			     return false;
			 }
			 if(!reg.test($("#columnName").val())){
			     alert("别名开头必须为字母，中间可包含字母.数字跟'_',结尾必须是字母或数字");
			     return false;
			 }
			  if($("#columnType").val()==""){
			        alert("请选择字段类型");
			        return false;
			 }
			 if($('input:radio[name="columnRequired"]:checked').val()==1){
			     if($("#columnDefault").val()==""){
			        alert("请填默认值");
			        return false;
			    }
			 }
			 if($("#indexNum").val()==""){
			      alert("请填写显示顺序");
			      return false;
			 }
			 if(isNaN($("#indexNum").val())){
			      alert("显示顺序必须为数字");
			      return false;
			 }
			 if($("#indexNum").val()<=10 || $("#indexNum").val()>=100){
			      alert("显示顺序必须大于10并且小于100");
			      return false;
			 }
	    	$("#form1").submit();
	    });
	    
	    $("#columnType").combobox({
		});
	    $("#pageloading").hide();
	    checkDisPlay();
	});
	
	
	function checkDisPlay(){
	   	 if($('input:radio[name="columnRequired"]:checked').val()==0){
			  document.getElementById('td1').style.display = "none";
			  document.getElementById('td2').style.display = "none";
	      }else if($('input:radio[name="columnRequired"]:checked').val()==1){
	          document.getElementById('td1').style.display = "";
			  document.getElementById('td2').style.display = "";
	      }
	}
</script>
<body>
	<div id="pageloading"></div> 
	<div class="osx-container">
		<div class="osx-modal-header">
			<div class="osx-modal-icon"></div>
			<div class="osx-modal-title">您现在所在的位置：系统设置->工资单设置->-基础字段设置</div>
		</div>
		<div class="osx-modal-close" style="display: block;cursor: pointer;">
			<div class="osx-modal-icon-back">
				<div class="osx-modal-title" style="text-align: right;line-height: 13px;">
				  <a href="javascript:history.go(-1);"><img src="${gzUrl('images/a_back.png')}" width="14" height="14" />返回</a>
				</div>  
			</div>
		</div>
		<div class="osx-modal-content" id="osx-modal-content">
			<div id="form_content">
				<div id="tabs">
					<ul>
						<li><a href="#main_content" style="font-size: ;font-family: 'yakov_wryh';">增加</a></li>
					</ul>
					<div id="main_content" style="overflow:auto;">
						<form id="form1" name="form1" action="${gzUrl('xtsz/gzdsz/jczdsz/add.do')}" method="post">
							<table border="0" width="800" style="overflow: hidden;">
								<tr>
									<td width="70px">
										<label for="name" style="font-size: 16px;font-family: 'yakov_wryh';">字段名称:</label>
									</td>
									<td>
										<input type="text" id="name" name="name" class="text ui-widget-content ui-corner-all"/>
									</td>
									<td width="70px">
										<label for="projectSourceId" style="font-size: 16px;font-family: 'yakov_wryh';">字段别名:</label>
									</td>
									<td>
										<input type="text" id="columnName" name="columnName" class="text ui-widget-content ui-corner-all"/>
									</td>
								</tr>
								<tr>
									<td>
										<label for="columnType" style="font-size: 16px;font-family: 'yakov_wryh';">字段类型:</label>
									</td>
									<td colspan="3">
						                <select id="columnType" name="columnType" class="select01">
				                    		<#list dataColumnInfoList as dataColumnInfo>
				                    			<option value="${dataColumnInfo.get('value')}">${dataColumnInfo.name}</option>
				                    		</#list>
				                       	</select> 
									</td>
								</tr>
								<tr>
									<td>
										<label for="columnRequired" style="font-size: 16px;font-family: 'yakov_wryh';">可否为空:</label>
									</td>
									<td>
										<input type="radio"  name="columnRequired" value="0" onClick="checkDisPlay()" checked/><span style="font-size: 16px;font-family: 'yakov_wryh';">是</span>
										<input type="radio"  name="columnRequired" value="1" onClick="checkDisPlay()" /><span style="font-size: 16px;font-family: 'yakov_wryh';">否</span>
									</td>
									<td id="td1">
										<label for="columnDefault" style="font-size: 16px;font-family: 'yakov_wryh';">默认值:</label>
									</td>
									<td id="td2">
										<input type="text" id="columnDefault" name="columnDefault" class="text ui-widget-content ui-corner-all"/>
									</td>
								</tr>
								<tr>
									<td>
										<label for="indexNum" style="font-size: 16px;font-family: 'yakov_wryh';">显示顺序:</label>
									</td>
									<td colspan="3">
										<input type="text" id="indexNum" name="indexNum" class="text ui-widget-content ui-corner-all" value="20"/>
									</td>
								</tr>
								<tr>
									<td>
										<label for="remark" style="font-size: 16px;font-family: 'yakov_wryh';">字段描述:</label>
									</td>
									<td colspan="3">
										<textarea class="text ui-widget-content ui-corner-all" name="remark" id="remark" style="width: 494px;"></textarea>
									</td>
								</tr>
								<tr>
									<td colspan="4">
										<input type="button" id="saveBtn" value="保存" style="font-size: ;font-family: 'yakov_wryh';width: 120px;"/>
									</td>
								</tr>
							</table>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<#include "../../../foot.ftl" />
