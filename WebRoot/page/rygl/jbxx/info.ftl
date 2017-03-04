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
	    $("#form_content select").combobox();
	    $("#clientType").combobox();
		$("#pageloading").hide();
	});
	
</script>
<body>
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
					<li><a href="#add" style="font-size: ;font-family: 'yakov_wryh';">详情</a></li>
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
                                         <input type="text"  class="text ui-widget-content ui-corner-all" value="${staffInfo.zzmmName?if_exists}"/>
									</td>
									
									<td>
										<label for="whcdId" class="edit_lbl">文化程度:</label>
									</td>
									<td>
									     <input type="text"  class="text ui-widget-content ui-corner-all" value="${staffInfo.whcdName?if_exists}"/>
									</td>
								</tr>
                                <tr>
								   <td>
										<label for="zcId" class="edit_lbl">职&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;称:</label>
									</td>
								    <td>
                                        <input type="text"  class="text ui-widget-content ui-corner-all" value="${staffInfo.zcName?if_exists}"/>
									</td>
									
									<td>
										<label for="zcjbId" class="edit_lbl">职称级别:</label>
									</td>
									<td>
									    <input type="text"  class="text ui-widget-content ui-corner-all" value="${staffInfo.zcjbName?if_exists}"/>
									</td>
								</tr>
								<tr>
								     <td>
										<label for="mzId" class="edit_lbl">职称时间:</label>
									</td>
								    <td>
                                       <input type="text"  class="text ui-widget-content ui-corner-all" value="${staffInfo.zc_time?if_exists}"/>
									</td>
								   <td>
										<label for="mzId" class="edit_lbl">名&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;族:</label>
									</td>
								    <td>
                                       <input type="text"  class="text ui-widget-content ui-corner-all" value="${staffInfo.mzName?if_exists}"/>
									</td>
								</tr>		
							<tr>
								<td>
									<label for="departmentId" class="edit_lbl">科&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;室:</label>
								</td>
								<td>
	                                <#if departmentList?exists>
	                                  	<#list departmentList as department>
                                         	<#if staffInfo.department_id?exists && staffInfo.department_id==department.id>
                                         		<input type="text" id="" name="" class="text ui-widget-content ui-corner-all" value="${department.name}"/>
                                         	</#if>
                                      	</#list>
                                    </#if>
								</td>
								<td>
									<label for="positionId" class="edit_lbl">职&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;位:</label>
								</td>
								<td>
							        <#if positionList?exists>
	                                	<#list positionList as position>
                                      		<#if staffInfo.position_id?exists && staffInfo.position_id==position.id>
                                      			<input type="text" id="" name="" class="text ui-widget-content ui-corner-all" value="${position.name}"/>
                                      		</#if>
                                    	</#list>
                                    </#if>
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
    	                            <#if dataWorkStatusList?exists>
    	                            	<#list dataWorkStatusList as dataWorkStatus>
                                        	<#if staffInfo.work_status==dataWorkStatus.id>
                                            	<input type="text" id="" name="" class="text ui-widget-content ui-corner-all" value="${dataWorkStatus.name}"/>
                                            </#if>
                                        </#list>
                                    </#if>
								</td>
								<td>
									<label for="indexNum" class="edit_lbl">人事编号:</label>
								</td>
								<td>
									<input type="text" id="indexNum" name="indexNum" class="text ui-widget-content ui-corner-all" value="${staffInfo.index_num?if_exists}"/>
								</td>
							</tr>
						</table>
						<input type="button" id="goBackButton" value="返&nbsp;&nbsp;回" style="font-size: ;font-family: 'yakov_wryh';width: 100px;"/>
						<script>
						$("#goBackButton").button().click(function( event ) {
							history.go(-1);
						});
						</script>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
<#include "../../foot.ftl" />
