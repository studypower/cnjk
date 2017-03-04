<#include "../../head.ftl" />
		<script type="text/javascript">
		
			var departmentInfos = "";
			
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
				$("#pageloading").hide();
				$("#trainTime").datepicker({
			      dateFormat: "yy-mm-dd"
		        });
				$("#save").button().click(function( event ) {
			    	event.preventDefault();
			    	$("#form1").submit();
			    });
			    $("#addJoinDepartmentId").button().click(function( event ) {
			    	if($("#departmentId").val()!=0){
			    		event.preventDefault();
			    		var departmentIds = $("#departmentIds").val();
			    		var departmentNames = $("#departmentNames").val();
				    	var departmentIdsDivHTML = $("#departmentIdsDiv").html();
				    	var departmentInfoArray = departmentInfos.split('|');
				    	var departmentName = $("#departmentId").find("option:selected").text();
				    	var departmentId = $("#departmentId").val();
				    	var departmentInfo = departmentId+ "," + departmentName;
				    	if(departmentInfos != ""){
				    		departmentInfos += "|";
				    	}
				    	if(departmentIds != ""){
				    		departmentIds += ",";
				    	}
				    	if(departmentNames != ""){
				    		departmentNames += ",";
				    	}
				    	departmentInfos += departmentInfo;
				    	departmentIds += departmentId;
				    	departmentNames +=departmentName;
				    	if(departmentIdsDivHTML!=""){
				    		departmentIdsDivHTML += "&nbsp;&nbsp;&nbsp;&nbsp;";
				    	}
				    	departmentIdsDivHTML += "<input type='checkbox' value='"+departmentId+"' onChange='removeJoinStaffId(\""+departmentInfo+"\")' checked><span style='font-size: 16px;font-family: \"微软雅黑\";'>" + departmentName+"</span>";
				    	$("#departmentIdsDiv").html(departmentIdsDivHTML);
				    	$("#departmentIds").val(departmentIds);
				    	$("#departmentNames").val(departmentNames);
				    	$("#departmentId option[value='"+departmentId+"']").remove();
			    	}
			    });
				checkTest();	
			});
		
			function removeJoinStaffId(departmentInfo){
				var departmentArray = departmentInfos.split('|');
				departmentInfos = "";
				var departmentIds = "";
				var departmentNames = "";
				var departmentIdsDivHTML = "";
				for(var departmentInfoIndex in departmentArray){
					if(departmentArray[departmentInfoIndex]!=departmentInfo){
						if(departmentInfos != ""){
				    		departmentInfos += "|";
				    	}
				    	if(departmentIds != ""){
				    		departmentIds+= ",";
				    	}
				    	if(departmentNames != ""){
				    		departmentNames+= ",";
				    	}
				    	departmentInfos += departmentArray[departmentInfoIndex];
				    	departmentIds += departmentArray[departmentInfoIndex].split(",")[0];
				    	departmentNames += departmentArray[departmentInfoIndex].split(",")[1];
					}
				}
				departmentArray = departmentInfos.split('|');
				for(var departmentInfoIndex in departmentArray){
					if(departmentArray[departmentInfoIndex]!=""){
						var departmentId = departmentArray[departmentInfoIndex].split(",")[0];
						var departmentName = departmentArray[departmentInfoIndex].split(",")[1];
						if(departmentIdsDivHTML!=""){
				    		departmentIdsDivHTML += "&nbsp;&nbsp;&nbsp;&nbsp;";
				    	}
						departmentIdsDivHTML += "<input type='checkbox' value='"+departmentId+"' onChange='removeJoinStaffId(\""+ departmentArray[departmentInfoIndex]+"\")' checked><span style='font-size: 16px;font-family: \"微软雅黑\";'>" + departmentName+"</span>";
					}
				}
				$("#departmentIdsDiv").html(departmentIdsDivHTML);
				$("#departmentIds").val(departmentIds);
				$("#departmentNames").val(departmentNames);
				$("#departmentId").append("<option value='"+departmentInfo.split(",")[0]+"'>"+departmentInfo.split(",")[1]+"</option>");
			}
			
			var test=new Array();
			<#if chargeRange.departmentList?exists>
			   <#list chargeRange.departmentList as department>
			       test.push({"id":${department.id?if_exists},"name":"${department.name?if_exists}"});
			   </#list>
			</#if>
			function checkTest(){		
				      var departmentIdsDivHTML = $("#departmentIdsDiv").html();
				      for(var index in test){
				        if(test[index]!=""){
				    	    var departmentName = test[index].name;
				    	    var departmentId = test[index].id;
				    	    var departmentInfo = departmentId+ "," + departmentName;
				    	    if(departmentInfos != ""){
				    		   departmentInfos += "|";
				    	    }
				    	    if(departmentIds != ""){
				    		   departmentIds += ",";
				    	    }
				    	    if(departmentNames != ""){
				    		   departmentNames += ",";
				    	    }
				    	   departmentInfos += departmentInfo;
				    	   departmentIds += departmentId;
				    	   departmentNames +=departmentName;
				    	   if(departmentIdsDivHTML!=""){
				    		  departmentIdsDivHTML += "&nbsp;&nbsp;&nbsp;&nbsp;";
				    	   }
				    	  departmentIdsDivHTML += "<input type='checkbox' value='"+departmentId+"'  checked disabled><span style='font-size: 16px;font-family: \"微软雅黑\";'>" + departmentName+"</span>";
				    	  $("#departmentIdsDiv").html(departmentIdsDivHTML);
				    	} 
				     }	
			}
		</script>
	</head>
	<body>
		<div id="pageloading"></div> 
		<div class="osx-container">
			<div class="osx-modal-header">
				<div class="osx-modal-icon"></div>
				<div class="osx-modal-title">您现在所在的位置：人员管理->分管范围</div>
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
							<li><a href="#add" style="font-size: ;font-family: 'yakov_wryh';">详情</a></li>
						</ul>
						<div id="add" style="overflow:auto;">
								<table border="0" width="600" style="overflow: hidden;">
									<tr>
										<td width="90px">
											<label for="staffId" class="edit_lbl">人员:</label>
										</td>
										<td colspan="3">
											<input type="text" class="text ui-widget-content ui-corner-all" value="${chargeRange.staffName?if_exists}" readOnly/>
										</td>
									</tr>
									<tr>
										<td>
											<label for="departmentIdsDiv" class="edit_lbl">已分配科室:</label>
										</td>
										<td colspan="3">
											<input type="hidden" id="departmentIds" name="departmentIds"/>
											<input type="hidden" id="departmentNames" name="departmentNames"/>
				                        	<div id="departmentIdsDiv" name="departmentIdsDiv"></div>
										</td>
									</tr>
								</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>
