<%@include file="../../includes/header.jsp"%>

<h1>Create Client/Prospect</h1>

<div class="container">
	<div class="row visible-on">
		<div class="col-md-12">
			<div class="page-header">
				<h2>All Employees</h2>
			</div>
		</div>
	</div>
	
	<div class="row visible-on">
		<div class="col-md-12">
			<div class="table-responsive">
				<table
					class="table table-striped table-bordered table-condensed table-hover">
					<thead>
						<tr class="info">
							<th>Company</th>
							<th>Email</th>
							<th>Phone</th>
							<th>Edit</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach var="clientProspect" items="${clientProspect}">
</c:forEach>
						<c:forEach var="clientProspect" items="${clientProspect}">
							<tr>
								<td>
								<a href="/admin/client/${clientProspect.id}/show"> ${clientProspect.companyName} </a>
								</td>
								<td>${clientProspect.email}</td>
								<td>${clientProspect.phone}</td>
								<td><a href="/admin/client/${clientProspect.id}/update"
									data-original-title="Edit this Client/Prospect"
									data-toggle="tooltip" type="button"
									class="btn btn-sm btn-warning btn-responsive"> <i
										class="glyphicon glyphicon-edit"></i>
								</a>
								<a href="/admin/client/${clientProspect.id}/delete"
									data-original-title="Delete this Client/Prospect"
									data-toggle="tooltip" type="button"
									class="btn btn-sm btn-danger btn-responsive"> <i
										class="glyphicon glyphicon-trash"></i>
								</a>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
<%-- 				<c:if test="${result.hasContent()}"><%@include file="../includes/pagination.jsp"%></c:if>
 --%>			</div>
		</div>
	</div>
</div>

<%@include file="../../includes/footer.jsp"%>