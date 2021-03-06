<%@include file="../includes/header.jsp"%>

<h1></h1>

<div class="container">
	<div class="row visible-on">
		<div class="col-md-12">
			<div class="page-header">
				<div class="row">
					<div class="col-md-8">
						</br>
					</div>
				</div>
				<h2>Create Employee</h2>
			</div>
		</div>
	</div>

	<div class="row visible-on">
		<div class="col-md-12">
			<div class="table-responsive">

				<form:form modelAttribute="user" role="form">

					<form:errors />

					<div class="form-group">
						<form:label path="firstName">firstName: </form:label>
						<form:input path="firstName" type="text" class="form-control"
							placeholder="Enter your firstName" />
						<form:errors cssClass="error" path="firstName" />
						<p class="help-block">Please enter your firstName</p>
					</div>

					<div class="form-group">
						<form:label path="lastName">lastName: </form:label>
						<form:input path="lastName" type="text" class="form-control"
							placeholder="Enter your lastName" />
						<form:errors cssClass="error" path="lastName" />
						<p class="help-block">Please enter your lastName</p>
					</div>
					<c:if test="${user.getRoles().size() eq 0}">
						<div class="form-group">
							<form:label path="email">Email address</form:label>
							<form:input path="email" type="email" class="form-control"
								placeholder="Enter email" />
							<form:errors cssClass="error" path="email" />
							<p class="help-block">Please enter your email</p>
						</div>
					</c:if>
					<c:if test="${user.getRoles().size() gt 0}">
						<form:hidden path="email" />
					</c:if>
					<div class="form-group">
						<form:label path="roles"> Role </form:label>
						<select size="1" path="roles" name="roles" id="roles"
							class="form-control">
							<c:forEach var="role" items="${roles}">
								<option value="${role}"
									<c:if test="${role eq user.getRoles().toString().replace('[', '').replace(']', '')}">selected="selected"</c:if>>${role}</option>
							</c:forEach>
						</select>
					</div>

					<button type="submit" class="btn btn-default">Create User</button>

				</form:form>
				</div>
				</div>
				</div>
				</div>

<%@include file="../includes/footer.jsp"%>