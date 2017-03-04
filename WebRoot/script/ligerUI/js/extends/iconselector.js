var jiconlist, winicons, currentComboBox;
$(function ()
{
    jiconlist = $("body > .iconlist:first");
    if (!jiconlist.length) jiconlist = $('<ul class="iconlist"></ul>').appendTo('body');
});
 
$(".iconlist li").live('mouseover', function ()
{
    $(this).addClass("over");
}).live('mouseout', function ()
{
    $(this).removeClass("over");
}).live('click', function ()
{
    if (!winicons) return;
    var src = $("div", this).attr("src");
    if (currentComboBox){
    	currentComboBox._changeValue(src,src);
    	var inputText=currentComboBox.getInputText();
    	if(inputText.valid){
    		inputText.valid();
    	}
    }
    winicons.hide();
});

function f_openIconsWin(url)
{
    if (winicons)
    {
        winicons.show();
        return;
    }
    winicons = $.ligerDialog.open({
        title: '选取图标',
        target: jiconlist,
        width: 410, height: 150, modal: true
    });
    if (!jiconlist.attr("loaded")){
        $.ajax({
        	cache: false,
            async: true,
            url: url||window["basePath"]+"/manage/index!menuIcon.do",
            dataType: 'json', 
			type: 'post',
            success: function (data){
            	if(data){
            		for (var i = 0, l = data.length; i < l; i++){
                    	var icon = data[i];
                    	jiconlist.append("<li><div class='l-icon l-icon-"+icon+"' src='"+icon+"'></div></li>");
                	}
            	}
            	jiconlist.attr("loaded", true);
            },
            error:function(){
            	var tip=$.ligerDialog.tip({title:'提示信息',content:'图片载入失败!'});
        		setTimeout(function (){
                	if(tip){
                   		tip.close();
                    }
                }, 5000);
            }
        });
    }
}