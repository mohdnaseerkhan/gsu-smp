<%@include file="../includes/header.jsp"%>

<h1>Create Client Contact</h1>

<sec:authorize access="hasRole('ROLE_ADMIN')">

</sec:authorize>

<form:form modelAttribute="contact" role="form">

	<form:errors />

	<div class="form-group">
		<form:label path="email">email: </form:label>
		<form:input path="email" type="text" class="form-control"
			placeholder="Enter email" />
		<form:errors cssClass="error" path="email" />
		<p class="help-block">Please enter Client email</p>
	</div>

	<div class="form-group">
		<form:label path="lastName">lastName</form:label>
		<form:input path="lastName" type="lastName" class="form-control"
			placeholder="Enter lastName" />
		<form:errors cssClass="error" path="lastName" />
		<p class="help-block">Please enter Client lastName</p>
	</div>

	<div class="form-group">
		<form:label path="firstName">firstName</form:label>
		<form:input path="firstName" type="firstName" class="form-control"
			placeholder="Enter firstName" />
		<form:errors cssClass="error" path="firstName" />
		<p class="help-block">Please enter Client firstName</p>
	</div>

	<div class="form-group">
		<form:label path="title">title</form:label>
		<form:input path="title" type="title" class="form-control"
			placeholder="Enter title" />
		<form:errors cssClass="error" path="title" />
		<p class="help-block">Please enter Client title</p>
	</div>

	<div class="form-group">
		<form:label path="mobilePhone">mobilePhone: </form:label>
		<form:input path="mobilePhone" type="text" class="form-control"
			placeholder="Enter mobilePhone" />
		<form:errors cssClass="error" path="mobilePhone" />
		<p class="help-block">Please enter mobilePhone</p>
	</div>

	<div class="form-group">
		<form:label path="workPhone">workPhone: </form:label>
		<form:input path="workPhone" type="text" class="form-control"
			placeholder="Enter workPhone" />
		<form:errors cssClass="error" path="workPhone" />
		<p class="help-block">Please enter workPhone</p>
	</div>

	<div class="form-group">
		<form:label path="fax">fax: </form:label>
		<form:input path="fax" type="text" class="form-control"
			placeholder="Enter fax" />
		<form:errors cssClass="error" path="fax" />
		<p class="help-block">Please enter fax</p>
	</div>

	<div class="form-group">
		<form:label path="enews" for="enews">
			<h4>enews</h4>
		</form:label>
		<label class="radio-inline"> <form:radiobutton path="enews"
				value="true" /> <span class="lbl"> Enable </span>
		</label> <label class="radio-inline"> <form:radiobutton path="enews"
				value="false" /> <span class="lbl"> Desable </span>
		</label>
		<form:errors cssClass="error" path="enews">
		</form:errors>
	</div>

	<div class="form-group">
		<form:label path="cpId">Select Company </form:label>
		<select size="1" path="cpId" name="cpId" id="cpId"
			class="form-control">
			<c:forEach var="company" items="${clients}">
				<option value="${company.id}"
					<c:if test="${company.id eq contact.cpId}">selected="selected"</c:if> >${company.companyName}</option>
			</c:forEach>
		</select>
	</div>

	<button type="submit" class="btn btn-default">Create Contact</button>

</form:form>

<sec:authorize access="hasRole('ROLE_MANAGER')">
Hello Manager !
</sec:authorize>



<%@include file="../../includes/footer.jsp"%>