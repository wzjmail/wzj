<%@page import="java.util.List"%>
<%@page import="org.apache.struts.action.DynaActionForm"%>
<%@page import="buaa.sem.ps.ConsistBean"%>
<%@page import="buaa.sem.ps.abstractClass.CacheManage"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/taglibs.jsp"%>
<%
	request.setAttribute("MENU_INDEX", "mainBaseData");
	ConsistBean consistbean = new ConsistBean();

	int weeklyInfluzaMgmtNum = (int) request.getAttribute("weeklyInfluzaMgmtNum");
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html path="<%=request.getServletPath()%>">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="../css/common.css" rel="stylesheet" type="text/css">
<link href="../css/detail.css" rel="stylesheet" type="text/css" />
<link href="../css/window.css" rel="stylesheet" type="text/css" />
<title>合同管理系统</title>
</head>

<body>
	<form id="form" method="post">
		<table align="center" width="100%" border="0" cellspacing="2"
			cellpadding="4">
			<tr valign="top">
				<td align="left">
					<fieldset>
						<legend>新增代表室</legend>
						<input type="hidden" name="method" value="addWeeklyInfluzaMgmt">
						<table border="0" cellpadding="3" cellspacing="0" width="100%"
							align="left">
							<tr>
								<td align="right" width="230px"><font color="red">*</font>周序号：</td>
								<td align="left"><input type="text" name="weekNo"
									id="weekNo" value="" style="width: 200px; margin: 10px;"
									class="input-text" /><font color="red">格式为：201701</font></td>
								</td>

							</tr>
							<tr>
								<td align="right" width="230px"><font color="red">*</font>北方ILI%：</td>
								<td align="left"><input type="text" name="northIli"
									id="northIli" value="" style="width: 200px; margin: 10px;"
									class="input-text" /> <!-- <font color="red">*不超过128个字</font> -->
								</td>
							</tr>
							<tr>
								<td align="right" width="230px"><font color="red">*</font>南方ILI%：</td>
								<td align="left"><input type="text" name="sourthIli"
									id="sourthIli" value="" style="width: 200px; margin: 10px;"
									class="input-text" /> <!-- <font color="red">*不超过128个字</font> -->
								</td>
							</tr>



							<tr>
								<td align="right" width="230px"><font color="red">*</font>全国ILI%：</td>
								<td align="left"><input type="text" name="nationIli"
									id="nationIli" value="" style="width: 200px; margin: 10px;"
									class="input-text" /> <!-- <font color="red">*不超过128个字</font> -->
								</td>
							</tr>





							<tr>
								<td align="right" width="230px">备注信息：</td>
								<td align="left"><input type="text" name="remark"
									id="remark" value="" style="width: 200px; margin: 10px;"
									class="input-text" /> <font color="red">不超过128个字</font></td>
							</tr>



						</table>
					</fieldset>
				</td>
			</tr>
			<tr>
				<td align="center"><input type="button"
					class="white-add blue-btn" value="保存" onclick="doPostForm()">
					<input type="button" class="white-close blue-btn" value="取消"
					onclick="CloseWindow('cancel')"></td>
			</tr>
		</table>
	</form>
	<script type="text/javascript" src="../js/common.js"></script>
	<script src="../js/boot.js" type="text/javascript"></script>
	<script type="text/javascript" src="../js/alertBoot.js"></script>
	<script type="text/javascript">
		function doPostForm() {
			if (!validForm()) {
				return;
			}
			var formParam = $("#form").serialize();
			$
					.ajax({
						url : "../mainBaseData/weeklyInfluzaMgmt.do?method=addWeeklyInfluzaMgmt",
						data : formParam,
						cache : false,
						type : "POST",
						dataType : "xml",
						success : function(responseXML) {
							var statu = $('statu', responseXML).text();
							var messages = $('message', responseXML).text();
							if (statu == 'true') {
								infoMsg(messages, function() {
									CloseWindow("save");
								});
							} else
								alertMsg(messages);
						},
						error : function(jqXHR, textStatus, errorThrown) {
							alertMsg(jqXHR.responseText);
						}
					});
		}

		function validForm() {
			var weekNo = document.getElementById("weekNo").value;
			var northIli = document.getElementById("northIli").value;
			var nationIli = document.getElementById("nationIli").value;
			var sourthIli = document.getElementById("sourthIli").value;
			var remark = document.getElementById("remark").value;

			if (weekNo.trim() == "" || northIli.trim() == ""
					|| nationIli.trim() == ""|| sourthIli.trim() == "") {
				alertMsg('所有带*的输入不能为空!');
				return false;
			}
			if(remark.length>128){
				alertMsg('备注长度应该小于128!');
				return false;
			}

			return true;
		}

		function CloseWindow(action) {
			if (window.CloseOwnerWindow)
				return window.CloseOwnerWindow(action);
			else
				window.close();
		}
	</script>
</body>
</html>