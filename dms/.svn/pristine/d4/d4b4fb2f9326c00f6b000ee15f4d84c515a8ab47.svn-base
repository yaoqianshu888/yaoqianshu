<%@page language="java" contentType="text/html; charset=utf-8"%>
<script type="text/javascript">
	$(function() {
		initSkip();
	});
	function initSkip(){
		$('.skipButton').bind('click mouseover', function() {
			var skiplayer = $(this).parent().next();
			if (skiplayer.is(':hidden')) {
				skiplayer.fadeIn(200);
			} else {
				skiplayer.fadeOut(200);
			}
		});
		$('.skip').mouseleave(function() {
			$(this).fadeOut(200);
		});
		$('.pagebutton').click(function() {
			var num = $(this).parent().parent().find('.ldText').val();
			if (!isNum(num)) {
				ldDialog.alert("页码要是数字，请输入数字");
				return false;
			}
			var pageTotal = parseInt($("#pageTotal").html());
			if(pageTotal==0){
				pageTotal=1;
			}
			if (num > pageTotal) {
				ldDialog.alert("请输入1-" + pageTotal + "之间的数字");
				return false;
			}
			$("form[name='pagerForm']")[0]['pager.curPageNum'].value = num;
			$("form[name='pagerForm']").submit();
			return false;
		});
		$('.ajaxPagebutton').click(function() {
			var num = $(this).parent().parent().find('.ldText').val();
			if (!isNum(num)) {
				ldDialog.alert("页码要是数字，请输入数字");
				return false;
			}
			var pageTotal = parseInt($("#pageTotal").html());
			if(pageTotal==0){
				pageTotal=1;
			}
			if (num > pageTotal) {
				ldDialog.alert("请输入1-" + pageTotal + "之间的数字");
				return false;
			}
			loadData(num);
			return false;
		});
	}
</script>