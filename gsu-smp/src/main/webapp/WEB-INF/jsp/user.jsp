<%@include file="admin/includes/header.jsp"%>

<div class="container">
	<div class="row visible-on">
		<div class="col-md-12">
			<div class="page-header">
				<div class="row">
					<div class="col-md-8">
						</br>
					</div>
				</div>
				<h2>User Profile</h2>
			</div>
		</div>
	</div>

	 <div class="row visible-on">
		<div class="col-md-12"> 

			<div class="panel panel-primary">

				<div class="panel-heading">
					<h3 class="panel-title">Profile</h3>
				</div>

				<div class="panel-body">
					<dl class="dl-horizontal">
						<dt>First Name</dt>
						<dd>
							<c:out value="${user.firstName}" />
						</dd>
						<dt>Last Name</dt>
						<dd>
							<c:out value="${user.lastName}" />
						</dd>
						<dt>Email</dt>
						<dd>
							<c:out value="${user.email}" />
						</dd>
						<dt>phone</dt>
						<dd>
							<c:out value="${user.phone}" />
						</dd>
						<dt>address</dt>
						<dd>
							<c:out value="${user.address}" />
						</dd>
						<dt>city</dt>
						<dd>
							<c:out value="${user.city}" />
						</dd>
						<dt>state</dt>
						<dd>
							<c:out value="${user.state}" />
						</dd>
						<dt>country</dt>
						<dd>
							<c:out value="${user.country}" />
						</dd>
						<dt>postal</dt>
						<dd>
							<c:out value="${user.postal}" />
						</dd>
						<dt>gender</dt>
						<dd>
							<c:out value="${user.gender}" />
						</dd>
						<dt>dob</dt>
						<dd>
							<c:out value="${user.dob}" />
						</dd>
					</dl>
				</div>

				<c:if test="${user.editable}">
					<div class="panel-footer">
						
						<a class="btn btn-primary" href="/users/${user.id}/edit"><span>Edit</span>
						</a> 
						<a class="btn btn-primary" href="/users/${user.id}/change-password">
							<span>Change password</span> </a> 						

					</div>
				</c:if>

			</div>
			</div>
			</div>
			</div>
			

<%@include file="includes/footer.jsp"%>