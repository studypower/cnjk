<#include "../../head.ftl" />
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
		$("#zcTime").datepicker({
			dateFormat: "yy-mm-dd"
		});
		$("#birthDate").datepicker({
			dateFormat: "yy-mm-dd"
		});
		$("#enterTime").datepicker({
			dateFormat: "yy-mm-dd"
		});
		$("#startDate").datepicker({
			dateFormat: "yy-mm-dd"
		});
		$("#endDate").datepicker({
			dateFormat: "yy-mm-dd"
		});
		$("#save").button().click(function( event ) {
	    	event.preventDefault();
	    	if($("#name").val()==""){
	    	   alert("请填写姓名");
	    	   return false;
	    	}
	        if($('input:radio[name="sex"]:checked').val()==null){
	    	   alert("请选择性别");
	    	   return false;
	    	}
	    	if($("#departmentId").val()==0){
	    	   alert("请选择科室");
	    	   return false;
	    	}
	    	$("#staffInfoForm").submit();
	    });
	    $("#addCustomer").button().click(function( event ) {
	    	event.preventDefault();
	    	$("#registerDialog").dialog({
	    		 height: 300,
	    		 width: 460,
	    		 modal: true,
	    		 resizable: false,
	    		 buttons:[{
	    			 text:"保存",
	    			 click:function(){
	    				 $("#customer").css("display","none");
	    				 $(this).dialog("close");
	    				 alert("保存");
	    			 }
	    		 },{
	    			 text:"取消",
	    			 click:function(){
	    				 $(this).dialog("close");
	    			 }
	    		 }]
	    	});
	    });
	    $("#form_content select").combobox();
	    $("#clientType").combobox();
		$("#pageloading").hide();
	});

    <#if result?exists>
	     <#if result?if_exists==-1>
	          alert("修改失败,该身份证已经被登记");
	     <#elseif result?if_exists==-2> 
	          alert("修改失败,该工号已经被使用");
	     <#elseif result?if_exists==0> 
	          alert("修改失败"); 
	     </#if>             
	</#if>
</script>
</head>

