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
						<legend>新增疾病基本信息</legend>
						<input type="hidden" name="method" value="adddiseaseInfo">
						<table border="0" cellpadding="3" cellspacing="0" width="100%"
							align="left">
							<tr>
								<td align="right" width="230px">周序号：</td>
								<td align="left">&nbsp; ${weeklyInfluzaMgmt.weekNo}</td>
							</tr>

							<tr>
								<td align="right" width="230px">北方ILI%：</td>
								<td align="left">&nbsp; ${weeklyInfluzaMgmt.northIli}</td>
							</tr>

							<tr>
								<td align="right" width="230px">南方ILI%：</td>
								<td align="left">&nbsp; ${weeklyInfluzaMgmt.sourthIli}</td>
							</tr>

							<tr>
								<td align="right" width="230px">全国ILI%：</td>
								<td align="left">&nbsp; ${weeklyInfluzaMgmt.nationIli}</td>
							</tr>


							<tr>
								<td align="right" width="230px">备注信息：</td>
								<td align="left">&nbsp; ${weeklyInfluzaMgmt.remark}</td>
							</tr>

						</table>
					</fieldset>
				</td>
			</tr>
			<tr>
				<td align="center"><input type="button"
					class="white-close blue-btn" value="关闭"
					onclick="CloseWindow('cancel')"></td>
			</tr>
		</table>
	</form>
	<script type="text/javascript" src="../js/common.js"></script>
	<script src="../js/boot.js" type="text/javascript"></script>
	<script type="text/javascript" src="../js/alertBoot.js"></script>
	<script type="text/javascript">

function CloseWindow(action) {      
    if (window.CloseOwnerWindow) 
    	return window.CloseOwnerWindow(action);
    else window.close();
}
</script>
</body>
</html>