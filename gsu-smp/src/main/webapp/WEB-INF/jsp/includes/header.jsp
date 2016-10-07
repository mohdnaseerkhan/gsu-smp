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
	<title>Up and running with Spring Framework quickly</title>

	<!-- Bootstrap -->	
	<link href="/public/lib/bootstrap-3.3.7/css/bootstrap.min.css" rel="stylesheet">

</head>
<body>
	<div class="container">
	
	<nav class="navbar navbar-default" role="navigation">
	  <div class="container-fluid">
	    <!-- Brand and toggle get grouped for better mobile display -->
	    <div class="navbar-header">
	      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
	        <span class="sr-only">Toggle navigation</span>
	        <span class="icon-bar"></span>
	        <span class="icon-bar"></span>
	        <span class="icon-bar"></span>
	      </button>
	      <a class="navbar-brand" href="/">GSU-SMP</a>
	    </div>
	
	    <!-- Collect the nav links, forms, and other content for toggling -->
	    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
	      
	      <ul class="nav navbar-nav navbar-right">
	      <sec:authorize access="isAnonymous()">
	      
	        <li><a href="<c:url value='/signup' />"><span class="glyphicon glyphicon-list-alt"></span> Sign up</a></li>
	        <li>
                  <a href="/login">Sign in <span class="glyphicon glyphicon-log-in"></span></a>
            </li>
         </sec:authorize>
         
          <sec:authorize access="isAuthenticated()">
              <li class="dropdown">
                  <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                      <span class="glyphicon glyphicon-user"></span>
                      <sec:authentication property="principal.user.firstName" /> <b class="caret"></b>
                  </a>
                  <ul class="dropdown-menu">
                     <li><a href="/users/<sec:authentication property='principal.user.id' />"><span class="glyphicon glyphicon-user"></span> Profile</a></li>
                     <li>
	                    <c:url var="logoutUrl" value="/logout" />
		               	<form:form	id="logoutForm" action="${logoutUrl}" method="post">
					    </form:form>
					    <a href="#" onclick="document.getElementById('logoutForm').submit()"><span class="glyphicon glyphicon-log-out"></span> Sign out</a>
                     </li>
                  </ul>
              </li>
            </sec:authorize>
            
            <sec:authorize access="isAuthenticated()">
              <li class="dropdown">
                  <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                      <span class="glyphicon glyphicon-user"></span>client <b class="caret"></b>
                  </a>
                  <ul class="dropdown-menu">
                     <li><a href="/admin/client/create"><span class="glyphicon glyphicon-user"></span> create client</a></li>
                     <li><a href="/admin/client/list"><span class="glyphicon glyphicon-user"></span> All clients</a></li>
                  </ul>
              </li>
            </sec:authorize>
            
            <sec:authorize access="isAuthenticated()">
              <li class="dropdown">
                  <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                      <span class="glyphicon glyphicon-user"></span>employee <b class="caret"></b>
                  </a>
                  <ul class="dropdown-menu">
                     <li><a href="/admin/create-employee"><span class="glyphicon glyphicon-user"></span> create employee</a></li>
                     <li><a href="/admin/employees"><span class="glyphicon glyphicon-user"></span> All employees</a></li>
                  </ul>
              </li>
            </sec:authorize>
   </ul>
	    </div><!-- /.navbar-collapse -->
	  </div><!-- /.container-fluid -->
	</nav>

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
	