<%@include file="../../includes/header.jsp"%>

<h1>Create User Page</h1>

<sec:authorize access="hasRole('ROLE_ADMIN')">

</sec:authorize>

<form:form modelAttribute="project" role="form">

	<form:errors />

	<div class="form-group">
		<form:label path="projectName">projectName: </form:label>
		<form:input path="projectName" type="text" class="form-control"
			placeholder="Enter your projectName" />
		<form:errors cssClass="error" path="projectName" />
		<p class="help-block">Please enter your projectName id</p>
	</div>

	<div class="form-group">
		<form:label path="projectManager">projectManager: </form:label>
		<form:input path="projectManager" type="text" class="form-control"
			placeholder="Enter your projectManager" />
		<form:errors cssClass="error" path="projectManager" />
		<p class="help-block">Please enter your projectManager</p>
	</div>
	
	<div class="form-group">
		<form:label path="launchDate">launchDate: </form:label>
		<form:input path="launchDate" type="text" class="form-control"
			placeholder="Enter your launchDate" />
		<form:errors cssClass="error" path="launchDate" />
		<p class="help-block">Please enter your launchDate</p>
	</div>
	
	<div class="form-group">
					<form:label path="chanceToClose" for="chanceToClose">
						<h4>Chance To Close Deal</h4>
					</form:label>
					<label class="radio-inline"> <form:radiobutton
							path="chanceToClose" value="true" /> <span class="lbl"> Yes </span>
					</label> <label class="radio-inline"> <form:radiobutton
							path="chanceToClose" value="false" /> <span class="lbl"> No </span>
					</label>
					<form:errors cssClass="error" path="chanceToClose">
					</form:errors>
				</div>
	
	<div class="form-group">
		<form:label path="estimatedBudget">estimatedBudget: </form:label>
		<form:input path="estimatedBudget" type="number" min="1" class="form-control"
			placeholder="Enter your estimatedBudget" />
		<form:errors cssClass="error" path="estimatedBudget" />
		<p class="help-block">Please enter your estimatedBudget</p>
	</div>
	
	<div class="form-group">
		<form:label path="projectDuration">projectDuration: </form:label>
		<form:input path="projectDuration" type="text" class="form-control"
			placeholder="Enter your projectDuration" />
		<form:errors cssClass="error" path="projectDuration" />
		<p class="help-block">Please enter your projectDuration</p>
	</div>
	
	<div class="form-group">
		<form:label path="projectAmount">projectAmount: </form:label>
		<form:input path="projectAmount" type="number" min="1" class="form-control"
			placeholder="Enter your projectAmount" />
		<form:errors cssClass="error" path="projectAmount" />
		<p class="help-block">Please enter your projectAmount</p>
	</div>
	
	<div class="form-group">
		<form:label path="totalRevenue">totalRevenue: </form:label>
		<form:input path="totalRevenue" type="text" class="form-control"
			placeholder="Enter your totalRevenue" />
		<form:errors cssClass="error" path="totalRevenue" />
		<p class="help-block">Please enter your totalRevenue</p>
	</div>
	
	<div class="form-group">
		<form:label path="projectStatus">projectStatus: </form:label>
		<form:input path="projectStatus" type="text" class="form-control"
			placeholder="Enter your projectStatus" />
		<form:errors cssClass="error" path="projectStatus" />
		<p class="help-block">Please enter your projectStatus</p>
	</div>
	
	<div class="form-group">
		<form:label path="contactName">contactName: </form:label>
		<form:input path="contactName" type="text" class="form-control"
			placeholder="Enter your contactName" />
		<form:errors cssClass="error" path="contactName" />
		<p class="help-block">Please enter your contactName</p>
	</div>
	
	<div class="form-group">
		<form:label path="contactTelephone">contactTelephone: </form:label>
		<form:input path="contactTelephone" type="text" class="form-control"
			placeholder="Enter your contactTelephone" />
		<form:errors cssClass="error" path="contactTelephone" />
		<p class="help-block">Please enter your contactTelephone</p>
	</div>
	
	<div class="form-group">
		<form:label path="rejectionReason" for="rejectionReason">rejectionReason</form:label>
		<form:textarea path="rejectionReason" class="ckeditor" rows="3"
			name="rejectionReason" id="rejectionReason"
			placeholder="enter rejectionReason"></form:textarea>
		<form:errors cssClass="error" path="rejectionReason"></form:errors>
	</div>
	
	<div class="form-group">
		<form:label path="projectDescription" for="projectDescription">projectDescription</form:label>
		<form:textarea path="projectDescription" class="ckeditor" rows="3"
			name="projectDescription" id="projectDescription"
			placeholder="enter projectDescription"></form:textarea>
		<form:errors cssClass="error" path="projectDescription"></form:errors>
	</div>
	
	<div class="form-group">
		<form:label path="projectNotes" for="projectNotes">projectNotes</form:label>
		<form:textarea path="projectNotes" class="ckeditor" rows="3"
			name="projectNotes" id="projectNotes"
			placeholder="enter projectNotes"></form:textarea>
		<form:errors cssClass="error" path="projectNotes"></form:errors>
	</div>
	
	<div class="form-group">
		<form:label path="cpId">Select Company </form:label>
		<select size="1" path="cpId" name="cpId" id="cpId"
			class="form-control">
			<c:forEach var="company" items="${clients}">
				<option value="${company.id}">${company.companyName}</option>
			</c:forEach>
		</select>
	</div>
	
	

	<button type="submit" class="btn btn-default">Create Project</button>

</form:form>

<sec:authorize access="hasRole('ROLE_MANAGER')">
Hello Manager !
</sec:authorize>



<%@include file="../../includes/footer.jsp"%>