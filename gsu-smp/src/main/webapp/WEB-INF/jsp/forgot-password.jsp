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
				<div class="panel-title">Forgot Password</div>
				<div
					style="float: right; font-size: 80%; position: relative; top: -10px">
					<a href="/login"><span class="glyphicon glyphicon-arrow-left"></span>Back to login</a>
				</div>
			</div>

			<div style="padding-top: 30px" class="panel-body">

				<div style="display: none" id="login-alert"
					class="alert alert-danger col-sm-12"></div>

				<form:form modelAttribute="forgotPasswordForm" role="form">
		
			<form:errors />
		
			<div class="form-group">
				<form:label path="email">Email address</form:label>
				<form:input path="email" type="email" class="form-control" placeholder="Enter email" />
				<form:errors cssClass="error" path="email" />
				<p class="help-block">Please enter your email id</p>
			</div>
			
			<button type="submit" class="btn btn-primary">Reset password</button>
			
		</form:form>

			</div>
		</div>
	</div>

</body>
</html>