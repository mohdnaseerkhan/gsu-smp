<%@include file="../includes/header.jsp"%>

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
  						<li class="list-group-item" style="border-style: hidden;">${clientProspect.companyDescription.replaceAll("<.*?>", "").substring(0,50)}...</li>
  						<li style="border-style: hidden;"><button style="border-style: hidden;" href="#myModal<c:out value="${loop.count}"/>" id="openBtn"
						data-toggle="modal" class="btn btn-default">view more...</button></li>
						<li><a style="border-style: hidden;" class="btn btn-info" role="button" href="/admin/contact/${contact.id}/update">Update</a></li>
						<li><a style="border-style: hidden;" class="btn btn-danger" role="button" href="/admin/contact/${contact.id}/delete">Delete</a></li>
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
						<li><a style="border-style: hidden;" class="btn btn-info" role="button" href="/admin/project/${project.id}/update">Update</a></li>
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
        <c:forEach var="proposal" items="${clientProspect.proposal}"
					begin="0" end="${clientProspect.proposal.size()}" varStatus="loopProposal">
					<ul class="list-inline" style="border-style: hidden;">
  						<li class="list-group-item" style="border-style: hidden;">${proposal.proposalName}</li>
  						<li class="list-group-item" style="border-style: hidden;">${proposal.accountManager}</li>
  						<li class="list-group-item" style="border-style: hidden;">${proposal.proposalStatus}</li>
  						<li style="border-style: hidden;"><button style="border-style: hidden;" href="#myproposal<c:out value="${loop.count}"/>" id="openBtn"
						data-toggle="modal" class="btn btn-default">view more...</button></li>
						<li><a style="border-style: hidden;" class="btn btn-info" role="button" href="/admin/proposal/${proposal.id}/update">Update</a></li>
					</ul>
					<hr></hr>					
						
						<div class="modal fade" id="myproposal<c:out value="${loop.count}"/>">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"
										aria-hidden="true">×</button>
									<h3 class="modal-title">proposal details</h3>
								</div>
								<div class="modal-body">
									<h5 class="text-center">${proposal.proposalName}</h5>
									<table class="table table-user-information">
							<tbody>
								<tr>
									<td>Opportunity Name:</td>
									<td>${proposal.accountManager}</td>
								</tr>
								<tr>
									<td>chanceToClose:</td>
									<td>${proposal.chanceToClose}</td>
								</tr>
								<tr>
									<td>estimatedBudget:</td>
									<td>${proposal.estimatedBudget}</td>
								</tr>
								<tr>
									<td>opportunityDuration:</td>
									<td>${proposal.proposalDuration}</td>
								</tr>
								<tr>
									<td>opportunityType:</td>
									<td>${proposal.proposalAmount}</td>
								</tr>
								<tr>
									<td>contactName:</td>
									<td>${proposal.totalRevenue}</td>
								</tr>
								<tr>
									<td>contactTelephone:</td>
									<td>${proposal.proposalStatus}</td>
								</tr>
								<tr>
									<td>opportunityDescription:</td>
									<td>${proposal.contactName}</td>
								</tr>
								<tr>
									<td>opportunityNotes:</td>
									<td>${proposal.contactTelephone}</td>
								</tr>
								<tr>
									<td>opportunityNotes:</td>
									<td>${proposal.rejectionReason}</td>
								</tr>
								<tr>
									<td>opportunityNotes:</td>
									<td>${proposal.proposalDescription}</td>
								</tr>
								<tr>
									<td>opportunityNotes:</td>
									<td>${proposal.proposalNotes}</td>
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
    <div class="tab-pane" id="blue">
    <c:forEach var="opportunity" items="${clientProspect.opportunity}"
					begin="0" end="${clientProspect.opportunity.size()}" varStatus="loop">
					<ul class="list-inline" style="border-style: hidden;">
  						<li class="list-group-item" style="border-style: hidden;">${opportunity.opportunityName}</li>
  						<li class="list-group-item" style="border-style: hidden;">${opportunity.contactName}</li>
  						<li class="list-group-item" style="border-style: hidden;">${opportunity.contactTelephone}</li>
  						<li style="border-style: hidden;"><button style="border-style: hidden;" href="#myOpportunity<c:out value="${loop.count}"/>" id="openBtn"
						data-toggle="modal" class="btn btn-default">view more...</button></li>
						<li><a style="border-style: hidden;" class="btn btn-info" role="button" href="/admin/opportunity/${opportunity.id}/update">Update</a></li>
					</ul>
					<hr></hr>					
						
						<div class="modal fade" id="myOpportunity<c:out value="${loop.count}"/>">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"
										aria-hidden="true">×</button>
									<h3 class="modal-title">opportunity details</h3>
								</div>
								<div class="modal-body">
									<h5 class="text-center">${opportunity.opportunityName}</h5>
									<table class="table table-user-information">
							<tbody>
								<tr>
									<td>Opportunity Name:</td>
									<td>${opportunity.opportunityName}</td>
								</tr>
								<tr>
									<td>chanceToClose:</td>
									<td>${opportunity.chanceToClose}</td>
								</tr>
								<tr>
									<td>estimatedBudget:</td>
									<td>${opportunity.estimatedBudget}</td>
								</tr>
								<tr>
									<td>opportunityDuration:</td>
									<td>${opportunity.opportunityDuration}</td>
								</tr>
								<tr>
									<td>opportunityType:</td>
									<td>${opportunity.opportunityType}</td>
								</tr>
								<tr>
									<td>contactName:</td>
									<td>${opportunity.contactName}</td>
								</tr>
								<tr>
									<td>contactTelephone:</td>
									<td>${opportunity.contactTelephone}</td>
								</tr>
								<tr>
									<td>opportunityDescription:</td>
									<td>${opportunity.opportunityDescription}</td>
								</tr>
								<tr>
									<td>opportunityNotes:</td>
									<td>${opportunity.opportunityNotes}</td>
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
</div>





<%@include file="../../includes/footer.jsp"%>