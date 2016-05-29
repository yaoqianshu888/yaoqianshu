/**
 *
 * ld文档权限开关
 * Created by linqz on 2015/8/21.
 */
(function($) {

    $.fn.ldRightSwitch = function(options) {
        options = $.extend({
            labels : [ 'YES', 'NO' ]
        }, options);
        return this.each(function() {
            var originalCheckBox = $(this), labels = [];
            if (originalCheckBox.data('on')) {
                labels[0] = originalCheckBox.data('on');
                labels[1] = originalCheckBox.data('off');
            } else
                labels = options.labels;
            var htmlStr = '<span class="tzCheckBox '
                + (this.checked ? 'checked' : '')
                + '"><span class="tzCBContent">'
                + labels[this.checked ? 0 : 1]
                + '</span><span class="tzCBPart"></span></span>';
            var checkBox = $(htmlStr);
            checkBox.insertAfter(originalCheckBox.hide());//
            if ($(this).attr('disabled') != 'disabled') {
                checkBox.click(function() {
                    if(!originalCheckBox.hasClass("disabled")){
                        checkBox.toggleClass('checked');
                        var isChecked = checkBox.hasClass('checked');
                        originalCheckBox.attr('checked', isChecked);
                        checkBox.find('.tzCBContent').html(
                            labels[isChecked ? 0 : 1]);
                    }
                });
                originalCheckBox.bind('change', function() {
                    checkBox.click();
                });
            }
        });
    };

})(jQuery);

var ldRightSwitch = new Object();

ldRightSwitch.on = function(selector){
    $(selector).each(function() {
        var ls = $(this).next();
        if(ls.hasClass("tzCheckBox") && !ls.hasClass("checked")){
            $(ls).click();
        }
    });
};


ldRightSwitch.off = function(selector){
    $(selector).each(function() {
        var ls = $(this).next();
        if(ls.hasClass("tzCheckBox") && ls.hasClass("checked")){
            $(ls).click();
        }
    });
};


ldRightSwitch.disabled = function(selector,isDisabled){
    $(selector).each(function() {
        $(this).attr("disabled", isDisabled);
        if(isDisabled){//����
            $(this).addClass("disabled");
        }else{
            $(this).removeClass("disabled");
        }
    });
};

$(function() {
    try {
        initLdRightSwitch();
    } catch (e) {
    }
});

var initLdRightSwitch = function() {
    $(".ldRightSwitch").ldRightSwitch({
        labels : [ '有权', '无权' ]
    });
}
