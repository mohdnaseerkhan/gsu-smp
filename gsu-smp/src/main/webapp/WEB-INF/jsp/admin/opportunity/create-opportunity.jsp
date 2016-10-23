<%@include file="../includes/header.jsp"%>

<h1>Create Opportunity Page</h1>

<sec:authorize access="hasRole('ROLE_ADMIN')">

</sec:authorize>

<form:form modelAttribute="opportunity" role="form">

	<form:errors />

	<div class="form-group">
		<form:label path="opportunityName">opportunity Name: </form:label>
		<form:input path="opportunityName" type="text" class="form-control"
			placeholder="Enter your opportunityName" />
		<form:errors cssClass="error" path="opportunityName" />
		<p class="help-block">Please enter your opportunityName </p>
	</div>

	<div class="form-group">
		<form:label path="chanceToClose" for="chanceToClose">
			<h4>Chance To Close Deal</h4>
		</form:label>
		<label class="radio-inline"> <form:radiobutton
				path="chanceToClose" value="true" /> <span class="lbl"> Yes
		</span>
		</label> <label class="radio-inline"> <form:radiobutton
				path="chanceToClose" value="false" /> <span class="lbl"> No
		</span>
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
		<form:label path="opportunityDuration">opportunityDuration: </form:label>
		<form:input path="opportunityDuration" type="number" min="1" class="form-control"
			placeholder="Enter your opportunityDuration" />
		<form:errors cssClass="error" path="opportunityDuration" />
		<p class="help-block">Please enter your opportunityDuration</p>
	</div>
	
	<%-- <div class="form-group">
		<form:label path="opportunityDuration">opportunityDuration: </form:label>
		<form:input path="opportunityDuration" type="number" class="form-control"
			placeholder="Enter your opportunityDuration" />
		<form:errors cssClass="error" path="opportunityDuration" />
		<p class="help-block">Please enter your opportunityDuration</p>
	</div> --%>
	
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
		<form:label path="opportunityDescription" for="opportunityDescription">opportunityDescription</form:label>
		<form:textarea path="opportunityDescription" class="ckeditor" rows="3"
			name="opportunityDescription" id="opportunityDescription"
			placeholder="enter opportunityDescription"></form:textarea>
		<form:errors cssClass="error" path="opportunityDescription"></form:errors>
	</div>
	
	<div class="form-group">
		<form:label path="opportunityNotes" for="opportunityNotes">opportunityNotes</form:label>
		<form:textarea path="opportunityNotes" class="ckeditor" rows="3"
			name="opportunityNotes" id="opportunityNotes"
			placeholder="enter opportunityNotes"></form:textarea>
		<form:errors cssClass="error" path="opportunityNotes"></form:errors>
	</div>
	
	<div class="form-group">
		<form:label path="opportunityType" for="opportunityType">opportunityType</form:label>
		<form:textarea path="opportunityType" class="ckeditor" rows="3"
			name="opportunityType" id="opportunityType"
			placeholder="enter opportunityType"></form:textarea>
		<form:errors cssClass="error" path="opportunityType"></form:errors>
	</div>
	
	<div class="form-group">
		<form:label path="cpId">Select Company </form:label>
		<select size="1" path="cpId" name="cpId" id="cpId"
			class="form-control">
			<c:forEach var="company" items="${clients}">
				<option value="${company.id}"
					<c:if test="${company.id eq opportunity.cpId}">selected="selected"</c:if> >${company.companyName}</option>
			</c:forEach>
		</select>
	</div>

	<button type="submit" class="btn btn-default">Create Project</button>

</form:form>

<sec:authorize access="hasRole('ROLE_MANAGER')">
Hello Manager !
</sec:authorize>



<%@include file="../../includes/footer.jsp"%>