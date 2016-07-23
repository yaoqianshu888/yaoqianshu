<%@page language="java" contentType="text/html; charset=utf-8"%>
<%@include file="/tagDeclare.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<%@include file="/headDeclare.jsp"%>
<script type="text/javascript">
	if('${insertOk }'=='1'){
		ldDialog.alert("提交成功!");
	}else if('${insertOk }'=='2'){
		ldDialog.alert("未填写数据!");
	}
	
	function searchApprentice(curPageNum){
		$('#pagenum').val(curPageNum);
		$('#apprenticeForm').action="${basePath}moneyJinliang/chargeNumber!searchApprenticeByInfo.action";
		$('#apprenticeForm').submit();
		
	}
	
	function chooseApprentice(id,apprenticeName){
		$("#apprentice\\.id").val(id);
		$("#choseName").html(apprenticeName);
	}
	
    function checkSubmit(){
		if($("#apprentice\\.id").val()==''){
			ldDialog.alert("请先选择下家！");
			return false;
		}
		var isNo=0;
		var inputValue="";
		$("input:[type='text']").each(function(){
			if ($(this).val()!='' && !isDecimal($(this).val())) {
				isNo=1;  //出错
			}else if($(this).val()!='' && isDecimal($(this).val())){
				inputValue+=$(this).attr("name")+":"+$(this).val()+","
			}
		});
		if(isNo==1){
			ldDialog.alert("金额输入有误！");
			return false;
		}
		
		ldDialog.openMini("${basePath}moneyJinliang/chargeNumber!confirmNum.action?conNum="+inputValue,
			"确认提交", 
			function(window) {
				var returnValue = window.returnValue;
				if (returnValue == undefined) {//无返回值 直接关闭 
					return true;
				} else {//有返回值 处理一些事
					//ldDialog.tips("处理成功！");
					document.subForm.submit();
					return true;
				}
		});
		
	
	}
	
	function showDetail(id,apprenticeName){
		ldDialog.openMedium("${basePath}moneyJinliang/chargeNumber!showDetail.action?apprentice.id="+id,
			"明细查询("+apprenticeName+")     当前期:  "+${nowPeriod.period }, 
			function(window) {
				var returnValue = window.returnValue;
				if (returnValue == undefined) {//无返回值 直接关闭 
					return true;
				} else {//有返回值 处理一些事
					ldDialog.tips("处理成功！");
					document.pagerForm.submit();
					return true;
				}
		});
	}
	
	//倒计时
	function GetRTime(){
		var lotteryTime='${ nowPeriod.lotteryTime.year+1900}'+'/'+'${ nowPeriod.lotteryTime.month+1}'+'/'+'${ nowPeriod.lotteryTime.date}'+' '+'${ nowPeriod.lotteryTime.hours}'+':'+'${ nowPeriod.lotteryTime.minutes}'+':'+'${ nowPeriod.lotteryTime.seconds}';
	    var EndTime= new Date(lotteryTime);
	    var NowTime = new Date();
	    var t =EndTime.getTime() - NowTime.getTime();
	    var d=0;
	    var h=0;
	    var m=0;
	    var s=0;
	    if(t>=0){
	      d=Math.floor(t/1000/60/60/24);
	      h=Math.floor(t/1000/60/60%24);
	      m=Math.floor(t/1000/60%60);
	      s=Math.floor(t/1000%60);
	    }
	 
	 
	    document.getElementById("day").innerHTML = d;
	    document.getElementById("hour").innerHTML = h;
	    document.getElementById("min").innerHTML = m;
	    document.getElementById("sec").innerHTML = s;
	  }
  	setInterval(GetRTime,0);
	
	

   
   
   document.onkeydown=function(e){
	  e=window.event||e;
	  //回车提交表单
	  if (e.keyCode==13) {
          checkSubmit();
    	　}
	  //键盘上下左右控制光标
	  var act = document.activeElement.name;
	  switch(e.keyCode){
	    case 37: //左键
	       if(parseInt(act)<=12){
	      	act=parseInt(act)+49;
	      }else if(parseInt(act)==50){
	     	 act=parseInt(act)-2;
	      }else if(parseInt(act)==51){
	     	 act=parseInt(act)-2;
	      }else if(parseInt(act)>49){
	     	 act=parseInt(act)-14;
	      }
	      else{
	      	act=parseInt(act)-12;
	      }
	      $("[name='"+act+"']").focus();
	      
	      break;
	    case 38: //向上键
	      if(parseInt(act)==1){
	      	act=parseInt(act)+61;
	      }if(parseInt(act)==50){
	      	act=parseInt(act)-1;
	      }else{
	      	act=parseInt(act)-1;
	      }
	      
	      $("[name='"+act+"']").focus();
	      break;
	    case 39: //右键
	       if(parseInt(act)>49){
	      	act=parseInt(act)-49;
	      }else if(parseInt(act)==49){
	     	 act=parseInt(act)+2;
	      }else if(parseInt(act)==48){
	     	 act=parseInt(act)+2;
	      }else if(parseInt(act)+12>49){
	      	act=parseInt(act)+14;
	      }
	      else{
	      	act=parseInt(act)+12;
	      }
	      $("[name='"+act+"']").focus();
	      break;
	    case 40: //向下键
	       act=parseInt(act)+1;
	      $("[name='"+act+"']").focus();
	      break;
	    default:
	      break;
	  }
	}

