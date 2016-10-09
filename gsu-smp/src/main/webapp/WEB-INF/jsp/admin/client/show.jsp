<%@include file="../../includes/header.jsp"%>

<div class="container">
	<div class="row">
		<div class="col-sm-12">
			<div class="page-header">

				<h2>Show Contacts</h2>

			</div>
		</div>
	</div>
</div>


<div class="row">
	<div
		class="col-xs-12 col-sm-12 col-md-12 col-lg-12 col-xs-offset-0 col-sm-offset-0 col-md-offset-0 col-lg-offset-0 toppad">
		<div class="panel panel-info">
			<div class="panel-heading">
				<h3 class="panel-title">${clientProspect.companyName}</h3>
			</div>
			<div class="panel-body">
				<div class="row">
					<div class=" col-md-9 col-lg-9 ">
						<table class="table table-user-information">
							<tbody>
								<tr>
									<td>Email:</td>
									<td>${clientProspect.email}</td>
								</tr>
								<tr>
									<td>Phone</td>
									<td>${clientProspect.phone}</td>
								</tr>
								<tr>
									<td>Fax</td>
									<td>${clientProspect.fax}</td>
								</tr>
								<tr>
									<td>Address:</td>
									<td>${clientProspect.address}</td>
								</tr>
								<tr>
									<td>City:</td>
									<td>${clientProspect.city}</td>
								</tr>
								<tr>
									<td>State:</td>
									<td>${clientProspect.state}</td>
								</tr>

								<tr>
									<td>Country:</td>
									<td>${clientProspect.country}</td>
								</tr>
								<tr>
									<td>Website:</td>
									<td>${clientProspect.website}</td>
								</tr>
								<tr>
									<td>Postal:</td>
									<td>${clientProspect.postal}</td>
								</tr>
								<tr>
									<td>Division:</td>
									<td>${clientProspect.division}</td>
								</tr>
								<tr>
									<td>Industry</td>
									<td>${clientProspect.industry}</td>
								</tr>
								<tr>
									<td>Type:</td>
									<td>${clientProspect.type}</td>
								</tr>
								<tr>
									<td>Source:</td>
									<td>${clientProspect.source}</td>
								</tr>
								
								
								<tr>
									<td>Company Description:</td>
									<td>${clientProspect.companyDescription}</td>
								</tr>
								<tr>
									<td>Date Create:</td>
									<td>${clientProspect.dateCreated}</td>
								</tr>
								<tr>
									<td>Last Updated:</td>
									<td>${clientProspect.lastUpdated}</td>
								</tr>
								<tr>
									<td>Is Client:</td>
									<td>${clientProspect.client}</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<%@include file="../../includes/footer.jsp"%>