<#include "base_lib.ftl" />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>${SYSTEM_NAME?if_exists}——OA</title>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<link href="${gzUrl('script/ligerUI/skins/Aqua/css/ligerui-all.css')}" rel="stylesheet" type="text/css" />
		<link href="${gzUrl('css/css.css')}" rel="stylesheet" type="text/css" />
		<link href="${gzUrl('css/topcss.css')}" rel="stylesheet" type="text/css" />
		<link href="${gzUrl('css/dtree.css')}" rel="stylesheet" type="text/css" />
		<link href="${gzUrl('css/accordion.css')}" rel="stylesheet" type="text/css" />
		<script src="${gzUrl('script/jquery-1.9.1.js')}" type="text/javascript"></script>
		<script src="${gzUrl('script/ligerUI/js/core/base.js')}" type="text/javascript"></script> 
    	<script src="${gzUrl('script/ligerUI/js/plugins/ligerLayout.js')}" type="text/javascript"></script>
    	<script src="${gzUrl('script/ligerUI/js/plugins/ligerTab.js')}" type="text/javascript"></script>
    	<script src="${gzUrl('script/ligerUI/js/plugins/ligerTree.js')}" type="text/javascript"></script>
    	<script src="${gzUrl('script/accordion.js')}" type="text/javascript"></script>
	</head>
	<body style="padding:0px;background:#EAEEF5;">
		<div class="main_div" id="main">
			<div class="TopParentDiv" position="top">
				<!--                 菜单区域                                         start     -->
				<div id="top">
						<table class="logo">
							<tr>
								<td>
									<p>
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${SYSTEM_NAME?if_exists}——OA
									</p>  
								</td>
								<td class="info">
									<br/>
									<a href="#">
										<img src="${gzUrl('images/department.jpg')}"/> 
											<#if Session.currentUser.departmentName?exists>
												${Session.currentUser.departmentName?if_exists}
											<#else>
												部门（缺失）
											</#if>
									</a>&nbsp;|&nbsp;
									<a href="#">
										<img src="${gzUrl('images/role.jpg')}"/> 
										${Session.currentUser.staffName?if_exists}
									</a> &nbsp;|&nbsp;
									<a href="${gzUrl('initMsgList.do')}" target="content">
										未读消息（<label id="msgNum"></label>）
									</a> &nbsp;|&nbsp;
									<a href="${gzUrl('xtsz/yhgl/initUpdatePwd.do')}" target="content">
										修改密码
									</a> &nbsp;|&nbsp;
									<a href="${gzUrl('logOut.do')}">
										<img src="${gzUrl('images/close.gif')}"/> 
										退出
									</a>
								</td>
							</tr>
						 </table>
						 <div id="leftlogo">
	     					<ul id="menu">
     							<!--  首页    -->
        						<li onclick="menuChange(this,'welcome','0')" id="topMenu_welcome" name="topMenu_welcome" class="current" >
        							<a href="${gzUrl('oagl/index/index.do')}" target="content">首页</a>
        						</li>
	        				 	
	     					  	<#if isDisplay('1')>
	     					  		<!--  车辆申请    -->
	     							<li onclick="menuChange(this,'clgl','1')" id="topMenu_clgl" name="topMenu_clgl">
	     								<a href="${gzUrl('clgl/ycsq/initCalendar.do')}" target="content">车辆申请</a>
	     							</li>
	     				      	</#if>
	     				      	
	     				      	<#if isDisplay('8')>
	     				      	    <!--  会议室申请    -->
	     				      		<li onclick="menuChange(this,'hysgl','1')" id="topMenu_hysgl" name="topMenu_hysgl">
	     				      			<a href="${gzUrl('hysgl/sq/initCalendar.do')}" target="content">会议室申请</a>
	     				      		</li>
	     				      	</#if>
	     				      	
	     				      	<#if isDisplay('2')>
	     				      		<!-- 经费管理  -->
        							<li onclick="menuChange(this,'jfgl','1')" id="topMenu_jfgl" name="topMenu_jfgl">
        								<a href="${gzUrl('jfgl/initList.do?step=0')}" target="content">经费管理</a>
        							</li>
        				  		</#if>
        				  		
        				  		<#if isDisplay('3')>
        				  			<!--  物品采购      -->
    								<li onclick="menuChange(this,'wpcg','1')" id="topMenu_wpcg" name="topMenu_wpcg">
    									<a href="${gzUrl('page/blank.html')}" target="content">物品采购</a>
    								</li>
    					   		</#if>
    					   		
    					   		<#if isDisplay('4')>
    					   			<!-- 供应商管理   -->	
        							<li onclick="menuChange(this,'gysgl','1')" id="topMenu_gysgl" name="topMenu_gysgl">
        								<a href="${gzUrl('gysgl/gysxx/initList.do')}" target="content">供应商管理</a>
        							</li>
        				  		</#if>
        				  		
        				  		<#if isDisplay('5')>
        				  			<!-- 固定资产管理 -->
        							<li onclick="menuChange(this,'gdzcgl','1')" id="topMenu_gdzcgl" name="topMenu_gdzcgl">
        								<a href="${gzUrl('gdzcgl/zcxx/initList.do')}" target="content">固定资产管理</a>
        							</li>
        				 		</#if>
        				 		
        				 		<#if isDisplay('6')>
        				 			<!-- 电子工资单 -->
        							<li onclick="menuChange(this,'dzgzd','1')" id="topMenu_dzgzd" name="topMenu_dzgzd">
        								<a href="${gzUrl('dzgzd/wdgzd/initList.do')}" target="content">电子工资单</a>
        							</li>
        				  		</#if>
        				  		
        				  		<#if isDisplay('7')>
        				  			<!-- 人员管理 -->
        							<li onclick="menuChange(this,'rygl','1')" id="topMenu_rygl" name="topMenu_rygl">
        								<a href="${gzUrl('rygl/jbxx/initList.do')}" target="content">人员管理</a>
        							</li>
        				 		</#if>	
        				 		<#if isDisplay('10')>
        				 			<!-- 考勤管理 -->
        							<li onclick="menuChange(this,'kqgl','1')" id="topMenu_kqgl" name="topMenu_kqgl">
        								<a href="about:_blank" id="kqgl_menu1" target="content">考勤管理</a>
        							</li>
        						</#if>
        				 		<#if isDisplay('11')>
        				 			<!-- 值班管理 -->
        							<li onclick="menuChange(this,'zbgl','1')" id="topMenu_zbgl" name="topMenu_zbgl">
        								<a href="${gzUrl('oagl/zhcx/initZbList.do')}" target="content">值班管理</a>
        							</li>
        				 		</#if>
        				 		
        				 		<#if isDisplay('12')>
        				 			<!-- 通知公告 -->
        							<li onclick="menuChange(this,'tzgg','1')" id="topMenu_tzgg" name="topMenu_tzgg">
        								<a href="${gzUrl('oagl/tzgg/initList.do')}" target="content">通知公告</a>
        							</li>
        				 		</#if>
        				 		<#if Session.currentUser.grade==1>
        				 			<!-- 系统设置 -->
            						<li onclick="menuChange(this,'xtsz','1')" id="topMenu1" name="topMenu1">
            							<a href="${gzUrl('xtsz/yhgl/initList.do')}" target="content">系统设置</a>
            						</li>
            					</#if>
	        				</ul>
	    				 </div>  
				     </div>
			    </div>
			    <!--                 菜单区域                                         end     -->
			    <!--                 清除浮动DIV            start    -->
				<div class="clear_both_div"></div>
				<!--                 清除浮动DIV            end    -->
				
				<!--                 Left Menu 左侧菜单              start              -->
				<div style="overflow:hidden;">
					　<div id="navigation" class="navigationDiv">
							    <!--  车辆管理子菜单  start  -->
								<div id="clgl" class="secondMenuDiv hideDiv">
	  								<ul class="nav">
	  								 <#if isDisplay('1_1')>
	  									<li>
	  										<a href="javascript:void(0);" onclick="javascript:showSubMenu('applyCarUl');">用车申请</a>
	  										<ul id="applyCarUl">
	  										 	<#if isDisplay('1_1_2')>
											 	<li>
											     	<a href="${gzUrl('clgl/ycsq/initCalendar.do')}" target="content">点击发起申请</a>
											 	</li>
											 	</#if>
											  	<li>
											     	<a href="${gzUrl('clgl/ycsq/initList.do')}" target="content">用车申请记录</a>
											 	</li>
									      	</ul>
	  									</li>
	  								 </#if>	
	  								</ul>
	  								<ul class="nav">
	  								  <#if isDisplay('1_2_1')>
	  									<li><a href="${gzUrl('clgl/clxx/initList.do')}" target="content">车辆管理</a></li>
	  								   </#if>	
	  								</ul>
	  							</div>
	  							<!--  车辆管理子菜单  end  -->
	  							
	  							<!--  会议室管理子菜单    start  -->
	  							<div id="hysgl" class="secondMenuDiv hideDiv">
  							 		<#if isDisplay('8_1')>
  										<ul class="nav">
  											<li>
  												<a href="javascript:void(0);" onclick="javascript:showSubMenu('applyMeetingUl');">会议室申请</a>
  												<ul id="applyMeetingUl">
  													<#if isDisplay('8_1_2')>
											 			<li>
											     			<a href="${gzUrl('hysgl/sq/initCalendar.do')}" target="content">点击发起申请</a>
											 			</li>
										 			</#if>
										  			<li>
										     			<a href="${gzUrl('hysgl/sq/initList.do')}" target="content">会议室申请记录</a>
										 			</li>
								      			</ul>
  											</li>
  										</ul>
  									</#if>
  									<#if isDisplay('8_2')>
  										<ul class="nav">
  											<li>
  												<a href="${gzUrl('hysgl/xxwh/initList.do')}" target="content">会议室管理</a>
  											</li>
  										</ul>
  									</#if>
  									<#if isDisplay('8_3')>
  										<ul class="nav">
  								    		<li>
  												<a href="javscript:void(0);" onclick="javascript:showSubMenu('dictionarySettingUl3');">数据字典设置</a>
  												<ul id="dictionarySettingUl3">
													<li>
														<a href="${gzUrl('xtsz/sjzd/hyssj/initList.do')}" target="content">
															会议室实用时间设置
														</a>
													</li>
													<li>
														<a href="${gzUrl('xtsz/sjzd/hyssb/initList.do')}" target="content">
															会议室设备设置
														</a>
													</li>
												</ul>
  											</li>	
  							    		</ul>
  							    	</#if>
  								</div>
  								<!--  会议室管理子菜单    end  -->
  								
  								<!--  经费管理                 start -->
  								<div id="jfgl" class="secondMenuDiv hideDiv">
									<ul class="nav">
										<#if isDisplay('2_7')>
  											<li><a href="${gzUrl('jfgl/initSearch.do')}" target="content">查询统计</a></li>
  										</#if>
		  								<#if isDisplay('2_1_1')>
		  									<li><a href="${gzUrl('jfgl/initList.do?step=0')}" target="content">经费申请</a></li>
		  								</#if>
		  								<#if isDisplay('2_2_1')>
		  									<li><a href="${gzUrl('jfgl/initList.do?step=1')}" target="content">科室审批</a></li>
		  								</#if>
		  								<#if isDisplay('2_9_1')>
		  									<li><a href="${gzUrl('jfgl/initList.do?step=2')}" target="content">质管科审批</a></li>
		  								</#if>
		  								<#if isDisplay('2_3_1')>
		  									<li><a href="${gzUrl('jfgl/initList.do?step=3')}" target="content">财务审批</a></li>
		  								</#if>
		  								<#if isDisplay('2_4_1')>
		  									<li><a href="${gzUrl('jfgl/initList.do?step=4')}" target="content">分管审批</a></li>
		  								</#if>
		  								<#if isDisplay('2_5_1')>
		  									<li><a href="${gzUrl('jfgl/initList.do?step=5')}" target="content">中心主任审批</a></li>
		  							    </#if>
		  								<#if isDisplay('2_6_1')>
		  									<li><a href="${gzUrl('jfgl/initList.do?step=6')}" target="content">"三重一大"审批</a></li>
		  								</#if>
		  								<#if isDisplay('2_8')>
											<li>
												<a href="javascript:void(0);" onclick="javascript:showSubMenu('dictionarySettingUl2');">数据字典设置</a>
												<ul id="dictionarySettingUl2">
													<li>
														<a href="${gzUrl('xtsz/sjzd/jflb/initList.do')}" target="content">
															经费类别设置
														</a>
													</li>
													<li>
														<a href="${gzUrl('xtsz/sjzd/jfdmc/initList.do')}" target="content">
															经费单名称设置
														</a>
													</li>
												</ul>
											</li>
										</#if>
  									</ul>
  								</div>
  								<!--  经费管理                 end -->
  								
  								<!--  物品采购                 start -->
  								<div id="wpcg" class="secondMenuDiv hideDiv">
	  								<ul class="nav">
	  								   <#if isDisplay('3_1_1')>	
									 		<li>
									 			<a href="${gzUrl('wpcg/initList.do?step=-1&fundsApplyId=-100')}" target="content">采购查询</a>
									 		</li>
									   </#if>
									   <#if isDisplay('3_7_1')>	
									 		<li>
									 			<a href="${gzUrl('wpcg/initList.do?step=-2&fundsApplyId=-100')}" target="content">部门查询</a>
									 		</li>
									   </#if>
									   <#if isDisplay('3_2_1')>		
	  										<li>
	  											<a href="${gzUrl('wpcg/initfundsApplyInfoList.do')}" target="content">采购登记</a>
	  										</li>
	  								   </#if>
									   	<#if isDisplay('3_3_1')>		
									  		<li>
									  			<a href="${gzUrl('wpcg/initList.do?step=1&fundsApplyId=-100&type=0')}" target="content">科室采购</a>
									  		</li>
									  	</#if>
									  	<#if isDisplay('3_4_1')>
									  		<li>
									  			<a href="${gzUrl('wpcg/initList.do?step=1&fundsApplyId=-100&type=2')}" target="content">政府采购</a>
									  		</li>
									  	</#if>
									  	<#if isDisplay('3_5_1')>
									  		<li>
									  			<a href="${gzUrl('wpcg/initList.do?step=1&fundsApplyId=-100&type=3')}" target="content">集中采购</a>
									  		</li>
									  	</#if>
									   <#if isDisplay('3_6_1')>		
									 		<li>
									 			<a href="${gzUrl('wpcg/initList.do?step=2&fundsApplyId=-100')}" target="content">比价审核</a>
									 		</li>
									   </#if>
									   <#if isDisplay('3_8_1')>		
									 		<li>
									 			<a href="${gzUrl('wpcg/initList.do?step=5&fundsApplyId=-100')}" target="content">资产验收</a>
									 		</li>
									    </#if>
	  								</ul>
  								</div>
  								<!--  物品采购                 end   -->
  								
  								<!--  供应商管理            start -->
  								<div id="gysgl" class="secondMenuDiv hideDiv">
	  								<ul class="nav">
	  								  <#if isDisplay('4_1_1')>
	  										<li>
	  											<a href="${gzUrl('gysgl/gysxx/initList.do')}" target="content">供应商信息</a>
	  										</li>
	  								  </#if>
	  								  <#if isDisplay('4_2_1')>
	  										<li>
	  											<a href="${gzUrl('gysgl/gyscgcx/initListByOrder.do')}" target="content">供应商物品采购查询</a>
	  										</li>
	  								  </#if>
	  								  <#if isDisplay('4_3_1')>	
	  										<li>
	  											<a href="${gzUrl('gysgl/gysnj/initList.do')}" target="content">供应商年度评审记录</a>
	  										</li>
	  								  </#if>
	  								  <#if isDisplay('4_4')>
	  								  	<li>
	  										<a href="javascript:void(0);" onclick="javascript:showSubMenu('dictionarySettingUl0');">数据字典设置</a>
	  										<ul id="dictionarySettingUl0">
												<li>
													<a href="${gzUrl('xtsz/sjzd/gyslb/initList.do')}" target="content">
														供应商类别设置
													</a>
												</li>
												<li>
													<a href="${gzUrl('xtsz/sjzd/gyszslb/initList.do')}" target="content">
														供应商证书类别设置
													</a>
												</li>
											</ul>
	  									</li>
	  									</#if>
	  								</ul>
  								</div>
  								<!--  供应商管理            end   -->
  								
  								<!--  固定资产管理       start  -->
  								<div id="gdzcgl" class="secondMenuDiv hideDiv">
	  								<ul class="nav">
	  									<#if isDisplay('3_9_1')>	
									 	 	<li>
									 	 		<a href="${gzUrl('wpcg/initList.do?step=6&fundsApplyId=-100')}" target="content">资产入库</a>
									 	 	</li>
									 	</#if>
	  								  	<#if isDisplay('5_1_1')>
	  										<li>
	  											<a href="${gzUrl('gdzcgl/zcxx/initList.do')}" target="content">资产信息</a>
	  										</li>
	  								  	</#if>	
	  									<#if isDisplay('5_2')>
											<li>
		  										<a href="javascript:void(0);" onclick="javascript:showSubMenu('dictionarySettingUl1');">数据字典设置</a>
		  										<ul id="dictionarySettingUl1">
													<li>
														<a href="${gzUrl('xtsz/sjzd/sydd/initList.do')}" target="content">
															使用地点设置
														</a>
													</li>
													<li>
														<a href="${gzUrl('xtsz/sjzd/sblb/initList.do')}" target="content">
															设备类别设置
														</a>
													</li>
												</ul>
		  									</li>
	  									</#if>
	  								</ul>
  								</div>
  								<!--  固定资产管理       end    -->
  								
  								<!--  电子工资单            start  -->
  								<div id="dzgzd" class="secondMenuDiv hideDiv">
	  								<ul class="nav">
	  									<li>
	  									  <#if isDisplay('6_1_1')>
									     		<a href="${gzUrl('dzgzd/gzdgl/gzdmbxz/initList.do')}" target="content">工资单模板</a>
									      </#if>	
									 	</li>
									  	<li>
									  	  <#if isDisplay('6_2_1')>
									     		<a href="${gzUrl('dzgzd/gzdgl/gzdpc/initList.do')}" target="content">工资单管理</a>
									      </#if>		
									 	</li>
									 	<li>
									 	  <#if isDisplay('6_3_1')>
									     		<a href="${gzUrl('dzgzd/wdgzd/initList.do')}" target="content">我的工资单</a>
									       </#if>	
									 	</li>
									  	<li>
									  	   <#if isDisplay('6_4_1')>
									     		<a href="${gzUrl('dzgzd/wdgzd/initListByTable.do')}" target="content">工资单查询</a>
									       </#if>		
									 	</li>
									 	<li>
									  	   <#if isDisplay('6_5')>
									     		<a href="${gzUrl('dzgzd/gzdtj/initWageSum.do')}" target="content">我的工资单总计</a>
									       </#if>		
									 	</li>
									 	<li>
									  	   <#if isDisplay('6_6')>
									     		<a href="${gzUrl('dzgzd/gzdtj/initWageSumList.do')}" target="content">工资单总计</a>
									       </#if>		
									 	</li>
									 	<li>
									  	   <#if isDisplay('6_7')>
									     		<a href="${gzUrl('dzgzd/gzdtj/initColumnSumList.do')}" target="content">工资单明细总计</a>
									       </#if>		
									 	</li>
	  								</ul>
  							   </div>
  							   <!--  电子工资单        end  -->
  								
  							   <!--  人员管理              start -->
  							   <div id="rygl" class="secondMenuDiv hideDiv">
	  								<ul class="nav">
		  								  <#if isDisplay('7_1_1')>	
		  										<li>
		  											<a href="${gzUrl('rygl/jbxx/initList.do')}" target="content">职工基本信息</a>
		  										</li>
		  								  </#if>
		  								  <#if isDisplay('7_2')>		
		  										<li>
		  											<a href="${gzUrl('rygl/fgfw/initList.do')}" target="content">分管范围设置</a>
		  										</li>
		  								  </#if>
		  								  <#if isDisplay('7_3')>	
		  									<li>
		  										<a href="javascript:void(0);" onclick="javascript:showSubMenu('departmentSettingUl');" >科室职位设置</a>
		  										<ul id="departmentSettingUl">
		  											<li>
		  												<a href="${gzUrl('xtsz/bmgl/initList.do?baseId=0')}" target="content">科室管理</a>
		  											</li>
		  											<li>
		  												<a href="${gzUrl('xtsz/zwgl/initList.do')}" target="content">职位管理</a>
		  											</li>
		  										</ul>
		  									</li>
		  								  </#if>
		  								  <#if isDisplay('7_4')>
			  								  	<li>
			  										<a href="javascript:void(0);" onclick="javascript:showSubMenu('dictionarySettingUl6');">数据字典设置</a>
			  										<ul id="dictionarySettingUl6">
														<li>
															<a href="${gzUrl('xtsz/sjzd/gzzt/initList.do')}" target="content">工作状态设置</a>
														</li>
														<li>
															<a href="${gzUrl('xtsz/sjzd/mzsz/initList.do')}" target="content">民族设置</a>
														</li>
														<li>
															<a href="${gzUrl('xtsz/sjzd/zcsz/initList.do')}" target="content">职称设置</a>
														</li>
														<li>
															<a href="${gzUrl('xtsz/sjzd/zcjbsz/initList.do')}" target="content">职称级别设置</a>
														</li>
														<li>
															<a href="${gzUrl('xtsz/sjzd/zzmmsz/initList.do')}" target="content">政治面貌设置</a>
														</li>
														<li>
															<a href="${gzUrl('xtsz/sjzd/whcdsz/initList.do')}" target="content">文化程度设置</a>
														</li>
													</ul>
			  									</li>
		  								   </#if>
	  								</ul>
  								</div>
  							   <!--  人员管理              end   -->
  							   
  							   <!-- 考勤管理            start     -->
  							   <div id="kqgl" class="secondMenuDiv hideDiv">
	  								<ul class="nav">
	  									<#if isDisplay('10_5')>
		  									<li>
		  										<a href="${gzUrl('oagl/kqsy/kqsy.do')}" target="content">考勤首页</a>
		  									</li>
		  								</#if>
	  									<#if isDisplay('10_4')>
		  									<li>
		  										<a href="${gzUrl('oagl/glgn/ztwh.do')}?my=true&forEdit=true&gotoType=leftMenu" target="content">我的状态</a>
		  									</li>
	  									</#if>
		  								<#if isDisplay('10_1')>
		  									<li>
		  										<a href="${gzUrl('oagl/glgn/ztwh.do')}?my=search" target="content">状态日历查询</a>
		  									</li>
		  								</#if>
		  								<#if isDisplay('10_2')>
		  									<li>
		  										<a href="${gzUrl('oagl/glgn/ztwh.do')}" target="content">状态日历维护</a>
		  									</li>
		  								</#if>
		  								<#if isDisplay('10_3')>
		  									<li>
		  										<a href="${gzUrl('oagl/glgn/gzrgl.do')}" target="content">工作日管理</a>
		  									</li>
		  								</#if>
	  								 </ul>
  							 	</div>
  							   <!-- 考勤管理            end     -->
  							   
  							   <!-- 值班管理        start     -->
  							   <div id="zbgl" class="secondMenuDiv hideDiv">
	  								<ul class="nav">
		  								<#if isDisplay('11_1')>
		  									<li>
		  										<a href="${gzUrl('oagl/zhcx/initZbList.do')}" target="content">值班综合查询</a>
		  									</li>
		  								</#if>
		  								<#if isDisplay('11_2')>
		  									<li>
		  										<a href="${gzUrl('oagl/zhcx/initZbftj.do')}" target="content">值班费统计</a>
		  									</li>
		  								</#if>
		  								<#if isDisplay('11_3')>
		  									<li>
		  										<a href="${gzUrl('oagl/zhcx/initTxdtjList.do')}" target="content">调休单统计</a>
		  									</li>
		  								</#if>
		  								<#if isDisplay('11_4')>
		  									<li>
		  										<a href="javascript:void(0);" onclick="javascript:showSubMenu('zbTeamBizUI');">值班小组维护</a>
		  										<ul id="zbTeamBizUI">
		  											<#if isDisplay('11_4_1')><li><a href="${gzUrl('oagl/glgn/zbTeamBiz.do')}?dutyType=1"  target="content">值班领导名单维护</a></li></#if>
		  											<#if isDisplay('11_4_1')><li><a href="${gzUrl('oagl/glgn/zbTeamBizRule.do')}?dutyType=1" target="content">值班领导排班</a></li></#if>
		  											<#if isDisplay('11_4_2')><li><a href="${gzUrl('oagl/glgn/zbTeamBiz.do')}?dutyType=2" target="content">听班小分队名单维护</a></li></#if>
		  											<#if isDisplay('11_4_2')><li><a href="${gzUrl('oagl/glgn/zbTeamBizRule.do')}?dutyType=2" target="content">听班小分队排班</a></li></#if>
		  											<#if isDisplay('11_4_3')><li><a href="${gzUrl('oagl/glgn/zbTeamBiz.do')}?dutyType=3" target="content">总值班名单维护</a></li></#if>
		  											<#if isDisplay('11_4_3')><li><a href="${gzUrl('oagl/glgn/zbTeamBizRule.do')}?dutyType=3" target="content">总值班排班</a></li></#if>
	  											</ul>
		  									</li>
		  								</#if>
		  								<#if isDisplay('11_5')>
		  									<li>
		  										<a href="${gzUrl('oagl/glgn/zbrlwh.do')}" target="content">值班日历维护</a>
		  									</li>
		  								</#if>
	  								 </ul>
  								</div>
  							   <!-- 值班管理        end     -->
  							   
  							   <!-- 通知公告      start  -->
  							   <div id="tzgg" class="secondMenuDiv hideDiv">
	  								<ul class="nav">
	  									<#if isDisplay('12')>
		  									<li>
		  										<a href="${gzUrl('oagl/tzgg/initList.do')}" target="content">通知公告</a>
		  									</li>
	  									</#if>
	  								</ul>
  								</div>
  							   <!-- 通知公告      end  -->
  								
  							   <!-- 系统设置    start   -->
  							   	<div id="xtsz" class="secondMenuDiv hideDiv">
	  								<ul class="nav">
	  									<li>
	  										<a href="${gzUrl('xtsz/dhsz/initList.do')}" target="content">导航设置</a>
	  									</li>
	  									<li>
	  										<a href="${gzUrl('xtsz/jssz/initList.do')}" target="content">权限设置</a>
	  									</li>
	  									<li>
	  										<a href="${gzUrl('xtsz/yhgl/initList.do')}" target="content">帐号设置</a>
	  									</li>
	  									<li>
	  										<a href="javascript:void(0);" onclick="javascript:showSubMenu('salaryOrderSettingUl');">工资单设置</a>
	  										<ul id="salaryOrderSettingUl">
	  											<li>
	  												<a href="${gzUrl('xtsz/gzdsz/jczdsz/initList.do')}" target="content">
	  													基础字段设置
	  												</a>
	  											</li>
	  											<li>
	  												<a href="${gzUrl('xtsz/gzdsz/djmbsz/initList.do')}" target="content">
	  													工资单据模板设置
	  												</a>
	  											</li>
	  										</ul>
	  									</li>
	  									<li>
	  										<a href="${gzUrl('/oagl/gzsjdsz/initList.do')}" target="content">工作时间段设置</a>
	  									</li>
	  									<li>
	  										<a href="${gzUrl('/oagl/baseMoney/toList.do')}" target="content">薪水基数设置</a>
	  									</li>
	  								 </ul>
  								 </div>
  							   <!-- 系统设置    end   -->
						</div>
					<!--                 Left Menu 左侧菜单              end              -->
					
					<!--  MainFrame Body  菜单对应内容                              start        -->
					<div class="IFrameDiv">
						<iframe class="MainFrame" id="content" name="content" frameborder="0" src=""></iframe>
					</div>
					
					<!--  MainFrame Body  菜单对应内容                              end        -->
					
					<!-- 清除浮动样式DIV          START  -->
					<div class="clear_both_div"></div>
					<!-- 清除浮动样式DIV          END  -->
			</div>
			
			<!-- bottom  底部 -->
			<div class="parentBottomDiv" position="bottom">
				<div class="bottomDiv" id="bottom" >版权所有：&copy; ${SYSTEM_NAME?if_exists}&nbsp;&nbsp;</div>
			</div>
		</div>
	</body>
	<script type="text/javascript">
		/**********TODO　************/
    	
    	/**
    	*@liObj: TOP一级菜单对象
    	*@subMenuDiv: 子菜单DIV ID
    	*@flag:是否显示左侧子菜单,"0":不显示,"1":显示
    	*/
    	function menuChange(liObj,subMenuDiv,flag)
    	{
    		if(typeof(liObj)!='undefined')
    		{
    			if(typeof(flag)!='undefined')
    			{
    				if(flag=="0")
    				{
    					//不显示 navigation
    					$("#navigation").removeClass("showDiv");
    					$("#navigation").addClass("hideDiv");
    					
    					//改变宽度
    					$(".IFrameDiv").css("width","100%");
    				}
    				else
    				{
    					//显示 navigation
    					$("#navigation").removeClass("hideDiv");
    					$("#navigation").addClass("showDiv");
    					
    					//其他二级菜单隐藏
    					$(".secondMenuDiv").removeClass("showDiv");
    					$(".secondMenuDiv").addClass("hideDiv");
    					
    					//subMenuDiv显示
    					$("#"+subMenuDiv).removeClass("hideDiv");
    					$("#"+subMenuDiv).addClass("showDiv");
    					
    					//改变宽度
    					$(".IFrameDiv").css("width","85%");
    					$(".navigation").css("width","15%");
    				}
    			}
    		}
    	}
    	
    	/**
    	*显示三级菜单
    	*@ulId   三级才菜单UL的ID
    	*/
    	function showSubMenu(ulId)
    	{
    		$("#"+ulId).css("display","block");
    	}
    	
    	
    	$(function(){
    		$("#content").attr("src","${gzUrl('oagl/index/index.do')}");//默认显示首页
    		$(".IFrameDiv").css("width","100%");
    		$("ul#menu li").click(function(){//单击一级菜单显示高亮
    			$("ul#menu li.current").removeClass("current");
    			$(this).addClass("current");
    		});
    		$(".IFrameDiv").css("height",$("body").innerHeight()-158);//基于火狐的高度自动适配
    		$(window).resize(function(){
    			$(".IFrameDiv").css("height",$("body").innerHeight()-158);//基于火狐的高度自动适配
    		});
    		var kqgl_url = "about:_blank";
    		<#if isDisplay('10_4')>kqgl_url="${gzUrl('oagl/glgn/ztwh.do?my=true&forEdit=true&gotoType=leftMenu')}";</#if>
    		<#if isDisplay('10_5')>kqgl_url="${gzUrl('oagl/kqsy/kqsy.do')}";</#if>
    		$("#kqgl_menu1").attr("href",kqgl_url);
    	});
    </script>
	<script type="text/javascript">
		setTimeout(function(){
			$.get("${gzUrl('loadMsgNum.do')}?timestamp=" + Date.parse(new Date()), null, returnBack);
		    setTimeout(arguments.callee,10000);
		},100);
		
		function returnBack(data){
			var result = eval("("+data+")");
			$("#msgNum").html(result); 
	    }
	    <#if isDisplay('9_1')>
	    	//弹出考勤首页内容窗口
	    	open('${gzUrl('oagl/kqsy/kqsy.do')}','考勤首页','height=650,width=800,top=0,left=0,boolbar=no,location=no,status=no')
	    </#if>
	</script>
</html>


