<%@include file="../includes/header.jsp"%>

<h1>Create User Page</h1>

<sec:authorize access="hasRole('ROLE_ADMIN')">

</sec:authorize>

<form:form modelAttribute="user" role="form">

	<form:errors />

	<div class="form-group">
		<form:label path="firstName">firstName: </form:label>
		<form:input path="firstName" type="text" class="form-control"
			placeholder="Enter your firstName" />
		<form:errors cssClass="error" path="firstName" />
		<p class="help-block">Please enter your firstName id</p>
	</div>

	<div class="form-group">
		<form:label path="lastName">lastName: </form:label>
		<form:input path="lastName" type="text" class="form-control"
			placeholder="Enter your lastName" />
		<form:errors cssClass="error" path="lastName" />
		<p class="help-block">Please enter your lastName id</p>
	</div>

	<div class="form-group">
		<form:label path="email">Email address</form:label>
		<form:input path="email" type="email" class="form-control"
			placeholder="Enter email" />
		<form:errors cssClass="error" path="email" />
		<p class="help-block">Please enter your email id</p>
	</div>

	<div class="form-group">
		<form:label path="roles"> Role </form:label>
		<select size="1" path="roles" name="roles" id="roles"
			class="form-control">
			<c:forEach var="role" items="${roles}">
				<option value="${role}" selected="selected">${role}</option>
			</c:forEach>
		</select>
	</div>

	<button type="submit" class="btn btn-default">Create User</button>

</form:form>

<sec:authorize access="hasRole('ROLE_MANAGER')">
Hello Manager !
</sec:authorize>



<%@include file="../includes/footer.jsp"%>