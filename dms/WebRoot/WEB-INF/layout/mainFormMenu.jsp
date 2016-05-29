<%@page language="java" contentType="text/html; charset=utf-8"%>
<%@include file="/tagDeclare.jsp"%>
<html>
<head>
<link href="${basePath}core/css/menu.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${basePath}core/js/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		var url = "${basePath}coreAjax/mainFormMenu!getMenus.action";
		$.ajax({
			type : "GET",
			url : url,
			dataType : "text",
			async:false,
			success : function(result) {
				var res = eval('(' + result + ')');
				if (res.code == 1) {
					var html = "";
					$.each(res.bean,function(key,values){
						$(values).each(function(){
							html += "<div class='menutitler menutitlerUp'>"+this.rightName+"</div>";
							html += "<div class='menuchild'>";
							$(this.subRights).each(function(){
								html += "<div class=\"menuitem\" onclick=\"openMenu('"+this.id+"','"+this.rightName+"','"+this.rightURL+"',this);\">";
								html += this.rightName;
								html += "</div>";
							});
							html += "</div>";
						});
					});
					$(".menubox").append(html);
				} else {
					alert(res.reason);
				}
			},
			error : function() {
			}
		});
		$(".menutitler").click(
				function() {
					var obj = $(this);
					$(obj).next().slideToggle(
							"fast",
							function() {
								if ($(this).is(":hidden")) {
									$(obj).removeClass("menutitlerDown")
											.addClass("menutitlerUp");
								} else {
									$(obj).removeClass("menutitlerUp")
											.addClass("menutitlerDown");
								}
							});
				});
		$(".menu_sidebar").mouseover(function() {
			$(this).css("overflow", "auto");
		});
		$(".menu_sidebar").mouseleave(function() {
			$(this).css("overflow", "hidden");
		});
		//展开菜单
		$(".menutitler").click();
	});
	function openMenu(id, name, url, obj) {
		parent.addTab(id, name, url);
		$(".menuselected").removeClass("menuselected").addClass("menuitem");
		$(obj).removeClass("menuitem").addClass("menuselected");
	}
</script>
</head>
<body>
	<div class="menu_sidebar">
		<div class="menubox">
		</div>
	</div>
</body>
</html>