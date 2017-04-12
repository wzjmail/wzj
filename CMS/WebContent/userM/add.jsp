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
<title>增加用户</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<!-- basic styles -->
<link href="assets/css/bootstrap.min.css" rel="stylesheet" />
<link rel="stylesheet" href="assets/css/font-awesome.min.css" />

<link rel="stylesheet" href="assets/css/jquery-ui-1.10.3.custom.min.css" />
<link rel="stylesheet" href="assets/css/chosen.css" />
<link rel="stylesheet" href="assets/css/datepicker.css" />
<link rel="stylesheet" href="assets/css/bootstrap-timepicker.css" />
<link rel="stylesheet" href="assets/css/daterangepicker.css" />
<link rel="stylesheet" href="assets/css/colorpicker.css" />

<!-- fonts -->
<!-- ace styles -->

<link rel="stylesheet" href="assets/css/ace.min.css" />
<link rel="stylesheet" href="assets/css/ace-rtl.min.css" />
<link rel="stylesheet" href="assets/css/ace-skins.min.css" />


<!-- ace settings handler -->
<script src="assets/js/jsmd5.js"></script>
<script src="assets/js/ace-extra.min.js"></script>
<style type="text/css">
.sright {
	float: right;
}
</style>
</head>

<body>
	<div class="content">
		<div class="page-content">
			<div class="page-header">
				<h1>
					添加 <small> <i class="icon-double-angle-right"></i> 用户信息
					</small>
				</h1>
			</div>
			<!-- /.page-header -->

			<div class="row">
				<div class="col-xs-12">
					<!-- PAGE CONTENT BEGINS -->
					<s:form action="userM/add.action" class="form-horizontal"
						method="post" id="form-list" commandName="user">
						<div class="row" style="height: 50px;">
							<div class="col-xs-2"></div>
							<div class="col-xs-2" style="padding-top: 13px;">
								<span class="sright"><font size="4">姓名:</font></span>
							</div>
							<div style="padding-top: 13px;">
								<input type="text" placeholder="姓名" name="name"
									class=" col-xs-5 name" />
								<div id="nadiv" style="display: none">
									<font color="red">不能为空</font>
								</div>
							</div>
						</div>
						<div class="row" style="height: 50px;">
							<div class="col-xs-2"></div>
							<div class="col-xs-2" style="padding-top: 13px;">
								<span class="sright"><font size="3">用户名:</font></span>
							</div>
							<div style="padding-top: 13px;">
								<input onfocus="this.type='text'" placeholder="用户名"
									name="username" class=" col-xs-5 username" />
								<div id="undiv" style="display: none">
									<font color="red">不能为空</font>
								</div>
								<div id="succ" style="display: none">
									<font color="green">可用</font>
								</div>
							</div>
						</div>
						<div class="row" style="height: 50px;">
							<div class="col-xs-2"></div>
							<div class="col-xs-2" style="padding-top: 13px;">
								<span class="sright"><font size="3">密码:</font></span>
							</div>
							<div style="padding-top: 13px;">
								<input type="password" placeholder="密码"
									class=" col-xs-5 password1" />
								<div id="pw1div" style="display: none">
									<font color="red">不能为空</font>
								</div>
							</div>
						</div>
						<div class="row" style="height: 50px;">
							<div class="col-xs-2"></div>
							<div class="col-xs-2" style="padding-top: 13px;">
								<span class="sright"><font size="3">确认密码:</font></span>
							</div>
							<div style="padding-top: 13px;">
								<input type="password" placeholder="密码"
									class=" col-xs-5 password2" />
								<div id="pw2div" style="display: none">
									<font color="red">不能为空</font> <input type="hidden"
										name="password" class="password">
								</div>
							</div>
						</div>
						<div class="row" style="height: 50px;">
							<div class="col-xs-2"></div>
							<div class="col-xs-2" style="padding-top: 13px;">
								<span class="sright"><font size="3">员工职务:</font></span>
							</div>
							<div style="padding-top: 13px;">
								<select name="role">
									<option value="1">部门经理</option>
									<option value="2">部门助理</option>
									<option value="3">回访专员</option>
									<option value="0">部门员工</option>
								</select>
							</div>
						</div>
						<div class="row" style="height: 50px;">
							<div class="col-xs-2"></div>
							<div class="col-xs-2" style="padding-top: 13px;">
								<span class="sright"><font size="3">所属部门:</font></span>
							</div>
							<div style="padding-top: 13px;">
								<select class="dept" name="dept">
									<option value="0">请选择</option>
									<option value="1">好味至</option>
									<option value="2">有碗面</option>
									<option value="3">坛香园</option>
								</select>
							</div>
						</div>
						<input class="hide" name="sign" value="${us.sign}" />
						<div class="row" style="height: 50px">
							<div class="col-xs-2"></div>
							<div class="col-xs-6" style="padding-top: 7px; margin-left: 20%">

								<button class="btn btn-info submit" type="button">
									<i class="icon-ok bigger-110"></i> 提交
								</button>

								&nbsp; &nbsp; &nbsp;
								<button class="btn" type="button" onclick="history.go(-1)">
									<i class="icon-undo bigger-110"></i> 返回
								</button>
							</div>
						</div>
						<div class="hr hr-24"></div>
					</s:form>
				</div>
				<!-- /.page-content -->
			</div>
			<!-- /.main-content -->

		</div>
		<!-- /.main-container-inner -->

		<a href="#" id="btn-scroll-up"
			class="btn-scroll-up btn btn-sm btn-inverse"> <i
			class="icon-double-angle-up icon-only bigger-110"></i>
		</a>
	</div>
	<!-- /.main-container -->

	<!-- basic scripts -->

	<!--[if !IE]> -->

	<script src="assets/js/jquery-2.0.3.min.js"></script>

	<!-- <![endif]-->

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
	<script src="assets/js/bootstrap.min.js"></script>
	<script src="assets/js/typeahead-bs2.min.js"></script>

	<!-- page specific plugin scripts -->

	<!--[if lte IE 8]>
		  <script src="assets/js/excanvas.min.js"></script>
		<![endif]-->

	<script src="assets/js/jquery-ui-1.10.3.custom.min.js"></script>
	<script src="assets/js/jquery.ui.touch-punch.min.js"></script>
	<script src="assets/js/chosen.jquery.min.js"></script>
	<script src="assets/js/fuelux/fuelux.spinner.min.js"></script>
	<script src="assets/js/date-time/bootstrap-datepicker.min.js"></script>
	<script src="assets/js/date-time/bootstrap-timepicker.min.js"></script>
	<script src="assets/js/date-time/moment.min.js"></script>
	<script src="assets/js/date-time/daterangepicker.min.js"></script>
	<script src="assets/js/bootstrap-colorpicker.min.js"></script>
	<script src="assets/js/jquery.knob.min.js"></script>
	<script src="assets/js/jquery.autosize.min.js"></script>
	<script src="assets/js/jquery.inputlimiter.1.3.1.min.js"></script>
	<script src="assets/js/jquery.maskedinput.min.js"></script>
	<script src="assets/js/bootstrap-tag.min.js"></script>

	<!-- ace scripts -->

	<script src="assets/js/ace-elements.min.js"></script>
	<script src="assets/js/ace.min.js"></script>

	<!-- inline scripts related to this page -->

	<script type="text/javascript">
		jQuery(function($) {
			$(".username").off("blur").on("blur", function() {
				var username = $(this).val();
				if (username != "") {
					$("#undiv").hide();               ///这里的jQuery与useraction里面的ajax存在问题
					$.post("userM/ajax.action", {
						"username" : username
					}, function(data, status) {
						if (status == "success") {   
							//alert(data);
							if (data != 1) {
								$("#succ").show();
							} else {
								$(".username").val("");
								$("input[name=username]").focus();
							}
						}
						//alert(data.menus);
						else {
							alert("网络连接失败！");
						}
					});
				} else {
					$("#undiv").show();
				}
			});
			$(".name").off("blur").on("blur", function() {
				var name = $(this).val();
				if (name == "") {
					$("#nadiv").show();
				} else {
					$("#nadiv").hide();
				}
			});
			$(".password1").off("blur").on("blur", function() {
				var password = $(this).val();
				if (password == "") {
					$("#pw1div").show();
				} else {
					$("#pw1div").hide();
				}
			});
			$(".password2").off("blur").on("blur", function() {
				var password = $(this).val();
				var password1 = $(".password1").val();
				if (password == "") {
					$("#pw2div").show();
				} else {
					$("#pw2div").hide();
				}
				if (password == password1) {
				} else {
					alert("两次密码不一致请检查");
					$(".password1").val("");
					$(".password2").val("");
					$("input[name=password1]").focus();
				}
			});
			$(".submit").focus().off("click").on("click", function() {
				if ($(".name").val() != "") {
					if ($(".username").val() != "") {
						var password1 = $(".password1").val();
						var password2 = $(".password2").val();
						if (password1 != "") {
							if (password2 != "") {
								if ($(".dept").val() != 0) {
									$(".password").val(MD5(password1));
									$("#form-list").submit();
								} else {
									alert("请选择部门！");
								}
							} else {
								alert("有空值，不允许提交");
								return;
							}
						} else {
							alert("有空值，不允许提交");
							return;
						}
					} else {
						alert("有空值，不允许提交");
						return;
					}
				} else {
					alert("有空值，不允许提交");
					return;
				}
			});
		});
	</script>
</body>
</html>