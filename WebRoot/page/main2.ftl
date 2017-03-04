<#include "base_lib.ftl" />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>恰尔斯-EMS企业信息管理平台</title>
<link href="${gzUrl('css/table.css')}" type="text/css" rel="stylesheet" />
<script src="${gzUrl('script/jquery-1.9.1.js')}" type="text/javascript"></script>
<script src="${gzUrl('script/jquery-ui.js')}" type="text/javascript"></script>
<script src="${gzUrl('script/jquery.ui.datepicker-zh-CN.js')}" type="text/javascript"></script>
<script src="${gzUrl('script/combobox.js')}" type="text/javascript"></script>
</head>

<body>
	<div id="right">
		<div class="search">
			<div class="box-header">
				<img src="${gzUrl('images/tb.gif')}" class="boximg" />
				<h2>
					您现在所在的位置：<label class="h_lable">首页</label>
				</h2>
			</div>
			<div class="module_main">
		<#if isDisplay('1')>
				<h2>
					<span>项目管理--待办事宜</span>
				</h2>
				<div class="overflow">
				<ul style="display:inline;text-align:center;">
					<#if isDisplay('1_2_2_1_1')>
					<li style="float:left;margin:5px;text-align:center;white-space:nowrap;width:160px;">
						<a href="#"><img src="${gzUrl('images/xmgl.png')}" height="64" width="64" /></a>
						<br/>
						<a href="${gzUrl('xmgl/xmkc/kcss/gc/initList/')}" target="content">有<font id="xmkc1"></font>个工程项目待勘察</a>
					</li>
					<script>
						$.get("${gzUrl('loadJobNum/')}?jobName=xmkc1", null, callback_xmkc1);
						function callback_xmkc1(data){
							if(data!=0 && data!="0"){
								$("#xmkc1").css("color","red");
							}
							$("#xmkc1").text(data);
						}
					</script>
					</#if>
					<#if isDisplay('1_2_2_2_1')>
					<li style="float:left;margin:5px;text-align:center;white-space:nowrap;width:160px;">
						<a href="#"><img src="${gzUrl('images/xmgl.png')}" height="64" width="64" /></a>
						<br/>
						<a href="${gzUrl('xmgl/xmkc/kcss/yx/initList/')}" target="content">有<font id="xmkc2"></font>个运行项目待勘察</a>
					</li>
					<script>
						$.get("${gzUrl('loadJobNum/')}?jobName=xmkc2", null, callback_xmkc2);
						function callback_xmkc2(data){
							if(data!=0 && data!="0"){
								$("#xmkc2").css("color","red");
							}
							$("#xmkc2").text(data);
						}
					</script>
					</#if>
					<#if isDisplay('1_3_1')>
					<li style="float:left;margin:5px;text-align:center;white-space:nowrap;width:160px;">
						<a href="#"><img src="${gzUrl('images/fwwb.png')}" height="64" width="64" /></a>
						<br/>
						<a href="${gzUrl('xmgl/xmys/initList/')}" target="content">有<font id="xmys"></font>个项目待预算</a>
					</li>
					<script>
						$.get("${gzUrl('loadJobNum/')}?jobName=xmys", null, callback_xmys);
						function callback_xmys(data){
							if(data!=0 && data!="0"){
								$("#xmys").css("color","red");
							}
							$("#xmys").text(data);
						}
					</script>
					</#if>
					<#if isDisplay('1_4_1')>
					<li style="float:left;margin:5px;text-align:center;white-space:nowrap;width:160px;">
						<a href="#"><img src="${gzUrl('images/khgl.png')}" height="64" width="64" /></a>
						<br/>
						<a href="${gzUrl('xmgl/xmtb/initList/')}" target="content">有<font id="xmtb1"></font>个项目待投标(技术)</a>
					</li>
					<script>
						$.get("${gzUrl('loadJobNum/')}?jobName=xmtb1", null, callback_xmtb1);
						function callback_xmtb1(data){
							if(data!=0 && data!="0"){
								$("#xmtb1").css("color","red");
							}
							$("#xmtb1").text(data);
						}
					</script>
					<li style="float:left;margin:5px;text-align:center;white-space:nowrap;width:160px;">
						<a href="#"><img src="${gzUrl('images/khgl.png')}" height="64" width="64" /></a>
						<br/>
						<a href="${gzUrl('xmgl/xmtb/initList/')}" target="content">有<font id="xmtb2"></font>个项目待投标(商务)</a>
					</li>
					<script>
						$.get("${gzUrl('loadJobNum/')}?jobName=xmtb2", null, callback_xmtb2);
						function callback_xmtb2(data){
							if(data!=0 && data!="0"){
								$("#xmtb2").css("color","red");
							}
							$("#xmtb2").text(data);
						}
					</script>
					</#if>
					<#if isDisplay('1_5_1_1')>
					<li style="float:left;margin:5px;text-align:center;white-space:nowrap;width:160px;">
						<a href="#"><img src="${gzUrl('images/khgl.png')}" height="64" width="64" /></a>
						<br/>
						<a href="${gzUrl('xmgl/htgl/htqc/initList/')}" target="content">有<font id="htqc"></font>个合同待起草</a>
					</li>
					<script>
						$.get("${gzUrl('loadJobNum/')}?jobName=htqc", null, callback_htqc);
						function callback_htqc(data){
							if(data!=0 && data!="0"){
								$("#htqc").css("color","red");
							}
							$("#htqc").text(data);
						}
					</script>
					</#if>
					<#if isDisplay('1_5_2_1')>	
					<li style="float:left;margin:5px;text-align:center;white-space:nowrap;width:160px;">	
						<a href="#"><img src="${gzUrl('images/khgl.png')}" height="64" width="64" /></a>
						<br/>
						<a href="${gzUrl('xmgl/htgl/hthq/initList/')}" target="content">有<font id="hthq"></font>个合同待会签</a>
					</li>
					<script>
						$.get("${gzUrl('loadJobNum/')}?jobName=hthq", null, callback_hthq);
						function callback_hthq(data){
							if(data!=0 && data!="0"){
								$("#hthq").css("color","red");
							}
							$("#hthq").text(data);
						}
					</script>
					</#if>
					<#if isDisplay('1_5_3_1')>		
					<li style="float:left;margin:5px;text-align:center;white-space:nowrap;width:160px;">
						<a href="#"><img src="${gzUrl('images/khgl.png')}" height="64" width="64" /></a>
						<br/>
						<a href="${gzUrl('xmgl/htgl/htdy/initList/')}" target="content">有<font id="htgz"></font>个合同待盖章</a>
					</li>
					<script>
						$.get("${gzUrl('loadJobNum/')}?jobName=htgz", null, callback_htgz);
						function callback_htgz(data){
							if(data!=0 && data!="0"){
								$("#htgz").css("color","red");
							}
							$("#htgz").text(data);
						}
					</script>
					</#if>	
					<#if isDisplay('1_5_4_1')>	
					<li style="float:left;margin:5px;text-align:center;white-space:nowrap;width:160px;">
						<a href="#"><img src="${gzUrl('images/khgl.png')}" height="64" width="64" /></a>
						<br/>
						<a href="${gzUrl('xmgl/htgl/htqd/initList/')}" target="content">有<font id="htqd"></font>个合同待签订</a>
					</li>
					<script>
						$.get("${gzUrl('loadJobNum/')}?jobName=htqd", null, callback_htqd);
						function callback_htqd(data){
							if(data!=0 && data!="0"){
								$("#htqd").css("color","red");
							}
							$("#htqd").text(data);
						}
					</script>
					</#if>	
					<#if isDisplay('1_5_5_1')>	
					<li style="float:left;margin:5px;text-align:center;white-space:nowrap;width:160px;">
						<a href="#"><img src="${gzUrl('images/khgl.png')}" height="64" width="64" /></a>
						<br/>
						<a href="${gzUrl('xmgl/htgl/htsm/initList/')}" target="content">有<font id="htsm"></font>个合同待扫描</a>
					</li>
					<script>
						$.get("${gzUrl('loadJobNum/')}?jobName=htsm", null, callback_htsm);
						function callback_htsm(data){
							if(data!=0 && data!="0"){
								$("#htsm").css("color","red");
							}
							$("#htsm").text(data);
						}
					</script>
					</#if>
					<#if isDisplay('1_6_4_1')>
					<li style="float:left;margin:5px;text-align:center;white-space:nowrap;width:160px;">
						<a href="#"><img src="${gzUrl('images/xmgl.png')}" height="64" width="64" /></a>
						<br/>
						<a href="${gzUrl('xmgl/xmss/aqjc/initList/')}" target="content">有<font id="aqfx"></font>个项目待安全分析</a>
					</li>
					<script>
						$.get("${gzUrl('loadJobNum/')}?jobName=aqfx", null, callback_aqfx);
						function callback_aqfx(data){
							if(data!=0 && data!="0"){
								$("#aqfx").css("color","red");
							}
							$("#aqfx").text(data);
						}
					</script>
					</#if>
					<#if isDisplay('1_6_6_1')>
					<li style="float:left;margin:5px;text-align:center;white-space:nowrap;width:160px;">
						<a href="#"><img src="${gzUrl('images/fwwb.png')}" height="64" width="64" /></a>
						<br/>
						<a href="${gzUrl('xmgl/xmss/sgfa/initList/')}" target="content">有<font id="sgfa"></font>个项目待施工方案</a>
					</li>
					<script>
						$.get("${gzUrl('loadJobNum/')}?jobName=sgfa", null, callback_sgfa);
						function callback_sgfa(data){
							if(data!=0 && data!="0"){
								$("#sgfa").css("color","red");
							}
							$("#sgfa").text(data);
						}
					</script>
					</#if>
					<#if isDisplay('1_6_5_1')>
					<li style="float:left;margin:5px;text-align:center;white-space:nowrap;width:160px;">
						<a href="#"><img src="${gzUrl('images/khgl.png')}" height="64" width="64" /></a>
						<br/>
						<a href="${gzUrl('xmgl/xmss/xmwg/initList/')}" target="content">有<font id="xmwg"></font>个合同待项目完工</a>
					</li>
					<script>
						$.get("${gzUrl('loadJobNum/')}?jobName=xmwg", null, callback_xmwg);
						function callback_xmwg(data){
							if(data!=0 && data!="0"){
								$("#xmwg").css("color","red");
							}
							$("#xmwg").text(data);
						}
					</script>
					</#if>
					<#if isDisplay('1_7_1')>
					<li style="float:left;margin:5px;text-align:center;white-space:nowrap;width:160px;">
						<a href="#"><img src="${gzUrl('images/khgl.png')}" height="64" width="64" /></a>
						<br/>
						<a href="${gzUrl('xmgl/jg/initList/')}" target="content">有<font id="xmjg"></font>个项目待竣工</a>
					</li>
					<script>
						$.get("${gzUrl('loadJobNum/')}?jobName=xmjg", null, callback_xmjg);
						function callback_xmjg(data){
							if(data!=0 && data!="0"){
								$("#xmjg").css("color","red");
							}
							$("#xmjg").text(data);
						}
					</script>
					</#if>
					<#if isDisplay('1_8_1')>
					<li style="float:left;margin:5px;text-align:center;white-space:nowrap;width:160px;">
						<a href="#"><img src="${gzUrl('images/khgl.png')}" height="64" width="64" /></a>
						<br/>
						<a href="${gzUrl('xmgl/js/initList/')}" target="content">有<font id="xmjs"></font>个项目待决算</a>
					</li>
					<script>
						$.get("${gzUrl('loadJobNum/')}?jobName=xmjs", null, callback_xmjs);
						function callback_xmjs(data){
							if(data!=0 && data!="0"){
								$("#xmjs").css("color","red");
							}
							$("#xmjs").text(data);
						}
					</script>
					</#if>
					<#if isDisplay('1_6_1_1_1')>
					<li style="float:left;margin:5px;text-align:center;white-space:nowrap;width:160px;">
						<a href="#"><img src="${gzUrl('images/khgl.png')}" height="64" width="64" /></a>
						<br/>
						<a href="${gzUrl('xmgl/xmss/kgap/gc/initList/')}" target="content">有<font id="kgap1"></font>个工程项目待开工安排</a>
					</li>
					<script>
						$.get("${gzUrl('loadJobNum/')}?jobName=kgap1", null, callback_kgap1);
						function callback_kgap1(data){
							if(data!=0 && data!="0"){
								$("#kgap1").css("color","red");
							}
							$("#kgap1").text(data);
						}
					</script>
					</#if>
					<#if isDisplay('1_6_1_2_1')>	
					<li style="float:left;margin:5px;text-align:center;white-space:nowrap;width:160px;">
						<a href="#"><img src="${gzUrl('images/khgl.png')}" height="64" width="64" /></a>
						<br/>
						<a href="${gzUrl('xmgl/xmss/kgap/yx/initList/')}" target="content">有<font id="kgap2"></font>个运行项目待开工安排</a>
					</li>
					<script>
						$.get("${gzUrl('loadJobNum/')}?jobName=kgap2", null, callback_kgap2);
						function callback_kgap2(data){
							if(data!=0 && data!="0"){
								$("#kgap2").css("color","red");
							}
							$("#kgap2").text(data);
						}
					</script>
					</#if>
					<#if isDisplay('1_6_2_1_1')>		
					<li style="float:left;margin:5px;text-align:center;white-space:nowrap;width:160px;">
						<a href="#"><img src="${gzUrl('images/khgl.png')}" height="64" width="64" /></a>
						<br/>
						<a href="${gzUrl('xmgl/xmss/kg/gc/initList/')}" target="content">有<font id="xmkg1"></font>个工程项目待开工</a>
					</li>
					<script>
						$.get("${gzUrl('loadJobNum/')}?jobName=xmkg1", null, callback_xmkg1);
						function callback_xmkg1(data){
							if(data!=0 && data!="0"){
								$("#xmkg1").css("color","red");
							}
							$("#xmkg1").text(data);
						}
					</script>
					</#if>
					<#if isDisplay('1_6_2_2_1')>
					<li style="float:left;margin:5px;text-align:center;white-space:nowrap;width:160px;">	
						<a href="#"><img src="${gzUrl('images/xmgl.png')}" height="64" width="64" /></a>
						<br/>
						<a href="${gzUrl('xmgl/xmss/kg/yx/initList/')}" target="content">有<font id="xmkg2"></font>个运行项目待开工</a>
					</li>
					<script>
						$.get("${gzUrl('loadJobNum/')}?jobName=xmkg2", null, callback_xmkg2);
						function callback_xmkg2(data){
							if(data!=0 && data!="0"){
								$("#xmkg2").css("color","red");
							}
							$("#xmkg2").text(data);
						}
					</script>
					</#if>
					<#if isDisplay('1_6_3_1_1')>
					<li style="float:left;margin:5px;text-align:center;white-space:nowrap;width:160px;">	
						<a href="#"><img src="${gzUrl('images/fwwb.png')}" height="64" width="64" /></a>
						<br/>
						<a href="${gzUrl('xmgl/xmss/sg/gc/initList/')}" target="content">有<font id="xmsg1"></font>个工程项目待施工</a>
					</li>
					<script>
						$.get("${gzUrl('loadJobNum/')}?jobName=xmsg1", null, callback_xmsg1);
						function callback_xmsg1(data){
							if(data!=0 && data!="0"){
								$("#xmsg1").css("color","red");
							}
							$("#xmsg1").text(data);
						}
					</script>
					</#if>	
					<#if isDisplay('1_6_3_2_1')>
					<li style="float:left;margin:5px;text-align:center;white-space:nowrap;width:160px;">	
						<a href="#"><img src="${gzUrl('images/khgl.png')}" height="64" width="64" /></a>
						<br/>
						<a href="${gzUrl('xmgl/xmss/sg/yx/initList/')}" target="content">有<font id="xmsg2"></font>个运行项目待施工</a>
					</li>
					<script>
						$.get("${gzUrl('loadJobNum/')}?jobName=xmsg2", null, callback_xmsg2);
						function callback_xmsg2(data){
							if(data!=0 && data!="0"){
								$("#xmsg2").css("color","red");
							}
							$("#xmsg2").text(data);
						}
					</script>
					</#if>
				</ul>
				</div>
			</#if>
			<#if isDisplay('10')>	
				<h2>
					<span>百胜项目--待办事宜</span>
				</h2>
				<div class="overflow">
				<ul style="display:inline;text-align:center;">
					<#if isDisplay('10_2_2_1')>
					<li style="float:left;margin:5px;text-align:center;white-space:nowrap;width:160px;">	
						<a href="#"><img src="${gzUrl('images/xmgl.png')}" height="64" width="64" /></a>
						<br/>
						<a href="${gzUrl('kfc/xmkc/kcss/initList/')}" target="content">有<font id="kfcxmkc"></font>个项目待勘察</a>
					</li>
					<script>
						$.get("${gzUrl('loadJobNum/')}?jobName=kfcxmkc", null, callback_kfcxmkc);
						function callback_kfcxmkc(data){
							if(data!=0 && data!="0"){
								$("#kfcxmkc").css("color","red");
							}
							$("#kfcxmkc").text(data);
						}
					</script>
					</#if>	
					<#if isDisplay('10_3_1')>
					<li style="float:left;margin:5px;text-align:center;white-space:nowrap;width:160px;">	
						<a href="#"><img src="${gzUrl('images/xmgl.png')}" height="64" width="64" /></a>
						<br/>
						<a href="${gzUrl('kfc/xmys/initList/')}" target="content">有<font id="kfcxmys"></font>个项目待预算</a>
					</li>
					<script>
						$.get("${gzUrl('loadJobNum/')}?jobName=kfcxmys", null, callback_kfcxmys);
						function callback_kfcxmys(data){
							if(data!=0 && data!="0"){
								$("#kfcxmys").css("color","red");
							}
							$("#kfcxmys").text(data);
						}
					</script>
					</#if>
					<#if isDisplay('10_4_1')>
					<li style="float:left;margin:5px;text-align:center;white-space:nowrap;width:160px;">	
						<a href="#"><img src="${gzUrl('images/fwwb.png')}" height="64" width="64" /></a>
						<br/>
						<a href="${gzUrl('kfc/xmtb/initList/')}" target="content">有<font id="kfcxmtb1"></font>个项目待投标(技术)</a>
					</li>
					<script>
						$.get("${gzUrl('loadJobNum/')}?jobName=kfcxmtb1", null, callback_kfcxmtb1);
						function callback_kfcxmtb1(data){
							if(data!=0 && data!="0"){
								$("#kfcxmtb1").css("color","red");
							}
							$("#kfcxmtb1").text(data);
						}
					</script>
					</#if>
					<#if isDisplay('10_4_1')>
					<li style="float:left;margin:5px;text-align:center;white-space:nowrap;width:160px;">	
						<a href="#"><img src="${gzUrl('images/khgl.png')}" height="64" width="64" /></a>
						<br/>
						<a href="${gzUrl('kfc/xmtb/initList/')}" target="content">有<font id="kfcxmtb2"></font>个项目待投标(商务)</a>
					</li>
					<script>
						$.get("${gzUrl('loadJobNum/')}?jobName=kfcxmtb2", null, callback_kfcxmtb2);
						function callback_kfcxmtb2(data){
							if(data!=0 && data!="0"){
								$("#kfcxmtb2").css("color","red");
							}
							$("#kfcxmtb2").text(data);
						}
					</script>
					</#if>
					<#if isDisplay('10_5_2_1')>
					<li style="float:left;margin:5px;text-align:center;white-space:nowrap;width:160px;">	
						<a href="#"><img src="${gzUrl('images/khgl.png')}" height="64" width="64" /></a>
						<br/>
						<a href="${gzUrl('kfc/htgl/htqc/initList/')}" target="content">有<font id="kfchtqc"></font>个合同待起草</a>
					</li>
					<script>
						$.get("${gzUrl('loadJobNum/')}?jobName=kfchtqc", null, callback_kfchtqc);
						function callback_kfchtqc(data){
							if(data!=0 && data!="0"){
								$("#kfchtqc").css("color","red");
							}
							$("#kfchtqc").text(data);
						}
					</script>
					</#if>	
					<#if isDisplay('10_5_3_1')>
					<li style="float:left;margin:5px;text-align:center;white-space:nowrap;width:160px;">	
						<a href="#"><img src="${gzUrl('images/khgl.png')}" height="64" width="64" /></a>
						<br/>
						<a href="${gzUrl('kfc/htgl/hthq/initList/')}" target="content">有<font id="kfchthq"></font>个合同待会签</a>
					</li>
					<script>
						$.get("${gzUrl('loadJobNum/')}?jobName=kfchthq", null, callback_kfchthq);
						function callback_kfchthq(data){
							if(data!=0 && data!="0"){
								$("#kfchthq").css("color","red");
							}
							$("#kfchthq").text(data);
						}
					</script>
					</#if>
					<#if isDisplay('10_5_4_1')>
					<li style="float:left;margin:5px;text-align:center;white-space:nowrap;width:160px;">	
						<a href="#"><img src="${gzUrl('images/khgl.png')}" height="64" width="64" /></a>
						<br/>
						<a href="${gzUrl('kfc/htgl/htdy/initList/')}" target="content">有<font id="kfchtgz"></font>个合同待盖章</a>
					</li>
					<script>
						$.get("${gzUrl('loadJobNum/')}?jobName=kfchtgz", null, callback_kfchtgz);
						function callback_kfchtgz(data){
							if(data!=0 && data!="0"){
								$("#kfchtgz").css("color","red");
							}
							$("#kfchtgz").text(data);
						}
					</script>
					</#if>
					<#if isDisplay('10_5_5_1')>
					<li style="float:left;margin:5px;text-align:center;white-space:nowrap;width:160px;">	
						<a href="#"><img src="${gzUrl('images/khgl.png')}" height="64" width="64" /></a>
						<br/>
						<a href="${gzUrl('kfc/htgl/htqd/initList/')}" target="content">有<font id="kfchtqd"></font>个合同待签订</a>
					</li>
					<script>
						$.get("${gzUrl('loadJobNum/')}?jobName=kfchtqd", null, callback_kfchtqd);
						function callback_kfchtqd(data){
							if(data!=0 && data!="0"){
								$("#kfchtqd").css("color","red");
							}
							$("#kfchtqd").text(data);
						}
					</script>
					</#if>
					<#if isDisplay('10_5_6_1')>
					<li style="float:left;margin:5px;text-align:center;white-space:nowrap;width:160px;">	
						<a href="#"><img src="${gzUrl('images/khgl.png')}" height="64" width="64" /></a>
						<br/>
						<a href="${gzUrl('kfc/htgl/htsm/initList/')}" target="content">有<font id="kfchtsm"></font>个合同待扫描</a>
					</li>
					<script>
						$.get("${gzUrl('loadJobNum/')}?jobName=kfchtsm", null, callback_kfchtsm);
						function callback_kfchtsm(data){
							if(data!=0 && data!="0"){
								$("#kfchtsm").css("color","red");
							}
							$("#kfchtsm").text(data);
						}
					</script>
					</#if>
					 
					<#if isDisplay('10_8_1_1')>
					<li style="float:left;margin:5px;text-align:center;white-space:nowrap;width:160px;">	
						<a href="#"><img src="${gzUrl('images/xmgl.png')}" height="64" width="64" /></a>
						<br/>
						<a href="${gzUrl('kfc/xmss/aqjc/initList/')}" target="content">有<font id="kfcaqfx"></font>个项目待安全分析</a>
					</li>
					<script>
						$.get("${gzUrl('loadJobNum/')}?jobName=kfcaqfx", null, callback_kfcaqfx);
						function callback_kfcaqfx(data){
							if(data!=0 && data!="0"){
								$("#kfcaqfx").css("color","red");
							}
							$("#kfcaqfx").text(data);
						}
					</script>
					</#if>	
					<#if isDisplay('10_8_2_1')>
					<li style="float:left;margin:5px;text-align:center;white-space:nowrap;width:160px;">	
						<a href="#"><img src="${gzUrl('images/fwwb.png')}" height="64" width="64" /></a>
						<br/>
						<a href="${gzUrl('kfc/xmss/sgfa/initList/')}" target="content">有<font id="kfcsgfa"></font>个项目待施工方案</a>
					</li>
					<script>
						$.get("${gzUrl('loadJobNum/')}?jobName=kfcsgfa", null, callback_kfcsgfa);
						function callback_kfcsgfa(data){
							if(data!=0 && data!="0"){
								$("#kfcsgfa").css("color","red");
							}
							$("#kfcsgfa").text(data);
						}
					</script>
					</#if>
					<#if isDisplay('10_8_6_1')>
					<li style="float:left;margin:5px;text-align:center;white-space:nowrap;width:160px;">	
						<a href="#"><img src="${gzUrl('images/khgl.png')}" height="64" width="64" /></a>
						<br/>
						<a href="${gzUrl('kfc/xmss/xmwg/initList/')}" target="content">有<font id="kfcxmwg"></font>个合同待项目完工</a>
					</li>
					<script>
						$.get("${gzUrl('loadJobNum/')}?jobName=kfcxmwg", null, callback_kfcxmwg);
						function callback_kfcxmwg(data){
							if(data!=0 && data!="0"){
								$("#kfcxmwg").css("color","red");
							}
							$("#kfcxmwg").text(data);
						}
					</script>
					</#if>
					<#if isDisplay('10_9_1')>
					<li style="float:left;margin:5px;text-align:center;white-space:nowrap;width:160px;">	
						<a href="#"><img src="${gzUrl('images/khgl.png')}" height="64" width="64" /></a>
						<br/>
						<a href="${gzUrl('kfc/jg/initList/')}" target="content">有<font id="kfcxmjg"></font>个项目待竣工</a>
					</li>
					<script>
						$.get("${gzUrl('loadJobNum/')}?jobName=kfcxmjg", null, callback_kfcxmjg);
						function callback_kfcxmjg(data){
							if(data!=0 && data!="0"){
								$("#kfcxmjg").css("color","red");
							}
							$("#kfcxmjg").text(data);
						}
					</script>
					</#if>
					<#if isDisplay('10_10_1')>
					<li style="float:left;margin:5px;text-align:center;white-space:nowrap;width:160px;">	
						<a href="#"><img src="${gzUrl('images/khgl.png')}" height="64" width="64" /></a>
						<br/>
						<a href="${gzUrl('kfc/js/initList/')}" target="content">有<font id="kfcxmjs"></font>个项目待决算</a>
					</li>
					<script>
						$.get("${gzUrl('loadJobNum/')}?jobName=kfcxmjs", null, callback_kfcxmjs);
						function callback_kfcxmjs(data){
							if(data!=0 && data!="0"){
								$("#kfcxmjs").css("color","red");
							}
							$("#kfcxmjs").text(data);
						}
					</script>
					</#if>
					<#if isDisplay('10_8_3_1')>
					<li style="float:left;margin:5px;text-align:center;white-space:nowrap;width:160px;">	
						<a href="#"><img src="${gzUrl('images/khgl.png')}" height="64" width="64" /></a>
						<br/>
						<a href="#" target="content">有<font id="kfckgap"></font>个项目待开工安排</a>
					</li>
					<script>
						$.get("${gzUrl('loadJobNum/')}?jobName=kfckgap", null, callback_kfckgap);
						function callback_kfckgap(data){
							if(data!=0 && data!="0"){
								$("#kfckgap").css("color","red");
							}
							$("#kfckgap").text(data);
						}
					</script>
					</#if>
					<#if isDisplay('10_8_4_1')>
					<li style="float:left;margin:5px;text-align:center;white-space:nowrap;width:160px;">	
						<a href="#"><img src="${gzUrl('images/khgl.png')}" height="64" width="64" /></a>
						<br/>
						<a href="#" target="content">有<font id="kfcxmkg"></font>个项目待开工</a>
					</li>
					<script>
						$.get("${gzUrl('loadJobNum/')}?jobName=kfcxmkg", null, callback_kfcxmkg);
						function callback_kfcxmkg(data){
							if(data!=0 && data!="0"){
								$("#kfcxmkg").css("color","red");
							}
							$("#kfcxmkg").text(data);
						}
					</script>
					</#if>
					<#if isDisplay('10_8_5_1')>
					<li style="float:left;margin:5px;text-align:center;white-space:nowrap;width:160px;">	
						<a href="#"><img src="${gzUrl('images/khgl.png')}" height="64" width="64" /></a>
						<br/>
						<a href="#" target="content">有<font id="kfcxmsg"></font>个项目待施工</a>
					</li>
					<script>
						$.get("${gzUrl('loadJobNum/')}?jobName=kfcxmsg", null, callback_kfcxmsg);
						function callback_kfcxmsg(data){
							if(data!=0 && data!="0"){
								$("#kfcxmsg").css("color","red");
							}
							$("#kfcxmsg").text(data);
						}
					</script>
					</#if>
				</ul>
				</div>
			</#if>
			<#if isDisplay('4')>	
				<h2>
					<span>财务管理--待办事宜</span>
				</h2>
				<div class="overflow">
				<ul style="display:inline;text-align:center;">
					<#if isDisplay('4_2_4')>
					<li style="float:left;margin:5px;text-align:center;white-space:nowrap;width:160px;">	
						<a href="#"><img src="${gzUrl('images/xmgl.png')}" height="64" width="64" /></a>
						<br/>
						<a href="${gzUrl('cwgl/kptpgl/initList/')}" target="content">有<font id="kp"></font>个发票待开票</a>
					</li>
					<script>
						$.get("${gzUrl('loadJobNum/')}?jobName=kp", null, callback_kp);
						function callback_kp(data){
							if(data!=0 && data!="0"){
								$("#kp").css("color","red");
							}
							$("#kp").text(data);
						}
					</script>
					</#if>	
				 	<#if isDisplay('4_2_5')>
					 	<li style="float:left;margin:5px;text-align:center;white-space:nowrap;width:160px;">	
						<a href="#"><img src="${gzUrl('images/xmgl.png')}" height="64" width="64" /></a>
						<br/>
						<a href="${gzUrl('cwgl/kptpgl/initList/')}" target="content">有<font id="qs"></font>个发票待签收</a>
						</li>
					</#if>
					<script>
						$.get("${gzUrl('loadJobNum/')}?jobName=qs", null, callback_qs);
						function callback_qs(data){
							if(data!=0 && data!="0"){
								$("#qs").css("color","red");
							}
							$("#qs").text(data);
						}
					</script>
					<#if isDisplay('4_2_7')>
					<li style="float:left;margin:5px;text-align:center;white-space:nowrap;width:160px;">	
						<a href="#"><img src="${gzUrl('images/fwwb.png')}" height="64" width="64" /></a>
						<br/>
						<a href="${gzUrl('cwgl/kptpgl/initList/')}" target="content">有<font id="tp"></font>个发票待退票</a>
					</li>
					<script>
						$.get("${gzUrl('loadJobNum/')}?jobName=tp", null, callback_tp);
						function callback_tp(data){
							if(data!=0 && data!="0"){
								$("#tp").css("color","red");
							}
							$("#tp").text(data);
						}
					</script>
					</#if>
					<#if isDisplay('4_3_1')>
					<li style="float:left;margin:5px;text-align:center;white-space:nowrap;width:160px;">	
						<a href="#"><img src="${gzUrl('images/khgl.png')}" height="64" width="64" /></a>
						<br/>
						<a href="${gzUrl('cwgl/skqr/initList/')}" target="content">有<font id="sk"></font>个发票待收款</a>
					</li>
					<script>
						$.get("${gzUrl('loadJobNum/')}?jobName=sk", null, callback_sk);
						function callback_sk(data){
							if(data!=0 && data!="0"){
								$("#sk").css("color","red");
							}
							$("#sk").text(data);
						}
					</script>
					</#if>
				</ul>	
				</div>
		   </#if>			
				<#if staffDimissionList?exists && staffDimissionList.size()!=0>
				<h2>
					<span>近期离职人员：</span>
				</h2>
				<div class="overflow">
					<table>
						<#list staffDimissionList as staffDimission>
						<tr>
							<td width="80"></td>
							<td style="align:left;text-align:left;">姓名：&nbsp;&nbsp;${staffDimission.staffName}&emsp;&emsp;科室：&nbsp;&nbsp;${staffDimission.departmentName}&emsp;&emsp;离职时间：&nbsp;&nbsp;${staffDimission.dimissionTime}</td>
						</tr>
						</#list>
					</table>
				</div>
				</#if>
			<#if isDisplay('6_2_1')>	
				<#if inspectionList?exists && inspectionList.size()!=0>
				<h2>
					<span>车辆年检提醒：</span>
				</h2>
				<div class="overflow">
					<table>
						<#list inspectionList as inspection>
						<tr>
							<td width="80"></td>
							<td style="align:left;text-align:left;">车牌号：&nbsp;&nbsp;${inspection.idNum}&emsp;&emsp;所有人：&nbsp;&nbsp;${inspection.belongName}&emsp;&emsp;驾驶员：&nbsp;&nbsp;${inspection.staffName}&emsp;&emsp;上次年检时间：&nbsp;&nbsp;${inspection.startTime}</td>
						</tr>
						</#list>
					</table>
				</div>
				</#if>
			</#if>
			<#if isDisplay('6_3_1')>		
				<#if insuranceList?exists && insuranceList.size()!=0>
				<h2>
					<span>车辆保险提醒：</span>
				</h2>
				<div class="overflow">
					<table>
						<#list insuranceList as insurance>
						<tr>
							<td width="80"></td>
							<td style="align:left;text-align:left;">车牌号：&nbsp;&nbsp;${insurance.idNum}&emsp;&emsp;所有人：&nbsp;&nbsp;${insurance.belongName}&emsp;&emsp;驾驶员：&nbsp;&nbsp;${insurance.staffName}&emsp;&emsp;上次年检时间：&nbsp;&nbsp;${insurance.endTime}</td>
						</tr>
						</#list>
					</table>
				</div>
				</#if>
		</#if>		
			</div>
		</div>
	</div>
</body>
</html>
