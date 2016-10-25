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

	<!-- Fixed navbar -->
	<div class="navbar navbar-default navbar-fixed-top" role="navigation">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".navbar-collapse">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="/">GSU-SMP</a>
			</div>
			<div class="navbar-collapse collapse navbar-right">
				<ul class="nav navbar-nav">
					<li class="active"><a href="/">HOME</a></li>
					<li><a href="/about">ABOUT</a></li>
					<li><a href="/contact">CONTACT</a></li>
					<sec:authorize access="isAnonymous()">
						<li><a href="/login">Sign in <span
								class="glyphicon glyphicon-log-in"></span></a></li>
					</sec:authorize>

					<sec:authorize access="isAuthenticated()">
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown"> <span
								class="glyphicon glyphicon-user"></span> <sec:authentication
									property="principal.user.firstName" /> <b class="caret"></b>
						</a>
							<ul class="dropdown-menu">
								<li><a
									href="/users/<sec:authentication property='principal.user.id' />"><span
										class="glyphicon glyphicon-user"></span> Profile</a></li>
								<li><c:url var="logoutUrl" value="/logout" /> <form:form
										id="logoutForm" action="${logoutUrl}" method="post">
									</form:form> <a href="#"
									onclick="document.getElementById('logoutForm').submit()"><span
										class="glyphicon glyphicon-log-out"></span> Sign out</a></li>
							</ul></li>
					</sec:authorize>

					<sec:authorize access="hasRole('ROLE_UNVERIFIED')">
						<div class="alert alert-warning alert-dismissable">
							<button type="button" class="close" data-dismiss="alert"
								aria-hidden="true">&times;</button>
							Your email id is unverified. <a
								href="/users/resend-verification-mail">Click here</a> to get the
							verification mail again.
						</div>
					</sec:authorize>

					<!-- <li class="dropdown">
					<a href="#" class="dropdown-toggle"
						data-toggle="dropdown">PAGES <b class="caret"></b></a>
					</li> -->
				</ul>
			</div>

			<!--/.nav-collapse -->
		</div>
	</div>

	<!-- *****************************************************************************************************************
	 HEADERWRAP
	 ***************************************************************************************************************** -->
	<div id="headerwrap">
	
		<!-- Flash Messages -->

		<c:if test="${not empty flashMessage}">
			<div class="col-lg-8 col-lg-offset-2">
				<div class="alert alert-${flashKind} alert-dismissable">
					<button type="button" class="close" data-dismiss="alert"
						aria-hidden="true">&times;</button>
					${flashMessage}
				</div>
			</div>
		</c:if>