<%@include file="../../includes/header.jsp"%>

<ul class="nav nav-tabs" data-tabs="tabs">
    <li class="active"><a data-toggle="tab" href="#red">Client</a></li>
    <li><a data-toggle="tab" href="#orange">Contact</a></li>
    <li><a data-toggle="tab" href="#yellow">Project</a></li>
    <li><a data-toggle="tab" href="#green">Proposal</a></li>
    <li><a data-toggle="tab" href="#blue">Opportunity</a></li>
</ul>
<div class="tab-content">
    <div class="tab-pane active" id="red">
        
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
    <div class="tab-pane" id="orange">
        <c:forEach var="contact" items="${clientProspect.contacts}"
					begin="0" end="${clientProspect.contacts.size()}" varStatus="loop">
					<ul class="list-inline" style="border-style: hidden;">
  						<li class="list-group-item" style="border-style: hidden;">${contact.firstName}, ${contact.lastName}</li>
  						<li class="list-group-item" style="border-style: hidden;">${contact.email}</li>
  						<li class="list-group-item" style="border-style: hidden;">${contact.workPhone}</li>
  						<li style="border-style: hidden;"><button style="border-style: hidden;" href="#myModal<c:out value="${loop.count}"/>" id="openBtn"
						data-toggle="modal" class="btn btn-default">view more...</button></li>
					</ul>
					<hr></hr>					

					<div class="modal fade" id="myModal<c:out value="${loop.count}"/>">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"
										aria-hidden="true">×</button>
									<h3 class="modal-title">contact details</h3>
								</div>
								<div class="modal-body">
									<h5 class="text-center">${clientProspect.companyName}</h5>
									<table class="table table-user-information">
							<tbody>
								<tr>
									<td>First Name:</td>
									<td>${contact.firstName}</td>
								</tr>
								<tr>
									<td>LastName</td>
									<td>${contact.lastName}</td>
								</tr>
								<tr>
									<td>Email:</td>
									<td>${contact.email}</td>
								</tr>
								<tr>
									<td>Title</td>
									<td>${contact.title}</td>
								</tr>
								<tr>
									<td>Work Phone:</td>
									<td>${contact.workPhone}</td>
								</tr>
								<tr>
									<td>Mobile Phone:</td>
									<td>${contact.mobilePhone}</td>
								</tr>
								<tr>
									<td>Fax:</td>
									<td>${contact.fax}</td>
								</tr>
								</tbody>
								</table>
									
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-default "
										data-dismiss="modal">Close</button>
								</div>

							</div>
							<!-- /.modal-content -->
						</div>
						<!-- /.modal-dialog -->
					</div>
					<!-- /.modal -->
				</c:forEach>
    </div>
    <div class="tab-pane" id="yellow">
        <c:forEach var="project" items="${clientProspect.projects}"
					begin="0" end="${clientProspect.projects.size()}" varStatus="loop">
					<ul class="list-inline" style="border-style: hidden;">
  						<li class="list-group-item" style="border-style: hidden;">${project.projectName}</li>
  						<li class="list-group-item" style="border-style: hidden;">${project.contactName}</li>
  						<li class="list-group-item" style="border-style: hidden;">${project.contactTelephone}</li>
  						<li style="border-style: hidden;"><button style="border-style: hidden;" href="#myproject<c:out value="${loop.count}"/>" id="openBtn"
						data-toggle="modal" class="btn btn-default">view more...</button></li>
					</ul>
					<hr></hr>					

					<div class="modal fade" id="myproject<c:out value="${loop.count}"/>">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"
										aria-hidden="true">×</button>
									<h3 class="modal-title">contact details</h3>
								</div>
								<div class="modal-body">
									<h5 class="text-center">${clientProspect.companyName}</h5>
									<table class="table table-user-information">
							<tbody>
								<tr>
									<td>Project Name:</td>
									<td>${project.projectName}</td>
								</tr>
								<tr>
									<td>ContactName:</td>
									<td>${project.contactName}</td>
								</tr>
								<tr>
									<td>Contact Telephone:</td>
									<td>${project.contactTelephone}</td>
								</tr>
								<tr>
									<td>Project Manager:</td>
									<td>${project.projectManager}</td>
								</tr>
								<tr>
									<td>Launch Date:</td>
									<td>${project.launchDate}</td>
								</tr>
								<tr>
									<td>Chance To Close:</td>
									<td>${project.chanceToClose}</td>
								</tr>
								<tr>
									<td>Estimated Budget:</td>
									<td>${project.estimatedBudget}</td>
								</tr>
								<tr>
									<td>Project Duration:</td>
									<td>${contact.projectDuration}</td>
								</tr>
								<tr>
									<td>Project Amount:</td>
									<td>${project.projectAmount}</td>
								</tr>
								<tr>
									<td>Total Revenue:</td>
									<td>${project.totalRevenue}</td>
								</tr>
								<tr>
									<td>Project Status:</td>
									<td>${project.projectStatus}</td>
								</tr>
								<tr>
									<td>Rejection Reason:</td>
									<td>${project.rejectionReason}</td>
								</tr>
								<tr>
									<td>Project Description:</td>
									<td>${project.projectDescription}</td>
								</tr>
								<tr>
									<td>Project Notes:</td>
									<td>${project.projectNotes}</td>
								</tr>
								<tr>
								</tbody>
								</table>
									
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-default "
										data-dismiss="modal">Close</button>
								</div>

							</div>
							<!-- /.modal-content -->
						</div>
						<!-- /.modal-dialog -->
					</div>
					<!-- /.modal -->
				</c:forEach>
    </div>
    <div class="tab-pane" id="green">
        <h1>Green</h1>
        <p>green green green green green</p>
    </div>
    <div class="tab-pane" id="blue">
        <h1>Blue</h1>
        <p>blue blue blue blue blue</p>
    </div>
</div>





<%@include file="../../includes/footer.jsp"%>