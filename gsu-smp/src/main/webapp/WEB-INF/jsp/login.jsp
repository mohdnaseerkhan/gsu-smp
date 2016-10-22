<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<link rel="shortcut icon"
	href="/public/lib/bootstrap-3.3.7/ico/favicon.ico">

<title>GSU - Sales Management Portal</title>

<!-- Bootstrap core CSS -->
<link href="/public/lib/bootstrap-3.3.7/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="/public/lib/bootstrap-3.3.7/css/style.css" rel="stylesheet">
<link href="/public/lib/bootstrap-3.3.7/css/font-awesome.min.css"
	rel="stylesheet">

</head>

<body>



	<div id="loginbox" style="margin-top: 50px;"
		class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
		<div class="panel panel-info">
			<div class="panel-heading">
				<div class="panel-title">Sign In</div>
				<div
					style="float: right; font-size: 80%; position: relative; top: -10px">
					<a href="/forgot-password">Forgot password?</a>
				</div>
			</div>

			<div style="padding-top: 30px" class="panel-body">

				<div style="display: none" id="login-alert"
					class="alert alert-danger col-sm-12"></div>

				<c:if test="${param.error != null}">
					<div class="alert alert-danger">Invalid username and
						password.</div>
				</c:if>

				<c:if test="${param.logout != null}">
					<div class="alert alert-danger">You have been logged out.</div>
				</c:if>

				<form:form role="form" id="loginform" class="form-horizontal" method="post">

					<div style="margin-bottom: 25px" class="input-group">
						<span class="input-group-addon"><i
							class="glyphicon glyphicon-user"></i></span> <input id="username"
							name="username" type="email" class="form-control"
							placeholder="Enter email" />
					</div>

					<div style="margin-bottom: 25px" class="input-group">
						<span class="input-group-addon"><i
							class="glyphicon glyphicon-lock"></i></span> <input type="password"
							id="password" name="password" class="form-control"
							placeholder="Password" />
					</div>

					<div class="input-group">
						<div class="checkbox">
							<label> <input name="_spring_security_remember_me"
								type="checkbox"> Remember me
							</label>
						</div>
					</div>

					<div style="margin-top: 10px" class="form-group">
						<!-- Button -->
						<div class="col-sm-12 controls">
							<button type="submit" class="btn btn-primary">Login</button>
						</div>
					</div>

				</form:form>

			</div>
		</div>
	</div>

</body>
</html>