<div id="pageloading"></div> 
<div class="osx-container">
	<div class="osx-modal-header">
		<div class="osx-modal-icon"></div>
		<div class="osx-modal-title">您现在所在的位置：人员管理->基本信息</div>
	</div>
	<div class="osx-modal-close" style="display: block;cursor: pointer;">
		<div class="osx-modal-icon-back">
			<div class="osx-modal-title" style="text-align: right;line-height: 13px;"><a href="javascript:history.go(-1);"><img src="${gzUrl('images/a_back.png')}" width="14" height="14" />返回</a></div>
		</div>
	</div>
	<div class="osx-modal-content" id="osx-modal-content">
		<div id="form_content">
			<div id="tabs">
			     <ul>
					<li><a href="#add" style="font-size: ;font-family: 'yakov_wryh';">修改</a></li>
				</ul>
				<div id="project" style="overflow:auto;">
					<form id="staffInfoForm" name="staffInfoForm" action="${gzUrl('/rygl/jbxx/update.do')}" method="post">
						<table border="0" width="600" style="overflow: hidden;">
						   <input type="hidden" id="id" name="id" class="text ui-widget-content ui-corner-all" value="${staffInfo.id?if_exists}"/>
							<tr>
								<td width="70">
									<label for="name" class="edit_lbl">姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名:</label>
								</td>
								<td>
									<input type="text" id="name" name="name" class="text ui-widget-content ui-corner-all"  value="${staffInfo.name?if_exists}"/>
								</td>
								<td width="70">
									<label for="sex" class="edit_lbl">性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别:</label>
								</td>
							    <td>
                                    <input type="radio" name="sex" value="1" <#if staffInfo.sex?exists && staffInfo.sex==1>checked</#if>/><span class="edit_lbl">男</span>
									<input type="radio" name="sex" value="0" <#if staffInfo.sex?exists && staffInfo.sex==0>checked</#if>/><span class="edit_lbl">女</span>
								</td>
							</tr>
							<tr>
								<td>
									<label for="idNum" class="edit_lbl">身份证号:</label>
								</td>
								<td>
									<input type="text" id="idNum" name="idNum" class="text ui-widget-content ui-corner-all" value="${staffInfo.id_num?if_exists}"/>
								</td>
							    <td>
									<label for="birthDate" class="edit_lbl">出生年月:</label>
								</td>
								<td>
									<input type="text" id="birthDate" name="birthDate" class="text ui-widget-content ui-corner-all" value="${staffInfo.birth_date?if_exists}"/>
								</td>
							</tr>
								<tr>
								   <td>
										<label for="zzmmId" class="edit_lbl">政治面貌:</label>
									</td>
								    <td>
                                        <select id="zzmmId" name="zzmmId"  class="select01">
										        <option value="0">请选择</option>
            	                                <#if dataZzmmInfoList?exists>
            	                                  <#list dataZzmmInfoList as dataZzmmInfo>
            	                                     <option value="${dataZzmmInfo.id}" <#if staffInfo.zzmm_id?exists && staffInfo.zzmm_id=dataZzmmInfo.id>selected</#if>>${dataZzmmInfo.name}</option>
            	                                  </#list>
            	                                </#if>
                                        </select>
									</td>
									
									<td>
										<label for="whcdId" class="edit_lbl">文化程度:</label>
									</td>
									<td>
									    <select id="whcdId" name="whcdId"  class="select01">
										        <option value="0">请选择</option>
            	                                <#if dataWhcdInfoList?exists>
            	                                  <#list dataWhcdInfoList as dataWhcdInfo>
            	                                     <option value="${dataWhcdInfo.id}" <#if staffInfo.whcd_id?exists && staffInfo.whcd_id=dataWhcdInfo.id>selected</#if>>${dataWhcdInfo.name}</option>
            	                                  </#list>
            	                                </#if>
                                        </select>
									</td>
								</tr>
                                <tr>
								   <td>
										<label for="zcId" class="edit_lbl">职&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;称:</label>
									</td>
								    <td>
                                        <select id="zcId" name="zcId"  class="select01">
										        <option value="0">请选择</option>
            	                                <#if dataZcInfoList?exists>
            	                                  <#list dataZcInfoList as dataZcInfo>
            	                                     <option value="${dataZcInfo.id}" <#if staffInfo.zc_id?exists && staffInfo.zc_id=dataZcInfo.id>selected</#if>>${dataZcInfo.name}</option>
            	                                  </#list>
            	                                </#if>
                                        </select>
									</td>
									
									<td>
										<label for="zcjbId" class="edit_lbl">职称级别:</label>
									</td>
									<td>
									    <select id="zcjbId" name="zcjbId"  class="select01">
										        <option value="0">请选择</option>
            	                                <#if dataZcjbInfoList?exists>
            	                                  <#list dataZcjbInfoList as dataZcjbInfo>
            	                                     <option value="${dataZcjbInfo.id}" <#if staffInfo.zcjb_id?exists && staffInfo.zcjb_id=dataZcjbInfo.id>selected</#if>>${dataZcjbInfo.name}</option>
            	                                  </#list>
            	                                </#if>
                                        </select>
									</td>
								</tr>
								<tr>
								  <td>
										<label for="mzId" class="edit_lbl">职称时间:</label>
									</td>
								    <td>
                                       <input type="text" id="zcTime" name="zcTime" class="text ui-widget-content ui-corner-all" value="${staffInfo.zc_time?if_exists}"/>
									</td>
								   <td>
										<label for="mzId" class="edit_lbl">民&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;族:</label>
									</td>
								    <td>
                                        <select id="mzId" name="mzId"  class="select01">
										        <option value="0">请选择</option>
            	                                <#if dataMzInfoList?exists>
            	                                  <#list dataMzInfoList as dataMzInfo>
            	                                     <option value="${dataMzInfo.id}" <#if staffInfo.mz_id?exists && staffInfo.mz_id=dataMzInfo.id>selected</#if>>${dataMzInfo.name}</option>
            	                                  </#list>
            	                                </#if>
                                        </select>
									</td>
								</tr>		
							<tr>
								<td>
									<label for="departmentId" class="edit_lbl">科&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;室:</label>
								</td>
								<td>
									  <select id="departmentId" name="departmentId" class="select01">
            	                                 <option value="0"></option>
            	                                <#if departmentList?exists>
            	                                  <#list departmentList as department>
                                                     <option value="${department.id}" <#if staffInfo.department_id?exists && staffInfo.department_id==department.id>selected</#if>>${department.name}</option>
                                                  </#list>
                                                </#if>
                                      </select>
								</td>
								<td>
									<label for="positionId" class="edit_lbl">职&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;位:</label>
								</td>
								<td>
									 <select class="select01" id="positionId" name="positionId">
									 	<option value="0">请选择职位</option>
								        <#if positionList?exists>
    	                                <#list positionList as position>
                                          <option value="${position.id}" <#if staffInfo.position_id?exists && staffInfo.position_id==position.id>selected</#if>>${position.name}</option>
                                        </#list>
                                        </#if>
                                     </select>
								</td>
							</tr>
							<tr>
							    <td>
									<label for="enterTime" class="edit_lbl">入职时间:</label>
								</td>
								<td>
									<input type="text" id="enterTime" name="enterTime" class="text ui-widget-content ui-corner-all" value="${staffInfo.enter_time?if_exists}"/>
								</td>
								<td>
									<label for="address" class="edit_lbl">家庭地址:</label>
								</td>
								<td>
									<input type="text" id="address" name="address" class="text ui-widget-content ui-corner-all" value="${staffInfo.address?if_exists}"/>
								</td>
							</tr>
							<tr>
								<td>
									<label for="email" class="edit_lbl">邮&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;箱:</label>
								</td>
								<td>
									<input type="text" id="email" name="email" class="text ui-widget-content ui-corner-all" value="${staffInfo.email?if_exists}"/>
								</td>
								<td>
									<label for="zipCode" class="edit_lbl">邮政编码:</label>
								</td>
								<td>
									 <input type="text" id="zipCode" name="zipCode" class="text ui-widget-content ui-corner-all" value="${staffInfo.zip_code?if_exists}"/>	
								</td>
							</tr>
							<tr>
								
								<td>
									<label for="phone" class="edit_lbl">手&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;机:</label>
								</td>
								<td>
									<input type="text" id="phone" name="phone" class="text ui-widget-content ui-corner-all" value="${staffInfo.phone?if_exists}"/>
								</td>
								<td>
									<label for="landLine" class="edit_lbl">宅&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;电:</label>
								</td>
								<td>
									<input type="text" id="landLine" name="landLine" class="text ui-widget-content ui-corner-all" value="${staffInfo.landline?if_exists}"/>
								</td>
							</tr>
							<tr>
								<td>
									<label for="workStatus" class="edit_lbl">工作状态:</label>
								</td>
								<td>
									<select id="workStatus" name="workStatus" class="select01">
    	                                <#if dataWorkStatusList?exists>
    	                                  <#list dataWorkStatusList as dataWorkStatus>
                                             <option <#if staffInfo.work_status==dataWorkStatus.id>selected</#if> value="${dataWorkStatus.id}">${dataWorkStatus.name}</option>
                                          </#list>
                                        </#if>
                                   </select>
								</td>
								<td>
									<label for="indexNum" class="edit_lbl">人事编号:</label>
								</td>
								<td>
									<input type="text" id="indexNum" name="indexNum" class="text ui-widget-content ui-corner-all" value="${staffInfo.index_num?if_exists}"/>
								</td>
							</tr>
							<tr>
								<td colspan="4">
									<input type="button" id="save" value="修改" style="font-size: ;font-family: 'yakov_wryh';width: 120px;"/>
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
<#include "../../foot.ftl" />
