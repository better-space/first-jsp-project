<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title>登录</title>
<link rel="stylesheet" href="bootstrap-3.3.7/css/bootstrap.min.css">
<script src="/jquery-3.1.1/jquery-3.1.1.min.js"></script>
<script src="/bootstrap-3.3.7/js/bootstrap.min.js"></script>
<style type="text/css">
</style>

</head>
<body>
	
	<div class="container">
		<div class="row clearfix" align="center">
			<div class="col-md-12 column" align="center">
				<form class="form-horizontal" role="form"
					action="/com.work.tour/servlet/loginCheck">
					<div class="form-group">
						<label for="inputEmail3" class="col-sm-2 control-label">用户名</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="inputEmail3"
								name="username" />
						</div>
					</div>
					<div class="form-group">
						<label for="inputPassword3" class="col-sm-2 control-label">密码</label>
						<div class="col-sm-10">
							<input type="password" class="form-control" id="inputPassword3"
								name="password" />
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<div class="checkbox">
								<label><input type="checkbox" />记住密码</label>
							</div>
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<button type="submit" class="btn btn-default">登录</button>
						</div>
					</div>
				</form>
				<div align="center">
					<font color="#C0C0C0" size="5px"><%=request.getParameter("message") == null ? "" : request.getParameter("message")%></font>
				</div>
			</div>
		</div>
	</div>
</body>
</html>