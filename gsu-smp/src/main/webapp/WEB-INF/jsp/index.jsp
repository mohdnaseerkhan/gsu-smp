<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="">
	<meta name="author" content="">
	<link rel="shortcut icon" href="/public/lib/bootstrap-3.3.7/ico/favicon.ico">
	
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
				<a class="navbar-brand" href="index.html">GSU-SMP</a>
			</div>
			<div class="navbar-collapse collapse navbar-right">
				<ul class="nav navbar-nav">
					<li class="active"><a href="index.html">HOME</a></li>
					<li><a href="about.html">ABOUT</a></li>
					<li><a href="contact.html">CONTACT</a></li>
					<sec:authorize access="isAnonymous()">
						<li><a href="/login">Sign in <span class="glyphicon glyphicon-log-in"></span></a></li>
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

					<c:if test="${not empty flashMessage}">
						<div class="alert alert-${flashKind} alert-dismissable">
							<button type="button" class="close" data-dismiss="alert"
								aria-hidden="true">&times;</button>
							${flashMessage}
						</div>
					</c:if>

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
		<div class="container">
			<div class="row">
				<div class="col-lg-8 col-lg-offset-2">
					<h3>Show your work with this beautiful theme</h3>
					<h1>Eyecatching Bootstrap 3 Theme.</h1>
					<h5>Lorem Ipsum is simply dummy text of the printing and
						typesetting industry.</h5>
					<h5>More Lorem Ipsum added here too.</h5>
				</div>
				<div class="col-lg-8 col-lg-offset-2 himg">
					<img src="/public/lib/bootstrap-3.3.7/img/browser.png"
						class="img-responsive">
				</div>
			</div>
			<!-- /row -->
		</div>
		<!-- /container -->
	</div>
	<!-- /headerwrap -->

	<!-- *****************************************************************************************************************
	 SERVICE LOGOS
	 ***************************************************************************************************************** -->
	<div id="service">
		<div class="container">
			<div class="row centered">
				<div class="col-md-4">
					<i class="fa fa-heart-o"></i>
					<h4>Handsomely Crafted</h4>
					<p>Lorem Ipsum is simply dummy text of the printing and
						typesetting industry. Lorem Ipsum has been the industry's standard
						dummy text ever since the 1500s, when an unknown printer took a
						galley of type and scrambled it to make a type specimen book.</p>
					<p>
						<br /> <a href="#" class="btn btn-theme">More Info</a>
					</p>
				</div>
				<div class="col-md-4">
					<i class="fa fa-flask"></i>
					<h4>Retina Ready</h4>
					<p>Lorem Ipsum is simply dummy text of the printing and
						typesetting industry. Lorem Ipsum has been the industry's standard
						dummy text ever since the 1500s, when an unknown printer took a
						galley of type and scrambled it to make a type specimen book.</p>
					<p>
						<br /> <a href="#" class="btn btn-theme">More Info</a>
					</p>
				</div>
				<div class="col-md-4">
					<i class="fa fa-trophy"></i>
					<h4>Quality Theme</h4>
					<p>Lorem Ipsum is simply dummy text of the printing and
						typesetting industry. Lorem Ipsum has been the industry's standard
						dummy text ever since the 1500s, when an unknown printer took a
						galley of type and scrambled it to make a type specimen book.</p>
					<p>
						<br /> <a href="#" class="btn btn-theme">More Info</a>
					</p>
				</div>
			</div>
		</div>
		<! --/container -->
	</div>
	<! --/service -->

	<!-- *****************************************************************************************************************
	 PORTFOLIO SECTION
	 ***************************************************************************************************************** -->


	<!-- *****************************************************************************************************************
	 MIDDLE CONTENT
	 ***************************************************************************************************************** -->

	<!-- *****************************************************************************************************************
	 TESTIMONIALS
	 ***************************************************************************************************************** -->


	<!-- *****************************************************************************************************************
	 OUR CLIENTS
	 ***************************************************************************************************************** -->

	<!-- *****************************************************************************************************************
	 FOOTER
	 ***************************************************************************************************************** -->
	<div id="footerwrap">
		<div class="container">
			<div class="row">
				<div class="col-lg-4">
					<h4>About</h4>
					<div class="hline-w"></div>
					<p>Lorem Ipsum is simply dummy text of the printing and
						typesetting industry. Lorem Ipsum has been the industry's standard
						dummy text ever since the 1500s.</p>
				</div>
				<div class="col-lg-4">
					<h4>Social Links</h4>
					<div class="hline-w"></div>
					<p>
						<a href="#"><i class="fa fa-facebook"></i></a> 
						<a href="#"><i class="fa fa-twitter"></i></a> 
						<a href="#"><i class="fa fa-instagram"></i></a> 
					</p>
				</div>
				<div class="col-lg-4">
					<h4>Our Address</h4>
					<div class="hline-w"></div>
					<p>
						6309, N Artesian Ave,<br /> 60659, Chicago,<br /> United States.<br />
					</p>
				</div>

			</div>
			<! --/row -->
		</div>
		<! --/container -->
	</div>
	<! --/footerwrap -->

	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
	<script src="/public/lib/bootstrap-3.3.7/js/bootstrap.min.js"></script>
	<script src="/public/lib/bootstrap-3.3.7/js/retina-1.1.0.js"></script>
	<script src="/public/lib/bootstrap-3.3.7/js/jquery.hoverdir.js"></script>
	<script src="/public/lib/bootstrap-3.3.7/js/jquery.hoverex.min.js"></script>
	<script src="/public/lib/bootstrap-3.3.7/js/jquery.prettyPhoto.js"></script>
	<script src="/public/lib/bootstrap-3.3.7/js/jquery.isotope.min.js"></script>
	<script src="/public/lib/bootstrap-3.3.7/js/custom.js"></script>
	<script src="/public/lib/bootstrap-3.3.7/js/modernizr.js"></script>


	<script>
		// Portfolio
		(function($) {
			"use strict";
			var $container = $('.portfolio'), $items = $container
					.find('.portfolio-item'), portfolioLayout = 'fitRows';

			if ($container.hasClass('portfolio-centered')) {
				portfolioLayout = 'masonry';
			}

			$container.isotope({
				filter : '*',
				animationEngine : 'best-available',
				layoutMode : portfolioLayout,
				animationOptions : {
					duration : 750,
					easing : 'linear',
					queue : false
				},
				masonry : {}
			}, refreshWaypoints());

			function refreshWaypoints() {
				setTimeout(function() {
				}, 1000);
			}

			$('nav.portfolio-filter ul a').on('click', function() {
				var selector = $(this).attr('data-filter');
				$container.isotope({
					filter : selector
				}, refreshWaypoints());
				$('nav.portfolio-filter ul a').removeClass('active');
				$(this).addClass('active');
				return false;
			});

			function getColumnNumber() {
				var winWidth = $(window).width(), columnNumber = 1;

				if (winWidth > 1200) {
					columnNumber = 5;
				} else if (winWidth > 950) {
					columnNumber = 4;
				} else if (winWidth > 600) {
					columnNumber = 3;
				} else if (winWidth > 400) {
					columnNumber = 2;
				} else if (winWidth > 250) {
					columnNumber = 1;
				}
				return columnNumber;
			}

			function setColumns() {
				var winWidth = $(window).width(), columnNumber = getColumnNumber(), itemWidth = Math
						.floor(winWidth / columnNumber);

				$container.find('.portfolio-item').each(function() {
					$(this).css({
						width : itemWidth + 'px'
					});
				});
			}

			function setPortfolio() {
				setColumns();
				$container.isotope('reLayout');
			}

			$container.imagesLoaded(function() {
				setPortfolio();
			});

			$(window).on('resize', function() {
				setPortfolio();
			});
		})(jQuery);
	</script>
</body>
</html>