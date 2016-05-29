<%@page language="java" contentType="text/html; charset=utf-8"%>
<%@include file="/tagDeclare.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@include file="/headDeclare.jsp"%>
<link rel="stylesheet" href="${basePath}core/plugins/ztree/skin/zTree.css"
	type="text/css"></link>
	<link rel="stylesheet"
		href="${basePath}core/plugins/ztree/skin/zTreeStyle/zTreeStyle.css"
		type="text/css"></link>
		<script type="text/javascript"
			src="${basePath}core/plugins/ztree/jquery.ztree.core-3.5.js"></script>
		<script type="text/javascript"
			src="${basePath}core/plugins/ztree/jquery.ztree.excheck-3.5.js"></script>
		<script type="text/javascript">
			var rightTreeIdArray = [];
			var currendLeftId ;
			function changeLeftRight(rightId) {
				document.getElementById('rightTree' + currendLeftId).style.display = "none";
				document.getElementById('rightTree' + rightId).style.display = "";
				currendLeftId = rightId;
			}
			function checkSubmit() {
				ldDialog.confirm("是否确定对角色权限进行修改？", function() {
					var selectStr = "";
					for (var i = 0; i < rightTreeIdArray.length; i++) {
						var treeObj = $.fn.zTree.getZTreeObj("rightTree"
								+ rightTreeIdArray[i]);
						var nodes = treeObj.getCheckedNodes(true);
						for (var j = 0; j < nodes.length; j++) {
							selectStr += "," + nodes[j].id;
						}
					}
					if (!isNull(selectStr)) {
						selectStr = selectStr.substring(1);
					}
					$("#selectStr").val(selectStr);
					submitForm();
				});
			}
			function submitForm(){
				var url = "${basePath}coreAjax/roleUpdateRight!updateRight.action";
				$.ajax({
					type : "POST",
					url : url,
					dataType : "text",
					data : $("#submitForm").serialize(),
					success : function(result) {
						var res = JSON.parse(result);
						if (res.code == 1) {
							ldDialog.tips("处理成功！");
							ldDialog.close();
						} else {
							ldDialog.alert(res.reason);
							ldDialog.unmask();
						}
					},
					error : function() {

					}
				});
			}
			var leftSetting = {
				view : {
					dblClickExpand : dblClickExpand
				},
				data : {
					simpleData : {
						enable : true,
						pIdKey : "upId"
					}
				}
			};
			var rightSetting = {
				check : {
					enable : true
				},
				view : {
					dblClickExpand : dblClickExpand
				},
				data : {
					simpleData : {
						enable : true,
						pIdKey : "upId"
					}
				}
			};
			function dblClickExpand(treeId, treeNode) {
				return treeNode.level > 0;
			}
			$(function() {
				
				var url = "${basePath}coreAjax/roleUpdateRight!getRightTree.action?targetRoleId=${targetRoleId}";
				$.ajax({
					type : "POST",
					url : url,
					dataType : "text",
					async:false,
					success : function(result) {
						var res = JSON.parse(result);
						if (res.code == 1) {
							var role = res.bean;
							$("#roleName").text(role.roleName);
							
							var firstRightJson = JSON.parse(res.firstRightJson);
							$.fn.zTree.init($("#firstRightTree"), leftSetting, firstRightJson);
							var rightNodeTmp;
							var rightTreeList = res.rightTreeList;
							
							var html = "";
							for(var i=0; i<rightTreeList.length; i++){
								var item = rightTreeList[i];
								html += "<ul id=\"rightTree"+item.id+"\" class=\"ztree\" style=\"width: 500px;border: 0px;";
								if(i != 0){
									html += "display: none;"
								}
								html += "\"></ul>";
							}
							$("#rightTreeTd").html(html);
							
							for(var i=0; i<rightTreeList.length; i++){
								var item = rightTreeList[i];
								if(i == 0){
									currendLeftId = item.id;
								}
								rightNodeTmp = JSON.parse(item.treeJson);
								$.fn.zTree.init($("#rightTree"+item.id), rightSetting,
										rightNodeTmp);
								rightTreeIdArray.push(item.id);
								
							}
							ldDialog.unmask();
						} else {
							ldDialog.alert(res.reason);
							ldDialog.unmask();
						}
					},
					error : function() {
					}
				});
				
			});
		</script>
</head>
<body>
	<form id="submitForm" name="submitForm" method="post">
		<input type="hidden" name="targetRoleId" value="${targetRoleId}" />
		<input type="hidden" name="selectStr" value="" id="selectStr" />
		<div class="yhbox" style="margin-bottom:50px; ">
			<table width="100%" border="0" cellspacing="0" cellpadding="0"
				style="height: 420px">
				<tr>
					<td width="180" class="yhbox2" valign="top">
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td class="treetitle">角色名称</td>
							</tr>
							<tr>
								<td>
									<ul id="firstRightTree" class="ztree"
										style="width: 260px;height: 480px;border: 0px;"></ul>
								</td>
							</tr>
						</table>
					</td>
					<td valign="top" class="yhbox3">
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td class="treetitle" id="roleName"></td>
							</tr>
							<tr>
								<td id="rightTreeTd">
									
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</div>
	</form>
	<div class="dialogBottom">
		<div class="btns">
			<ld:check mark="roleUpdateRightCommit">
				<input type="button" value="确 定" class="ldBtnGreen"
					onclick="return checkSubmit();" />
			</ld:check>
			&nbsp;
			<input type="button" value="关 闭" class="ldBtnGray"
				onclick="ldDialog.close();" />
		</div>
	</div>
	</form>
</body>
</html>