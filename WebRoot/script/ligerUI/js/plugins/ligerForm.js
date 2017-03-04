/**
* jQuery ligerUI 1.1.9
* 
* http://ligerui.com
*  
* Author daomi 2012 [ gd_star@163.com ] 
* 
*/
(function ($)
{
    $.fn.ligerForm = function ()
    {
        return $.ligerui.run.call(this, "ligerForm", arguments);
    };

    $.ligerDefaults = $.ligerDefaults || {};
    $.ligerDefaults.Form = {
        //控件宽度
        inputWidth: 180,
        //标签宽度
        labelWidth: 90,
        //间隔宽度
        space: 40,
        rightToken: '：',
        //标签对齐方式
        labelAlign: 'left',
        //控件对齐方式
        align: 'left',
        //字段
        fields: [],
        //创建的表单元素是否附加ID
        appendID: true,
        //生成表单元素ID的前缀
        prefixID: "",
        buttons: null,              //按钮组
        buttonsNewLine:true,
        //json解析函数
        toJSON: $.ligerui.toJSON
    };

    //@description 默认表单编辑器构造器扩展(如果创建的表单效果不满意 建议重载)
    //@param {jinput} 表单元素jQuery对象 比如input、select、textarea 
    $.ligerDefaults.Form.editorBulider = function (jinput,field)
    {
        //这里this就是form的ligerui对象
        var g = this, p = this.options;
        var inputOptions = {};
        if (p.inputWidth) 
        	inputOptions.width = p.inputWidth;
        if(field&&field.options){
        	inputOptions=$.extend(inputOptions,field.options);
        }
        if (jinput.is("select"))
        {
            jinput.ligerComboBox();
        }
        else if (jinput.is(":text") || jinput.is(":password"))
        {
            var ltype = jinput.attr("ltype");
            switch (ltype)
            {
                case "select":
                case "combobox":
                    jinput.ligerComboBox(inputOptions);
                    break;
                case "spinner":
                    jinput.ligerSpinner(inputOptions);
                    break;
                case "date":
                    jinput.ligerDateEditor(inputOptions);
                    break;
                case "float":
                case "number":
                    inputOptions.number = true;
                    jinput.ligerTextBox(inputOptions);
                    break;
                case "int":
                case "digits":
                    inputOptions.digits = true;
                default:
                    jinput.ligerTextBox(inputOptions);
                    break;
            }
        }
        else if (jinput.is(":radio"))
        {
            jinput.ligerRadio(inputOptions);
        }
        else if (jinput.is(":checkbox"))
        {
            jinput.ligerCheckBox(inputOptions);
        }
        else if (jinput.is("textarea"))
        {
            jinput.addClass("l-textarea");
            if(field&&field.width){
            	jinput.css("width",field.width-2);
            }
            if(field&&field.height){
            	jinput.css("height",field.height);
            }
        }
    };

    //表单组件
    $.ligerui.controls.Form = function (element, options)
    {
        $.ligerui.controls.Form.base.constructor.call(this, element, options);
    };

    $.ligerui.controls.Form.ligerExtend($.ligerui.core.UIComponent, {
        __getType: function ()
        {
            return 'Form';
        },
        __idPrev: function ()
        {
            return 'Form';
        },
        _init: function ()
        {
            $.ligerui.controls.Form.base._init.call(this);
        },
        _render: function ()
        {
            var g = this, p = this.options;
            var jform = $(this.element);
            //自动创建表单
            if (p.fields && p.fields.length)
            {
                if (!jform.hasClass("l-form"))
                    jform.addClass("l-form");
                var out = [];
                var appendULStartTag = false;
                $(p.fields).each(function (index, field)
                {
                    var name = field.name || field.id;
                    if (!name) return;
                    if (field.type == "hidden")
                    {
                        out.push('<input type="hidden" id="' + name + '" name="' + name + '" value="'+(field.value||"")+'" />');
                        return;
                    }
                    var newLine = field.renderToNewLine || field.newline;
                    if (newLine == null) newLine = true;
                    if (field.merge) newLine = false;
                    if (field.group) newLine = true;
                    if (newLine)
                    {
                        if (appendULStartTag)
                        {
                            out.push('</ul>');
                            appendULStartTag = false;
                        }
                        if (field.group)
                        {
                            out.push('<div class="l-group');
                            if (field.groupicon)
                                out.push(' l-group-hasicon');
                            out.push('">');
                            if (field.groupicon)
                                out.push('<img src="' + field.groupicon + '" />');
                            out.push('<span>' + field.group + '</span></div>');
                        }
                        out.push('<ul>');
                        appendULStartTag = true;
                    }
                    //append label
                    out.push(g._buliderLabelContainer(field));
                    //append input 
                    out.push(g._buliderControlContainer(field));
                    //append space
                    out.push(g._buliderSpaceContainer(field));
                });
                if (appendULStartTag)
                {
                    out.push('</ul>');
                    appendULStartTag = false;
                }
                jform.append(out.join(''));
            }
            //生成ligerui表单样式
            
            $("input,select,textarea,ul", jform).each(function ()
            {
            	var field=null;
            	for(var i=0;i<p.fields.length;i++){
            		var name=$(this).attr("name");
            		if(name&&name==p.fields[i]["name"]){
            			field=p.fields[i];
            		}
            	}
                p.editorBulider.call(g, $(this),field);
            });
            
            //button
            if (p.buttons){
            	if(p.buttonsNewLine){
            		var jbuttons = $('<ul class="l-form-buttons"></ul>').appendTo(jform);
                	$(p.buttons).each(function (){
                    	var jbutton = $('<li><div></div></li>').appendTo(jbuttons);
                    	$("div:first", jbutton).ligerButton(this);
                	});
            	}else{
            		var jbuttons=$("ul:last",jform);
            		$(p.buttons).each(function (){
                    	var jbutton = $('<li><div></div></li>').appendTo(jbuttons);
                    	$("div:first", jbutton).ligerButton(this);
                	});
            	}
            }
            
        },
        //标签部分
        _buliderLabelContainer: function (field)
        {
            var g = this, p = this.options;
            var label = field.label || field.display;
            var labelWidth = field.labelWidth || field.labelwidth || p.labelWidth;
            var labelAlign = field.labelAlign || p.labelAlign;
            if (label) label += p.rightToken;
            var out = [];
            if(field.display){
            	out.push('<li style="');
            	if (labelWidth)
                {
                    out.push('width:' + labelWidth + 'px;');
                }
                if (labelAlign)
                {
                    out.push('text-align:' + labelAlign + ';');
                }
                out.push('">');
                if (label)
                {
                    out.push(label);
                }
                out.push('</li>');
            }else{
            	out.push('<li>');
            	out.push('</li>');
            }
            return out.join('');
        },
        //控件部分
        _buliderControlContainer: function (field)
        {
            var g = this, p = this.options;
            var width = field.width || p.inputWidth;
            var align = field.align || field.textAlign || field.textalign || p.align;
            var out = [];
            out.push('<li style="');
            if (width)
            {
                out.push('width:' + width + 'px;');
            }
            if (align)
            {
                out.push('text-align:' + align + ';');
            }
            out.push('">');
            out.push(g._buliderControl(field));
            out.push('</li>');
            return out.join('');
        },
        //间隔部分
        _buliderSpaceContainer: function (field)
        {
            var g = this, p = this.options;
            var spaceWidth = field.space || field.spaceWidth || p.space;
            var out = [];
            out.push('<li style="');
            if (spaceWidth)
            {
                out.push('width:' + spaceWidth + 'px;');
            }
            out.push('">');
            out.push('</li>');
            return out.join('');
        },
        clearFieldValue:function(fieldName,clearContent){
        	var field=$.ligerui.get(fieldName);
        	if(field){
        		if(field.__getType()=="ComboBox"){
        			field._changeValue();
        			if(clearContent){
        				field.clearContent();
        			}
        		}
        	}
        },
        getFieldsValue:function(){
        	var g = this, p = this.options;
        	var params={};
        	$.each(p.fields,function(index, field){
        		var comp=$.ligerui.get(field.name)||$("#"+field.name.replace(/\./g,"\\."));
        		var pair={};
        		pair[field.name]="";
        		try{
        			var value=comp._getValue();
        			pair[field.name]=(value==undefined || value=='null')?"":value;
        		}catch(e){
        			if(comp.val){
        				var value=comp.val();
        				pair[field.name]=(value==undefined || value=='null')?"":value;
        			}
        		}
        		$.extend(params,pair);
        	});
        	return params;
        },
        setFieldsValue:function(object){
        	var g = this, p = this.options;
        	for(var key in object){
        		var field=$.ligerui.get(key)||$("#"+key.replace(/\./g,"\\."));
        		if(field){
        			try{
        				field._setValue(object[key]);
        			}catch(e){
        				if(field.val){
        					field.val(object[key]);
        				}
        			}
				}		
        	}
        	
        },
        removeValidate:function(fieldName,validate){
        	var g = this, p = this.options;
        	var field=null;
        	for(var i=0;i<p.fields.length;i++){
        		if(p.fields[i].name==fieldName){
        			field=p.fields[i];
        		}
        	}
        	if(field&&validate){
        		var element=$("#"+field.name);
        		element.rules("remove",validate);
        		element.valid();
        		if (element.hasClass("l-textarea")){
					element.removeClass("l-textarea-invalid");
				}else if (element.hasClass("l-text-field")){
					element.parent().removeClass("l-text-invalid");
				}
				$(element).removeAttr("title").ligerHideTip();
        		field.validate=element.rules();
        	}
        },
        addValidate:function(fieldName,validate){
        	var g = this, p = this.options;
        	var field=null;
        	for(var i=0;i<p.fields.length;i++){
        		if(p.fields[i].name==fieldName){
        			field=p.fields[i];
        		}
        	}
        	if(field&&validate){
        		$("#"+field.name).rules("add",validate);
        		$("#"+field.name).valid();
        		var rules=$("#"+field.name).rules();
        		field.validate=rules;
        	}
        },
        _buliderControl: function (field)
        {
            var g = this, p = this.options;
            var width = field.width || p.inputWidth;
            var name = field.name || field.id;
            var out = [];
            if (field.comboboxName && field.type == "select")
            {
                out.push('<input type="hidden" id="' + p.prefixID + name + '" name="' + name + '" value="'+(field.value||"")+'" />');
            }
            if (field.textarea || field.type == "textarea")
            {
                out.push('<textarea ');
            }
            else if (field.type == "checkbox")
            {
                out.push('<input type="checkbox" ');
            }
            else if (field.type == "radio")
            {
                out.push('<input type="radio" ');
            }
            else if (field.type == "password")
            {
                out.push('<input type="password" ');
            }
            else
            {
                out.push('<input type="text" ');
            }
            if(field.id){
            	out.push('id="' + field.id + '" ');
            }
 			if(field.value){
 				out.push('value="' + field.value + '" ');
 			}
            if (field.cssClass)
            {
                out.push('class="' + field.cssClass + '" ');
            }
            if (field.type)
            {
                out.push('ltype="' + field.type + '" ');
            }
            if (field.attr)
            {
                for (var attrp in field.attr)
                {
                    out.push(attrp + '="' + field.attr[attrp] + '" ');
                }
            }
            if (field.comboboxName && field.type == "select")
            {
                out.push('name="' + field.comboboxName + '"');
                if (p.appendID)
                {
                    out.push(' id="' + p.prefixID + field.comboboxName + '" ');
                }
            }
            else
            {
                out.push('name="' + name + '"');
                if (p.appendID)
                {
                    out.push(' id="' + name + '" ');
                }
            }
            
            //参数
            var fieldOptions = $.extend({
                width: width - 2
            }, field.options || {});
            out.push(" ligerui='" + p.toJSON(fieldOptions) + "' ");
            //验证参数
            if (field.validate)
            {
                out.push(" validate='" + p.toJSON(field.validate) + "' ");
            }
            out.push('/>');
            return out.join('');
        }
    });
})(jQuery);