</script>
<style >
.ldPager div.skip{right:70%}
</style>
</head>
<body onkeydown="keyDown(event);">
	<div id="rightcontent">
		<div id="rightcontent1">
			<div class="yhlist">
					<div class="conditionsbox">
						<div id="conditionsbox">
							<div class="yhlist1">
								<div style="margin-left:8%"><span style="color:#ffb800;font-weight:bold">上一期:</span>第 <span style="color:#ffb800;font-weight:bold">${prePeriod.period }</span> 期开奖号码：<span style="color:#ffb800;font-weight:bold">${prePeriod.lotteryResult }</span>  <span style="margin-left:8%">本期：<span style="color:#ffb800;font-weight:bold;color:red;margin-right:8%;font-size:22px">${nowPeriod.period } </span>开奖时间：<span style="color:#ffb800;font-weight:bold"><f:formatDate value="${ nowPeriod.lotteryTime}" pattern="yyyy-MM-dd  HH:mm" /></span></span>    <span style="margin-left:8%">剩余投注时间：<span style="color:#ffb800;font-weight:bold"><span id="day">0</span> 天  <span id="hour">00</span>:<span id="min">00</span>:<span id="sec">00</span></span></span></div>
							</div>
						</div>
							
						</div>
					</div>
			</div>
				<div style="width:24%;float:left;margin-left:10px;height:600px">
				
				<iframe class="contentFrame" width="100%" height="100%"
								src="${basePath}moneyJinliang/chargeNumber!searchApprenticeByInfo.action?apprentice.apprenticeName="
								frameborder="0" scrolling="no"></iframe>
				</div>
			<form method="post" name="subForm" id="subForm" action="${basePath}moneyJinliang/chargeNumber!submitNumber.action">
			<div style="width:50%;float:left;margin-left:5px;">
					<input type="hidden" name="apprentice.id" id="apprentice.id" value=""/>
					<input type="hidden" name="nowPeriod.id" id="nowPeriod.id" value="${ nowPeriod.id}"/>
					<table id="contentTable" width="100%" border="0" cellspacing="1" cellpadding="0" class="ld-datagrid">
						<tr>
							<td>组合</td>
							<td>金额</td>
							<td>号码</td>
							<td>金额</td>
							<td>号码</td>
							<td>金额</td>
							<td>号码</td>
							<td>金额</td>
							<td>号码</td>
							<td>金额</td>
							<td>号码</td>
							<td>金额</td>
						</tr>
						<tr>
							<td>猴</td>
							<td><input type="text" name="50" maxlength="6" style="width:40px" tabIndex="100"/></td>
							<td><img title="01" src="moneyTree/images/num01.gif"/></td>
							<td><input type="text" maxlength="6" name="1" style="width:40px" tabIndex="112"/></td>
							<td><img title="13" src="moneyTree/images/num13.gif"/></td>
							<td><input type="text" maxlength="6" name="13" style="width:40px" tabIndex="124"/></td>
							<td><img title="25" src="moneyTree/images/num25.gif"/></td>
							<td><input type="text" maxlength="6" name="25" style="width:40px" tabIndex="136"/></td>
							<td><img title="37" src="moneyTree/images/num37.gif"/></td>
							<td><input type="text" maxlength="6" name="37" style="width:40px" tabIndex="148"/></td>
							<td><img title="49" src="moneyTree/images/num49.gif"/></td>
							<td><input type="text" maxlength="6" name="49" style="width:40px" tabIndex="160"/></td>
						</tr>
						<tr>
							<td>羊</td>
							<td><input type="text" maxlength="6" name="51" style="width:40px" tabIndex="101"/></td>
							<td><img title="02" src="moneyTree/images/num02.gif"/></td>
							<td><input type="text" maxlength="6" name="2" style="width:40px" tabIndex="113"/></td>
							<td><img title="14" src="moneyTree/images/num14.gif"/></td>
							<td><input type="text" maxlength="6" name="14" style="width:40px" tabIndex="125"/></td>
							<td><img title="26" src="moneyTree/images/num26.gif"/></td>
							<td><input type="text" maxlength="6" name="26" style="width:40px" tabIndex="137"/></td>
							<td><img title="38" src="moneyTree/images/num38.gif"/></td>
							<td><input type="text" maxlength="6" name="38" style="width:40px" tabIndex="149"/></td>
							
						</tr>
						<tr>
							<td>马</td>
							<td><input type="text" maxlength="6" name="52" style="width:40px" tabIndex="102"/></td>
							<td><img title="03" src="moneyTree/images/num03.gif"/></td>
							<td><input type="text" maxlength="6" name="3" style="width:40px" tabIndex="114"/></td>
							<td><img title="15" src="moneyTree/images/num15.gif"/></td>
							<td><input type="text" maxlength="6" name="15" style="width:40px" tabIndex="126"/></td>
							<td><img title="27" src="moneyTree/images/num27.gif"/></td>
							<td><input type="text" maxlength="6" name="27" style="width:40px" tabIndex="138"/></td>
							<td><img title="39" src="moneyTree/images/num39.gif"/></td>
							<td><input type="text" maxlength="6" name="39" style="width:40px" tabIndex="150"/></td>
							
						</tr>
						<tr>
							<td>蛇</td>
							<td><input type="text" maxlength="6" name="53" style="width:40px" tabIndex="103"/></td>
							<td><img title="04" src="moneyTree/images/num04.gif"/></td>
							<td><input type="text" maxlength="6" name="4" style="width:40px" tabIndex="115"/></td>
							<td><img title="16" src="moneyTree/images/num16.gif"/></td>
							<td><input type="text" maxlength="6" name="16" style="width:40px" tabIndex="127"/></td>
							<td><img title="28" src="moneyTree/images/num28.gif"/></td>
							<td><input type="text" maxlength="6" name="28" style="width:40px" tabIndex="139"/></td>
							<td><img title="40" src="moneyTree/images/num40.gif"/></td>
							<td><input type="text" maxlength="6" name="40" style="width:40px" tabIndex="151"/></td>
							
						</tr>
						<tr>
							<td>龙</td>
							<td><input type="text" maxlength="6" name="54" style="width:40px" tabIndex="104"/></td>
							<td><img title="05" src="moneyTree/images/num05.gif"/></td>
							<td><input type="text" maxlength="6" name="5" style="width:40px" tabIndex="116"/></td>
							<td><img title="17" src="moneyTree/images/num17.gif"/></td>
							<td><input type="text" maxlength="6" name="17" style="width:40px" tabIndex="128"/></td>
							<td><img title="29" src="moneyTree/images/num29.gif"/></td>
							<td><input type="text" maxlength="6" name="29" style="width:40px" tabIndex="140"/></td>
							<td><img title="41" src="moneyTree/images/num41.gif"/></td>
							<td><input type="text" maxlength="6" name="41" style="width:40px" tabIndex="152"/></td>
							
						</tr>
						<tr>
							<td>兔</td>
							<td><input type="text" maxlength="6" name="55" style="width:40px" tabIndex="105"/></td>
							<td><img title="06" src="moneyTree/images/num06.gif"/></td>
							<td><input type="text" maxlength="6" name="6" style="width:40px" tabIndex="117"/></td>
							<td><img title="18" src="moneyTree/images/num18.gif"/></td>
							<td><input type="text" maxlength="6" name="18" style="width:40px" tabIndex="129"/></td>
							<td><img title="30" src="moneyTree/images/num30.gif"/></td>
							<td><input type="text" maxlength="6" name="30" style="width:40px" tabIndex="141"/></td>
							<td><img title="42" src="moneyTree/images/num42.gif"/></td>
							<td><input type="text" maxlength="6" name="42" style="width:40px" tabIndex="153"/></td>
							
						</tr>
						<tr>
							<td>虎</td>
							<td><input type="text" maxlength="6" name="56" style="width:40px" tabIndex="106"/></td>
							<td><img title="07" src="moneyTree/images/num07.gif"/></td>
							<td><input type="text" maxlength="6" name="7" style="width:40px" tabIndex="118"/></td>
							<td><img title="19" src="moneyTree/images/num19.gif"/></td>
							<td><input type="text" maxlength="6" name="19" style="width:40px" tabIndex="130"/></td>
							<td><img title="31" src="moneyTree/images/num31.gif"/></td>
							<td><input type="text" maxlength="6" name="31" style="width:40px" tabIndex="142"/></td>
							<td><img title="43" src="moneyTree/images/num43.gif"/></td>
							<td><input type="text" maxlength="6" name="43" style="width:40px" tabIndex="154"/></td>
							
						</tr>
						<tr>
							<td>牛</td>
							<td><input type="text" maxlength="6" name="57" style="width:40px" tabIndex="107"/></td>
							<td><img title="08" src="moneyTree/images/num08.gif"/></td>
							<td><input type="text" maxlength="6" name="8" style="width:40px" tabIndex="119"/></td>
							<td><img title="20" src="moneyTree/images/num20.gif"/></td>
							<td><input type="text" maxlength="6" name="20" style="width:40px" tabIndex="131"/></td>
							<td><img title="32" src="moneyTree/images/num32.gif"/></td>
							<td><input type="text" maxlength="6" name="32" style="width:40px" tabIndex="143"/></td>
							<td><img title="44" src="moneyTree/images/num44.gif"/></td>
							<td><input type="text" maxlength="6" name="44" style="width:40px" tabIndex="155"/></td>
							
						</tr>
						<tr>
							<td>鼠</td>
							<td><input type="text" maxlength="6" name="58" style="width:40px" tabIndex="108"/></td>
							<td><img title="09" src="moneyTree/images/num09.gif"/></td>
							<td><input type="text" maxlength="6" name="9" style="width:40px" tabIndex="120"/></td>
							<td><img title="21" src="moneyTree/images/num21.gif"/></td>
							<td><input type="text" maxlength="6" name="21" style="width:40px" tabIndex="132"/></td>
							<td><img title="33" src="moneyTree/images/num33.gif"/></td>
							<td><input type="text" maxlength="6" name="33" style="width:40px" tabIndex="144"/></td>
							<td><img title="45" src="moneyTree/images/num45.gif"/></td>
							<td><input type="text" maxlength="6" name="45" style="width:40px" tabIndex="156"/></td>
							
						</tr>
						<tr>
							<td>猪</td>
							<td><input type="text" maxlength="6" name="59" style="width:40px" tabIndex="109"/></td>
							<td><img title="10" src="moneyTree/images/num10.gif"/></td>
							<td><input type="text" maxlength="6" name="10" style="width:40px" tabIndex="121"/></td>
							<td><img title="22" src="moneyTree/images/num22.gif"/></td>
							<td><input type="text" maxlength="6" name="22" style="width:40px" tabIndex="133"/></td>
							<td><img title="34" src="moneyTree/images/num34.gif"/></td>
							<td><input type="text" maxlength="6" name="34" style="width:40px" tabIndex="145"/></td>
							<td><img title="46" src="moneyTree/images/num46.gif"/></td>
							<td><input type="text" maxlength="6" name="46" style="width:40px" tabIndex="157"/></td>
							
						</tr>
						<tr>
							<td>狗</td>
							<td><input type="text" maxlength="6" name="60" style="width:40px" tabIndex="110"/></td>
							<td><img title="11" src="moneyTree/images/num11.gif"/></td>
							<td><input type="text" maxlength="6" name="11" style="width:40px" tabIndex="122"/></td>
							<td><img title="23" src="moneyTree/images/num23.gif"/></td>
							<td><input type="text" maxlength="6" name="23" style="width:40px" tabIndex="134"/></td>
							<td><img title="35" src="moneyTree/images/num35.gif"/></td>
							<td><input type="text" maxlength="6" name="35" style="width:40px" tabIndex="146"/></td>
							<td><img title="47" src="moneyTree/images/num47.gif"/></td>
							<td><input type="text" maxlength="6" name="47" style="width:40px" tabIndex="158"/></td>
							
						</tr>
						<tr>
							<td>鸡</td>
							<td><input type="text" maxlength="6" name="61" style="width:40px" tabIndex="111"/></td>
							<td><img title="12" src="moneyTree/images/num12.gif"/></td>
							<td><input type="text" maxlength="6" name="12" style="width:40px" tabIndex="123"/></td>
							<td><img title="24" src="moneyTree/images/num24.gif"/></td>
							<td><input type="text" maxlength="6" name="24" style="width:40px" tabIndex="135"/></td>
							<td><img title="36" src="moneyTree/images/num36.gif"/></td>
							<td><input type="text" maxlength="6" name="36" style="width:40px" tabIndex="147"/></td>
							<td><img title="48" src="moneyTree/images/num48.gif"/></td>
							<td><input type="text" maxlength="6" name="48" style="width:40px" tabIndex="159"/></td>
							
						</tr>
					</table>
					<div style="margin-top:15px">
						<input id="searchBtn" type="button" class="ldBtnBlue" value="提交" onclick="return checkSubmit();" />
						<input id="searchBtn" type="reset" class="ldBtnGray" value="重置" />
					</div>
					
			</div>

			<div style="width:24%;float:left;margin-left:5px">
				<!-- <table id="contentTable" width="100%" border="0" cellspacing="1" cellpadding="0" class="ld-datagrid">
					<tr>
						<td>吃数分析</td>
						<td>吃500</td>
						<td>吃600</td>
						<td>吃700</td>
					</tr>
					<tr>
						<td style="font-weight:bold">赚钱个数</td>
						<td>15</td>
						<td>12</td>
						<td>11</td>
					</tr>
					<tr>
						<td style="font-weight:bold">赚钱最大值/号码</td>
						<td>2345/23</td>
						<td>2345/23</td>
						<td>2345/23</td>
					</tr>
					<tr>
						<td style="font-weight:bold">亏钱最大值/号码</td>
						<td>-2345/23</td>
						<td>-2345/23</td>
						<td>-2345/23</td>
					</tr>
				</table>
				 -->
				<table style="margin-top:8px;" width="100%" border="0" cellspacing="1" cellpadding="0" class="ld-datagrid">
					<tr>
						<td>组合</td>
						<td>金额</td>
					</tr>
					<tr>
						<td>单数</td>
						<td><input type="text" maxlength="6" name="62" style="width:60px"/></td>
					</tr>
					<tr>
						<td>双数</td>
						<td><input type="text" maxlength="6" name="63" style="width:60px"/></td>
					</tr>
					<tr>
						<td>红波</td>
						<td><input type="text" maxlength="6" name="64" style="width:60px"/></td>
					</tr>
					<tr>
						<td>蓝波</td>
						<td><input type="text" maxlength="6" name="65" style="width:60px"/></td>
					</tr>
					<tr>
						<td>绿波</td>
						<td><input type="text" maxlength="6" name="66" style="width:60px"/></td>
					</tr>
					<c:forEach items="${numgroupList }" var="item" varStatus="status">
						<tr>
							<td>${ item.groupName}</td>
							<td><input type="text" maxlength="6" name="${ item.id}" style="width:60px"/></td>
						</tr>
					</c:forEach>
				</table>
				</form>
			</div>
		</div>
	</div>
</body>
</html>
