<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>GSU-SMP | A complete solution for your sales pipeline</title>

	<!-- Bootstrap -->	
	<link href="/admin/lib/bootstrap-3.3.7/css/bootstrap.min.css" rel="stylesheet">
	
	<!-- Font awesome -->
	<link rel="stylesheet" href="/admin/lib/bootstrap-3.3.7/css/font-awesome.min.css">
	<!-- Sandstone Bootstrap CSS -->
	<link rel="stylesheet" href="/admin/lib/bootstrap-3.3.7/css/bootstrap.min.css">
	<!-- Bootstrap Datatables -->
	<link rel="stylesheet" href="/admin/lib/bootstrap-3.3.7/css/dataTables.bootstrap.min.css">
	<!-- Bootstrap social button library -->
	<link rel="stylesheet" href="/admin/lib/bootstrap-3.3.7/css/bootstrap-social.css">
	<!-- Bootstrap select -->
	<link rel="stylesheet" href="/admin/lib/bootstrap-3.3.7/css/bootstrap-select.css">
	<!-- Bootstrap file input -->
	<link rel="stylesheet" href="/admin/lib/bootstrap-3.3.7/css/fileinput.min.css">
	<!-- Awesome Bootstrap checkbox -->
	<link rel="stylesheet" href="/admin/lib/bootstrap-3.3.7/css/awesome-bootstrap-checkbox.css">
	<!-- Admin Stye -->
	<link rel="stylesheet" href="/admin/lib/bootstrap-3.3.7/css/style.css">

</head>

<body>

<!-- *************************************************************************************************************************
************************** this is the Navigation section ********************************************************************* -->

	<div class="brand clearfix">
		<a href="index.html" class="logo">
			<img src="/admin/lib/bootstrap-3.3.7/img/logo.jpg" class="img-responsive" alt="">
		</a> 
		<span class="menu-btn"><i class="fa fa-bars"></i></span>
		<ul class="ts-profile-nav">

			<sec:authorize access="isAuthenticated()">
				<li class="ts-account">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown"> <span class="glyphicon glyphicon-user"></span>
						<sec:authentication property="principal.user.lastName" /> <i class="fa fa-angle-down hidden-side"></i>
					</a>
					<ul>
						<li><a
							href="/users/<sec:authentication property='principal.user.id' />"><span
								class="glyphicon glyphicon-user"></span> Profile</a></li>
						<li><c:url var="logoutUrl" value="/logout" /> <form:form
								id="logoutForm" action="${logoutUrl}" method="post">
							</form:form> <a href="#"
							onclick="document.getElementById('logoutForm').submit()"><span
								class="glyphicon glyphicon-log-out"></span> Sign out</a></li>
					</ul>
				</li>
			</sec:authorize>
			
			<sec:authorize access="isAuthenticated()">
              <li class="ts-account">
                  <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                      <span class="glyphicon glyphicon-user"></span>Client <i class="fa fa-angle-down hidden-side"></i>
                  </a>
                  <ul>
                     <li><a href="/admin/client/create"><span class="glyphicon glyphicon-user"></span>Create</a></li>
                     <li><a href="/admin/client/list"><span class="glyphicon glyphicon-user"></span> All clients</a></li>
                  </ul>
              </li>
            </sec:authorize>
            
            <sec:authorize access="isAuthenticated()">
              <li class="ts-account">
                  <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                      <span class="glyphicon glyphicon-user"></span>Employee <i class="fa fa-angle-down hidden-side"></i>
                  </a>
                  <ul>
                     <li><a href="/admin/create-employee"><span class="glyphicon glyphicon-user"></span>Create</a></li>
                     <li><a href="/admin/employees"><span class="glyphicon glyphicon-user"></span> All employees</a></li>
                  </ul>
              </li>
            </sec:authorize>
            
            <sec:authorize access="isAuthenticated()">
              <li class="ts-account">
                  <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                      <span class="glyphicon glyphicon-user"></span>Contact <i class="fa fa-angle-down hidden-side"></i>
                  </a>
                  <ul>
                     <li><a href="/admin/contact/create"><span class="glyphicon glyphicon-user"></span> create Contact</a></li>
                  </ul>
              </li>
            </sec:authorize>
		</ul>
	</div>
	
	<div class="ts-main-content">
	
	<sec:authorize access="hasRole('ROLE_UNVERIFIED')">
		<div class="alert alert-warning alert-dismissable">
		  <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
		  Your email id is unverified. <a href="/users/resend-verification-mail">Click here</a> to get the verification mail again.
		</div>
    </sec:authorize>

	<c:if test="${not empty flashMessage}">
		<div class="alert alert-${flashKind} alert-dismissable">
		  <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
		  ${flashMessage}
		</div>
	</c:if>