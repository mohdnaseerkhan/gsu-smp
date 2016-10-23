<%@include file="../includes/header.jsp"%>

<h1>Create Proposal</h1>

<sec:authorize access="hasRole('ROLE_ADMIN')">

</sec:authorize>

<form:form modelAttribute="proposal" role="form">

	<form:errors />

	<div class="form-group">
		<form:label path="proposalName">proposalName: </form:label>
		<form:input path="proposalName" type="text" class="form-control"
			placeholder="Enter your proposalName" />
		<form:errors cssClass="error" path="proposalName" />
		<p class="help-block">Please enter your proposalName</p>
	</div>
	
	<div class="form-group">
		<form:label path="accountManager">accountManager: </form:label>
		<form:input path="accountManager" type="text" class="form-control"
			placeholder="Enter your accountManager" />
		<form:errors cssClass="error" path="accountManager" />
		<p class="help-block">Please enter your accountManager</p>
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
		<form:label path="proposalDuration">proposalDuration: </form:label>
		<form:input path="proposalDuration" type="text" class="form-control"
			placeholder="Enter your proposalDuration" />
		<form:errors cssClass="error" path="proposalDuration" />
		<p class="help-block">Please enter your proposalDuration</p>
	</div>
	
	<div class="form-group">
		<form:label path="proposalAmount">proposalAmount: </form:label>
		<form:input path="proposalAmount" type="number" min="1" class="form-control"
			placeholder="Enter your proposalAmount" />
		<form:errors cssClass="error" path="proposalAmount" />
		<p class="help-block">Please enter your proposalAmount</p>
	</div>
	
	<div class="form-group">
		<form:label path="totalRevenue">totalRevenue: </form:label>
		<form:input path="totalRevenue" type="text" class="form-control"
			placeholder="Enter your totalRevenue" />
		<form:errors cssClass="error" path="totalRevenue" />
		<p class="help-block">Please enter your totalRevenue</p>
	</div>
	
	<div class="form-group">
		<form:label path="proposalStatus">proposalStatus: </form:label>
		<form:input path="proposalStatus" type="text" class="form-control"
			placeholder="Enter your proposalStatus" />
		<form:errors cssClass="error" path="proposalStatus" />
		<p class="help-block">Please enter your proposalStatus</p>
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
		<form:label path="proposalDescription" for="proposalDescription">proposalDescription</form:label>
		<form:textarea path="proposalDescription" class="ckeditor" rows="3"
			name="proposalDescription" id="proposalDescription"
			placeholder="enter proposalDescription"></form:textarea>
		<form:errors cssClass="error" path="proposalDescription"></form:errors>
	</div>
	
	<div class="form-group">
		<form:label path="proposalNotes" for="proposalNotes">proposalNotes</form:label>
		<form:textarea path="proposalNotes" class="ckeditor" rows="3"
			name="proposalNotes" id="proposalNotes"
			placeholder="enter proposalNotes"></form:textarea>
		<form:errors cssClass="error" path="proposalNotes"></form:errors>
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
	
	

	<button type="submit" class="btn btn-default">Create proposal</button>

</form:form>

<sec:authorize access="hasRole('ROLE_MANAGER')">
Hello Manager !
</sec:authorize>



<%@include file="../../includes/footer.jsp"%>