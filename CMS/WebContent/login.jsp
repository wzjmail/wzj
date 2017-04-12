<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<head>
<%
	String path = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ request.getContextPath() + "/";
%>
<base href="<%=path%>" />
<link rel="shortcut icon" href="images/logo/plogo.png"
	type="image/x-icon">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>系统登录</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link href="assets/css/bootstrap.min.css?v=${version}" rel="stylesheet" />
<link rel="stylesheet" href="assets/css/ace.min.css?v=${version}" />

<link rel="stylesheet" type="text/css" href="assets/css/normalize.css" />
<link rel="stylesheet" type="text/css" href="assets/css/demo.css" />
<link rel="stylesheet" type="text/css" href="assets/css/component.css" />
<script src="assets/js/html5shiv.js"></script>
<script src="assets/js/respond.min.js"></script>
<script src="assets/js/jsmd5.js"></script>
</head>

<body class="login-layout">

	<div class="demo-1" style="width: 100%">
		<div class="content" style="width: 100%">
			<div id="large-header" class="large-header">
				<canvas id="demo-canvas"></canvas>
				<div class="container">
					<div style="position: fixed; top: 15%; left: 39%"
						class="login-container">
						<div class="center">
							<h1>
								<img style="height: 100px;" src="images/logo/logo.png" />
							</h1>
						</div>

						<div class="space-6"></div>

						<div class="position-relative" style="border: 0px;">
							<div id="login-box" class="login-box visible  no-border">
								<div class="widget-body">
									<div class="widget-main">
										<c:if test="${user ne 0}">
											<h5 class="header blue center lighter bigger">
												请输入账号密码
											</h5>
										</c:if>
										<c:if test="${user eq 0}">
											<div>
												<h5 class="header center red lighter bigger">
													账号或密码错误！
												</h5>
											</div>
										</c:if>
										<div class="space-6"></div>

										<form action="userM/login.action" method="post" id="form">
											<fieldset>
												<label class="block clearfix"> <span
													class="block input-icon input-icon-right"> <input
														type="text" name="username" class="username form-control"
														placeholder="用户名" /> <input type="hidden" name="password"
														class="appid" /> <i class="icon-user"></i>
												</span>
												</label> <label class="block clearfix"> <span
													class="block input-icon input-icon-right"> <input
														type="password" class="pass form-control" placeholder="密码" />
														<i class="icon-lock"></i>
												</span>
												</label>

												<div class="space"></div>

												<div class="clearfix">
													<center>
														<button type="submit"
															class="submit width-35 btn btn-sm btn-primary">
															<i class="icon-key"></i> 登录
														</button>
													</center>
												</div>

												<div class="space-4"></div>
											</fieldset>
										</form>
										<hr />
										<div class="text-success"
											style="margin-top: 15px; text-align: center;">
											<script language="javascript" type="text/javascript"
												src="http://pv.sohu.com/cityjson"></script>
											<script>
												document.write("你的IP是："
														+ returnCitySN.cip
														+ "，来自："
														+ returnCitySN.cname);
											</script>
										</div>
									</div>
									<!-- /widget-body -->
								</div>
								<!-- /login-box -->
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


	<!-- basic scripts -->
	<script src="assets/js/jquery-2.0.3.min.js"></script>


	<script type="text/javascript">
		//登录页面禁止有 夫选框
		$(document).ready(function() {
			if (window != top) {
				top.location.href = location.href;
			}
			$(".submit").click(function() {
				var username = $(".username").val();
				var pwd = $(".pass").val();
				// alert(username+"----"+pwd+"--md5--"+MD5(pwd));
				if (username.length > 0 && pwd.length > 0) {
					$(".appid").val(MD5(pwd));
					$("#form").submit();
				} else {
					alert("账号或密码不能为空！");
					return;
				}

			})

		});
	</script>


	<script type="text/javascript">
		if ("ontouchend" in document)
			document
					.write("<script src='assets/js/jquery.mobile.custom.min.js'>"
							+ "<"+"/script>");
	</script>

	<!-- inline scripts related to this page -->

	<script type="text/javascript">
		function show_box(id) {
			jQuery('.widget-box.visible').removeClass('visible');
			jQuery('#' + id).addClass('visible');
		}
	</script>
	<script src="assets/js/TweenLite.min.js"></script>
	<script src="assets/js/EasePack.min.js"></script>
	<script src="assets/js/rAF.js"></script>
	<script src="assets/js/demo-1.js"></script>
</body>
</html>
