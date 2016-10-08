<%@include file="../includes/header.jsp"%>

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
							<th>First Name</th>
							<th>Last Name</th>
							<th>Email</th>
							<th>Edit</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="employee" items="${employees}">
							<tr>
								<td>${employee.firstName}</td>
								<td>${employee.lastName}</td>
								<td>${employee.email}</td>
								<td><a href="/admin/${employee.id}/update-employee"
											data-original-title="Edit this employee" data-toggle="tooltip"
											type="button" class="btn btn-sm btn-warning btn-responsive">
											<i class="glyphicon glyphicon-edit"></i>
										</a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
<%-- 				<c:if test="${result.hasContent()}"><%@include file="../includes/pagination.jsp"%></c:if>
 --%>			</div>
		</div>
	</div>
</div>
<%@include file="../includes/footer.jsp"%>