<#include "../../base_lib.ftl" />
<#list assetsInfoList as assetsInfo>
	<font size="2">资产编号：${assetsInfo.num}</font><br/>
	<font size="2">资产类别：${assetsInfo.device_type_name}</font><br/>
	<font size="2">资产名称：${assetsInfo.device_name}</font><br/>
	<font size="2">资产品牌：${assetsInfo.brand_name}</font><br/>
	<font size="2">资产型号：${assetsInfo.brand_format_name}</font><br/>
	<font size="2">使用地点：${assetsInfo.use_place_room_num?if_exists}</font><br/>
</#list>