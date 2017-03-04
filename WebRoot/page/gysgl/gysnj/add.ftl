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
		$("#save").button().click(function( event ) {
	    	event.preventDefault();
	    	if($("#year").val()==0){
	    	   alert("请填写年度");
	    	   return false;
	    	}
	    	$("#form1").submit();
	    });
	    $("#form_content select").combobox();
		$("#pageloading").hide();
		getYear();
	});
	
	function getYear(){
	   var now=new Date();
	   var yearSelect = document.getElementById("year");
	   var option = document.createElement("OPTION"); 
	   option.value =0;  
	   option.innerHTML =""; 
	   yearSelect.appendChild(option); 
	   for(var i=0;i<3;i++){
         var option = document.createElement("OPTION"); 
         if(i==0){
	       option.value =now.getFullYear()-1;  
	       option.innerHTML =now.getFullYear()-1; 
	     }else if(i==1){
	       option.value =now.getFullYear();  
	       option.innerHTML=now.getFullYear();
	     }else if(i==2){  
	       option.value =now.getFullYear()+1;  
	       option.innerHTML = now.getFullYear()+1; 
	     }  
	     yearSelect.appendChild(option); 
	   }  
	 }
</script>
<body>
<div id="pageloading"></div> 
	<div class="osx-container">
		<div class="osx-modal-header">
			<div class="osx-modal-icon"></div>
			<div class="osx-modal-title">您现在所在的位置：供应商管理->供应商年度评审记录</div>
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
						<li><a href="#add" style="font-size: ;font-family: 'yakov_wryh';">增加</a></li>
					</ul>
					<div id="project" style="overflow:auto;">
						<form id="form1" name="form1" action="${gzUrl('gysgl/gysnj/add.do')}" method="post">
							<table border="0" width="700" style="overflow: hidden;">
								<tr>
								    <td>
										供应商名称:
                                        <select id="supplierId" name="supplierId" class="select01">
        	                                <#if supplierInfoList?exists>
        	                                  <#list supplierInfoList as supplierInfo>
        	                                  	 <#if supplierId?exists && supplierId!=0>
        	                                  	 	<#if supplierId==supplierInfo.id>
                                                 		<option value="${supplierInfo.id}">${supplierInfo.name}</option>
                                                 	</#if>
                                                 <#else>
                                                 	<option value="${supplierInfo.id}">${supplierInfo.name}</option>
                                                 </#if>
                                              </#list>
                                            </#if>
                                       	</select>
									</td>
								</tr>
									<tr>
								    <td>
										年&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;度:
                                        <select id="year" name="year" class="select01">
                                       	</select>
									</td>
								</tr>
								<tr>
									<td>
										价&nbsp;格&nbsp;等&nbsp;级:
									  	<select id="priceLevel" name="priceLevel" class="select01">
        	                            	<option value="1">优秀</option>
        	                            	<option value="2">合格</option>
        	                            	<option value="3">不合格</option>
                                       	</select>
									</td>
								</tr>
								<tr>
									<td>
										品&nbsp;质&nbsp;等&nbsp;级:
									  	<select id="qualityLevel" name="qualityLevel" class="select01">
        	                            	<option value="1">优秀</option>
        	                            	<option value="2">合格</option>
        	                            	<option value="3">不合格</option>
                                       	</select>
									</td>
								</tr>
								<tr>
									<td>
										服&nbsp;务&nbsp;等&nbsp;级:
									  	<select id="serviceLevel" name="serviceLevel" class="select01">
        	                            	<option value="1">优秀</option>
        	                            	<option value="2">合格</option>
        	                            	<option value="3">不合格</option>
                                       	</select>
									</td>
								</tr>
								<tr>
									<td>
										综&nbsp;合&nbsp;等&nbsp;级:
									  	<select id="complexLevel" name="complexLevel" class="select01">
        	                            	<option value="1">优秀</option>
        	                            	<option value="2">合格</option>
        	                            	<option value="3">不合格</option>
                                       	</select>
									</td>
								</tr>
								<tr>
									<td valign="top">
										评&nbsp;审&nbsp;备&nbsp;注:
										<textarea class="text ui-widget-content ui-corner-all" name="remark" id="remark" style="width: 494px;"></textarea>
									</td>
								</tr>
								<tr>
									<td>
										<input type="button" id="save" value="保存" style="font-size: ;font-family: 'yakov_wryh';width: 120px;"/>
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
