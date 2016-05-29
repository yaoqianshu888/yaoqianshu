String.prototype.replaceAll = function(reallyDo, replaceWith, ignoreCase) {
	if (!RegExp.prototype.isPrototypeOf(reallyDo)) {
		return this.replace(new RegExp(reallyDo, (ignoreCase ? "gi" : "g")),
				replaceWith);
	} else {
		return this.replace(reallyDo, replaceWith);
	}
}

function getAllChose(name) {
	var selectElems = document.getElementsByName(name);
	if (selectElems == undefined) {
		return "";
	}
	var valueStrs = "";
	for (var i = 0; i < selectElems.length; i++) {
		if (selectElems[i].checked == true && !isNull(selectElems[i].value)
				&& selectElems[i].value != 'on') {
			valueStrs += "," + selectElems[i].value;
		}
	}
	if (valueStrs != '') {
		valueStrs = valueStrs.substring(1);
	}
	return valueStrs;
}
// 删除数组中的某个元素
Array.prototype.del = function(n) {
	// n表示第几项，从0开始算起。
	// prototype为对象原型，注意这里为对象增加自定义方法的方法
	if (n < 0) // 如果n<0，则不进行任何操作。
		return this;
	else
		return this.slice(0, n).concat(this.slice(n + 1, this.length));
}
Array.prototype.clone = function() {
	var result = [];
	for (var i = 0; i < this.length; i++) {
		result[i] = this[i];
	}
	return result;
}
function isCheckboxSelected(formName) {
	var elements = eval("document." + formName + ".elements");
	var checked = false;
	for (var i = 0; i < elements.length; i++) {
		if (elements[i].type == "checkbox") {
			checked |= elements[i].checked;
		}
	}
	if (!checked) {
		alert("请选择要删除的记录");
		return false;
	}
	return true;
}

(function($) {
	$.fn.serializeJson = function() {
		var result = {};
		var array = this.serializeArray();
		$(array).each(function() {
			if (!isNull(this.name)) {
				var nameSub = this.name.split(".");
				var targetObj = result;
				for (var i = 0; i <= nameSub.length - 2; i++) {
					if (targetObj[nameSub[i]] == undefined) {
						targetObj[nameSub[i]] = {};
						targetObj = targetObj[nameSub[i]];
					} else {
						targetObj = targetObj[nameSub[i]];
					}
				}
				targetObj[nameSub[nameSub.length - 1]] = this.value;
			}
		});
		return result;
	};
})(jQuery);

function iframeResize(iframe) {
	var idocumentElement = iframe.contentWindow.document.documentElement;
	iframe.height = idocumentElement.scrollHeight;
}

/**
 * 获取当前时间
 * 
 * @return {TypeName}
 */
function currentTime() {
	var now = new Date();
	var year = now.getFullYear(); // 年
	var month = now.getMonth() + 1; // 月
	var day = now.getDate(); // 日
	var hh = now.getHours(); // 时
	var mm = now.getMinutes(); // 分
	var ss = now.getSeconds(); // 秒
	var clock = year + "-";
	if (month < 10) {
		clock += "0";
	}
	clock += month + "-";
	if (day < 10) {
		clock += "0";
	}
	clock += day + " ";

	if (hh < 10) {
		clock += "0";
	}
	clock += hh + ":";
	if (mm < 10) {
		clock += '0';
	}
	clock += mm + ":";
	if (ss < 10) {
		clock += '0';
	}
	clock += ss;
	return (clock);
}
function loadFormData(jsonObj, preName) {
	var obj = jsonObj;
	var key, value, tagName, type, arr;
	if (preName != null && preName != '') {
		preName = preName + ".";
	} else {
		preName = "";
	}
	for (x in obj) {
		key = preName + x;
		value = obj[x];
		if (typeof value == "object") {
			var inObj = value;
			for (j in inObj) {
				inKey = key + "." + j;
				value = inObj[j];
				$("[name='" + inKey + "'],[name='" + inKey + "[]']").each(
						function() {
							tagName = $(this)[0].tagName;
							type = $(this).attr('type');
							if (tagName == 'INPUT') {
								if (type == 'radio') {
									$(this).attr('checked',
											$(this).val() == value);
								} else if (type == 'checkbox') {
									arr = value.split(',');
									for (var i = 0; i < arr.length; i++) {
										if ($(this).val() == arr[i]) {
											$(this).attr('checked', true);
											break;
										}
									}
								} else {
									$(this).val(value);
								}
							} else if (tagName == 'TEXTAREA') {
								$(this).val(value);
							} else if (tagName == 'SELECT'){
								$(this).find("option[value='"+value+"']").attr("selected",true);
								$(this).trigger("chosen:updated");
							}
						});
			}
		} else {
			$("[name='" + key + "'],[name='" + key + "[]']").each(function() {
				tagName = $(this)[0].tagName;
				type = $(this).attr('type');
				if (tagName == 'INPUT') {
					if (type == 'radio') {
						$(this).attr('checked', $(this).val() == value);
					} else if (type == 'checkbox') {
						arr = value.split(',');
						for (var i = 0; i < arr.length; i++) {
							if ($(this).val() == arr[i]) {
								$(this).attr('checked', true);
								break;
							}
						}
					} else {
						$(this).val(value);
					}
				} else if (tagName == 'TEXTAREA') {
					$(this).val(value);
				} else if (tagName == 'SELECT'){
					$(this).find("option[value='"+value+"']").attr("selected",true);
					$(this).trigger("chosen:updated");
				}
			});
		}
	}
}

/**
 * 对Date的扩展，将 Date 转化为指定格式的String
 * 月(M)、日(d)、小时(h)、分(m)、秒(s)、季度(q) 可以用 1-2 个占位符，
 * 年(y)可以用 1-4 个占位符，毫秒(S)只能用 1 个占位符(是 1-3 位的数字)
 * 例子：
	(new Date()).Format("yyyy-MM-dd hh:mm:ss.S") ==> 2006-07-02 08:09:04.423
	(new Date()).Format("yyyy-M-d h:m:s.S") ==> 2006-7-2 8:9:4.18
 */
Date.prototype.format = function(fmt) { // author: luoxh
	var o = {
		"M+" : this.getMonth() + 1, // 月份
		"d+" : this.getDate(), // 日
		"H+" : this.getHours(), // 小时
		"m+" : this.getMinutes(), // 分
		"s+" : this.getSeconds(), // 秒
		"q+" : Math.floor((this.getMonth() + 3) / 3), // 季度
		"S" : this.getMilliseconds()
	// 毫秒
	};
	if (/(y+)/.test(fmt))
		fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "")
				.substr(4 - RegExp.$1.length));
	for ( var k in o)
		if (new RegExp("(" + k + ")").test(fmt))
			fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k])
					: (("00" + o[k]).substr(("" + o[k]).length)));
	return fmt;
};
