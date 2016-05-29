<%@page language="java" contentType="text/html; charset=utf-8"%>
<%@include file="/tagDeclare.jsp"%>
<%@include file="/headDeclare.jsp"%>
<html>
<head>
</head>
<body height="100%">
	<div class="dmg-list" id="wrap">
		<div class="dmg-list-body">
			<table width="100%" height="100%" border="0" cellspacing="0"
				cellpadding="0">
				<tr>
					<td width="230" valign="top" class="tree">
						<ld:check mark="rightTree">
							<iframe
								src="${basePath}core/rightSearch!searchRightsForRightTree.action"
								name="rightTree" id="rightTree" width="230" marginwidth="0"
								onscroll="iframeResize(this);" marginheight="0" frameborder="0"
								style="height:500px; overflow-x:hidden;overflow-y:auto; ">
							</iframe>
						</ld:check>
					</td>
					<td valign="top" style="paddint-top:10px;">
						<ld:check mark="rightSearch">
							<iframe
								src="${basePath}core/rightSearch!searchRightByUpRightId.action?upRightId=1"
								id="rightList" name="rightList" width="100%" height="600px"
								marginwidth="0" marginheight="0"
								frameborder="0" onscroll="iframeResize(this);" > </iframe>
						</ld:check>
					</td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>