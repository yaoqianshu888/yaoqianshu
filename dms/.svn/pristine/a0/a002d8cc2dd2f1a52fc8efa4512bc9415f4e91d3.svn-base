<%@page language="java" contentType="text/html; charset=utf-8"%>
<%@include file="/tagDeclare.jsp"%>
<html>
<head>
<%@include file="/headDeclare.jsp"%>
</head>

<body height="100%">
	<div class="dmg-list" id="wrap">
		<div class="dmg-list-body">
			<table width="100%" height="100%" border="0" cellspacing="0"
				cellpadding="0">
				<tr>
					<td width="230" valign="top" class="tree">
						<ld:check mark="areaTree">
							<iframe
								src="${basePath}core/areaSearch!searchAreaForAreaTree.action"
								name="areaTree" width="230" height="600" marginwidth="0"
								marginheight="0" frameborder="0" scrolling="yes"
								style="overflow-x:hidden;"> </iframe>
						</ld:check>
					</td>
					<td valign="top">
						<ld:check mark="areaSearch">
							<iframe
								src="${basePath}core/areaSearch!search.action?superAreaId=1"
								name="areaList" width="100%" height="600" marginwidth="0"
								marginheight="0" frameborder="0"> </iframe>
						</ld:check>
					</td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>


