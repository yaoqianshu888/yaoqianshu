<%@page language="java" contentType="text/html; charset=utf-8"%>
<%@include file="/tagDeclare.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<%@include file="/headDeclare.jsp"%>
<script type="text/javascript">
	function checkSubmit() {
		if (!checkData(true, 'numgroup.groupName', "群组名称", 2, 30)) {
			return false;
		}
		if (choseNum=="") {
			ldDialog.alert("请选择群组号码！");
			return false;
		}
		
		if (!checkData(false, 'numgroup.memo', "备注", 1, 255)) {
			return false;
		}
		submitForm();
		
	}
	function submitForm(){
		var url = "${basePath}moneyJinliang/numgroupInsert!insertNumgroup.action";
		$.ajax({
			type : "POST",
			url : url,
			dataType : "json",
			data : $("#submitForm").serialize(),
			success : function(res) {
				if (res[0].code == 1) {
					//ldDialog.tips("新增成功");
					ldDialog.close(res[0].returnValue);
				} else {
					ldDialog.alert(res[0].reason);
					ldDialog.unmask();
				}
				
			},
			error : function() {
				alert("新增出错！");
			}
		});
	}
	
	var choseNum="";
	
	function choose(num){
		var spNum=choseNum.split(",");
		var temp="";
		var isflag=false;
		for(var i=0;i<spNum.length;i++){
			if(spNum[i]==num){
				isflag=true;
			}else if(spNum[i]!=""){
				temp+=spNum[i]+",";
				
			}
		}
		
		choseNum=temp;
		if(isflag){
			$("#t"+num).css("background-color","white");
		}else{
			choseNum+=num+",";
			$("#t"+num).css("background-color","red");
		}
		$("#numgroup\\.groupNum").val(choseNum);
	}
</script>
<style>
	.datagrid{
	empty-cells: show;
	border-collapse: collapse;
	margin: 0 auto;
	}
	.datagrid td {
	border-bottom-width: 1px;
	border-bottom-style: solid;
	border-bottom-color: #dadada;
	border-width: 1px;
	border-style: solid;
	border-color:#dadada;
	height: 34px;
	text-align: center;
	color: #555555;
	font-size: 12px;
	line-height: 34px;
	}
	.datagrid tr:HOVER {
	cursor:pointer;
	}
	
</style>
</head>
<body>
	<form method="post" id="submitForm">
		<div class="dialogTop">
			<table width="500" border="0" align="center" cellpadding="0"
				cellspacing="10">
				<tr>
					<td width="70" align="right">
						<FONT color=red>*</FONT>群组名称：
					</td>
					<td>
						<input type="text" name="numgroup.groupName" id="numgroup.groupName" 
							value="${numgroup.groupName}" class="ldText" maxlength="30" />
						<input type="hidden" name="numgroup.groupNum" id="numgroup.groupNum"/>
					</td>
				</tr>
				
				<tr>
					<td width="80" align="right">
						<FONT color=red>*</FONT>请选择号码：
					</td>
					<td>
						<table  width="100%" border="0" cellspacing="1" cellpadding="0" class="datagrid">
							<tr>
								<td onclick="choose(1)" id="t1">1</td>
								<td onclick="choose(13)" id="t13">13</td>
								<td onclick="choose(25)" id="t25">25</td>
								<td onclick="choose(37)" id="t37">37</td>
								<td onclick="choose(49)" id="t49">49</td>
							</tr>
							<tr>
								<td onclick="choose(2)" id="t2">2</td>
								<td onclick="choose(14)" id="t14">14</td>
								<td onclick="choose(26)" id="t26">26</td>
								<td onclick="choose(38)" id="t38">38</td>
							</tr>
							<tr>
								<td onclick="choose(3)" id="t3">3</td>
								<td onclick="choose(15)" id="t15">15</td>
								<td onclick="choose(27)" id="t27">27</td>
								<td onclick="choose(39)" id="t39">39</td>
							</tr>
							<tr>
								<td onclick="choose(4)" id="t4">4</td>
								<td onclick="choose(16)" id="t16">16</td>
								<td onclick="choose(28)" id="t28">28</td>
								<td onclick="choose(40)" id="t40">40</td>
							</tr>
							<tr>
								<td onclick="choose(5)" id="t5">5</td>
								<td onclick="choose(17)" id="t17">17</td>
								<td onclick="choose(29)" id="t29">29</td>
								<td onclick="choose(41)" id="t41">41</td>
							</tr>
							<tr>
								<td onclick="choose(6)" id="t6">6</td>
								<td onclick="choose(18)" id="t18">18</td>
								<td onclick="choose(30)" id="t30">30</td>
								<td onclick="choose(42)" id="t42">42</td>
							</tr>
							<tr>
								<td onclick="choose(7)" id="t7">7</td>
								<td onclick="choose(19)" id="t19">19</td>
								<td onclick="choose(31)" id="t31">31</td>
								<td onclick="choose(43)" id="t43">43</td>
							</tr>
							<tr>
								<td onclick="choose(8)" id="t8">8</td>
								<td onclick="choose(20)" id="t20">20</td>
								<td onclick="choose(32)" id="t32">32</td>
								<td onclick="choose(44)" id="t44">44</td>
							</tr>
							<tr>
								<td onclick="choose(9)" id="t9">9</td>
								<td onclick="choose(21)" id="t21">21</td>
								<td onclick="choose(33)" id="t33">33</td>
								<td onclick="choose(45)" id="t45">45</td>
							</tr>
							<tr>
								<td onclick="choose(10)" id="t10">10</td>
								<td onclick="choose(22)" id="t22">22</td>
								<td onclick="choose(34)" id="t34">34</td>
								<td onclick="choose(46)" id="t46">46</td>
							</tr>
							<tr>
								<td onclick="choose(11)" id="t11">11</td>
								<td onclick="choose(23)" id="t23">23</td>
								<td onclick="choose(35)" id="t35">35</td>
								<td onclick="choose(47)" id="t47">47</td>
							</tr>
							<tr>
								<td onclick="choose(12)" id="t12">12</td>
								<td onclick="choose(24)" id="t24">24</td>
								<td onclick="choose(36)" id="t36">36</td>
								<td onclick="choose(48)" id="t48">48</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td align="right">备注：</td>
					<td>
						<textarea name="numgroup.memo" id="numgroup.memo" cols="30" rows="5"
							maxlength="255">${numgroup.memo}</textarea>
					</td>
				</tr>
			</table>
		</div>
		<div class="dialogBottom">
			<div class="btns">
				<ld:check mark="projectInsertCommit">
					<input type="button" value="确 定" class="ldBtnGreen"
						onclick="return checkSubmit();" />
				</ld:check>
				<input type="button" value="关 闭" class="ldBtnGray"
					onclick="ldDialog.close();" />
			</div>
		</div>
	</form>
</body>
</html>

