<%@include file="../includes/header.jsp"%>

<h1>Create Client/Prospect</h1>

<sec:authorize access="hasRole('ROLE_ADMIN')">

</sec:authorize>

<form:form modelAttribute="clientProspect" role="form">

	<form:errors />

	<div class="form-group">
		<form:label path="companyName">companyName: </form:label>
		<form:input path="companyName" type="text" class="form-control"
			placeholder="Enter companyName" />
		<form:errors cssClass="error" path="companyName" />
		<p class="help-block">Please enter companyName</p>
	</div>

	<div class="form-group">
		<form:label path="companyDescription" for="companyDescription">Company Description</form:label>
		<form:textarea path="companyDescription" class="ckeditor" rows="3"
			name="companyDescription" id="companyDescription"
			placeholder="enter Company description"></form:textarea>
		<form:errors cssClass="error" path="companyDescription"></form:errors>
	</div>

	<div class="form-group">
		<form:label path="email">Email address</form:label>
		<form:input path="email" type="email" class="form-control"
			placeholder="Enter email" />
		<form:errors cssClass="error" path="email" />
		<p class="help-block">Please enter your email id</p>
	</div>
	
	<div class="form-group">
		<form:label path="phone">phone: </form:label>
		<form:input path="phone" type="text" class="form-control"
			placeholder="Enter phone" />
		<form:errors cssClass="error" path="phone" />
		<p class="help-block">Please enter phone</p>
	</div>		
	
	<div class="form-group">
		<form:label path="fax">fax: </form:label>
		<form:input path="fax" type="text" class="form-control"
			placeholder="Enter fax" />
		<form:errors cssClass="error" path="fax" />
		<p class="help-block">Please enter fax</p>
	</div>
	
	<div class="form-group">
		<form:label path="address">address: </form:label>
		<form:input path="address" type="text" class="form-control"
			placeholder="Enter address" />
		<form:errors cssClass="error" path="address" />
		<p class="help-block">Please enter address</p>
	</div>
	
	<div class="form-group">
		<form:label path="city">city: </form:label>
		<form:input path="city" type="text" class="form-control"
			placeholder="Enter city" />
		<form:errors cssClass="error" path="city" />
		<p class="help-block">Please enter city</p>
	</div>
	
	<div class="form-group">
		<form:label path="state">state: </form:label>
		<form:input path="state" type="text" class="form-control"
			placeholder="Enter state" />
		<form:errors cssClass="error" path="state" />
		<p class="help-block">Please enter state</p>
	</div>
	
	<div class="form-group">
		<form:label path="country">country: </form:label>
		<form:input path="country" type="text" class="form-control"
			placeholder="Enter country" />
		<form:errors cssClass="error" path="country" />
		<p class="help-block">Please enter country</p>
	</div>
	
	<div class="form-group">
		<form:label path="postal">postal: </form:label>
		<form:input path="postal" type="text" class="form-control"
			placeholder="Enter postal" />
		<form:errors cssClass="error" path="postal" />
		<p class="help-block">Please enter postal</p>
	</div>
	
	<div class="form-group">
		<form:label path="website">website: </form:label>
		<form:input path="website" type="text" class="form-control"
			placeholder="Enter website" />
		<form:errors cssClass="error" path="website" />
		<p class="help-block">Please enter website</p>
	</div>
	
	<div class="form-group">
		<form:label path="source">source: </form:label>
		<form:input path="source" type="text" class="form-control"
			placeholder="Enter source" />
		<form:errors cssClass="error" path="source" />
		<p class="help-block">Please enter source</p>
	</div>
	
	<div class="form-group">
					<form:label path="client" for="client">
						<h4>Client/Prospect</h4>
					</form:label>
					<label class="radio-inline"> <form:radiobutton
							path="client" value="true" /> <span class="lbl"> Client </span>
					</label> <label class="radio-inline"> <form:radiobutton
							path="client" value="false" /> <span class="lbl"> Prospect </span>
					</label>
					<form:errors cssClass="error" path="client">
					</form:errors>
				</div>

	<button type="submit" class="btn btn-default">Create User</button>

</form:form>

<sec:authorize access="hasRole('ROLE_MANAGER')">
Hello Manager !
</sec:authorize>



<%@include file="../includes/footer.jsp"%>