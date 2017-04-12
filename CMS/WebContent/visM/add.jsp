<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
	String path = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ request.getContextPath() + "/";
%>
<base href="<%=path%>" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新增回访记录</title>
<link href="assets/css/bootstrap.min.css" rel="stylesheet" />
<link rel="stylesheet" href="assets/css/chosen.css" />
<link rel="stylesheet" href="assets/css/datepicker.css" />
<link rel="stylesheet" href="assets/css/bootstrap-timepicker.css" />
<link rel="stylesheet" href="assets/css/daterangepicker.css" />
<link rel="stylesheet" href="assets/css/colorpicker.css" />
<!-- 操作下的小图标 -->
<link rel="stylesheet"
	href="assets/css/font-awesome.min.css?v=${version}" />
<!-- 页面只要的 样式 -->
<link rel="stylesheet" href="assets/css/ace.min.css?v=${version}" />
<link rel="stylesheet" href="assets/css/ace-rtl.min.css" />
<link rel="stylesheet" href="assets/css/ace-skins.min.css" />
<script src="assets/js/ace-extra.min.js"></script>
<style type="text/css">
.sright {
	float: right;
}
</style>
</head>

<body style="background-color: #FFFFFF">
	<form id="addForm" method="post" action="visM/add.action">
		<div class="table-header"
			style="margin-top: 10px; margin-left: 18px; margin-right: 18px">新增回访记录</div>
		<div class="row" style="height: 50px;">
			<input value="${param.id }" class="hide" name="id" />
			<div class="col-xs-1"></div>
			<div class="col-xs-2" style="margin-left: 8px; padding-top: 13px;">
				<span class="sright"><font size="3">客户名称:</font></span>
			</div>
			<div style="padding-top: 13px;" class="col-xs-6">
				<span><input value="${param.name}" type="text" name="name"
					readonly="readonly" class=" col-xs-12 name" /></span>
			</div>
		</div>
		<div class="row" style="height: 50px;">
			<div class="col-xs-1"></div>
			<div class="col-xs-2" style="margin-left: 8px; padding-top: 13px;">
				<span class="sright"><font size="3">联系电话:</font></span>
			</div>
			<div style="padding-top: 13px;" class="col-xs-6">
				<span><input type="text" name="tel"
					class=" col-xs-12 tel" value="${param.tel}" readonly="readonly" /></span>
			</div>
		</div>
		<div class="row" style="height: 50px;">
			<div class="col-xs-1"></div>
			<div class="col-xs-2" style="margin-left: 8px; padding-top: 13px;">
				<span class="sright"><font size="3">客户评价:</font></span>
			</div>
			<div style="padding-top: 13px;" class="col-xs-6">
				<span><select name="status" class="status">
						<option value="0" selected="selected">默认</option>
						<option value="3">未联系上</option>
						<option value="1">较差</option>
						<option value="2">尚可</option>
						<option value="5">极优</option>
				</select> </span>
			</div>
		</div>
		<div class="row" style="height: 50px;">
			<div class="col-xs-1"></div>
			<div class="col-xs-2" style="margin-left: 8px; padding-top: 13px;">
				<span class="sright"><font size="3">回访状态:</font></span>
			</div>
			<div style="padding-top: 13px;" class="col-xs-6">
				<input type="radio" value="0" name="restatus" />需要二次回访&nbsp;
				<input type="radio" value="1" name="restatus" checked="checked" />回访中
				<input type="radio" value="2" name="restatus" />回访完成
			</div>
		</div>
		<div class="row" style="height: 165px; padding-left: 10px">
			<div class="col-xs-1"></div>
			<div class="col-xs-2" style="padding-top: 13px">
				<span class="sright"><font size="3">沟通内容:</font></span>
			</div>
			<div style="padding-top: 13px" class="col-xs-6">
				<span><textarea name="remark"
						class="form-control  col-xs-12 remark" id="form-field-8"
						style="height: 150px"></textarea></span>
			</div>

		</div>
		<div class="row" style="height: 50px">
			<div class="col-xs-9" style="padding-top: 7px; margin-left: 20%">
				<div class="col-xs-3"></div>
				<a onclick="history.go(-1)"><button type="button"
						class="btn  btn-warning ">
						<i class="icon-undo bigger-100"></i> 上一步
					</button></a>
				<button type="button" class="btn  btn-success  save">
					保存 <i class="icon-ok bigger-100"></i>
				</button>
			</div>
		</div>
	</form>
	<script src="assets/js/jquery-2.0.3.min.js"></script>
	<script type="text/javascript">
		window.jQuery
				|| document
						.write("<script src='assets/js/jquery-2.0.3.min.js'>"
								+ "<"+"/script>");
	</script>
	<script type="text/javascript">
		if ("ontouchend" in document)
			document
					.write("<script src='assets/js/jquery.mobile.custom.min.js'>"
							+ "<"+"/script>");
	</script>
	<script type="text/javascript">
		jQuery(function($) {
			$(".save").off("click").on("click",function() {
				var status = $(".status").val();
				var restatus = $(".restatus").val();
				var remark = $(".remark").val();
				if (parseInt(status) == 0||remark=='') {
					alert("联系状态,沟通内容必填！");
					return;
				} else {
					if (confirm("确定保存?")) {
						$("#addForm").submit();
					}
				}
			});
		});
	</script>
</body>
</html>
