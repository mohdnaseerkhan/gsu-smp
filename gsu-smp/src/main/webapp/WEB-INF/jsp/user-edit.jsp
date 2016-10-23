<%@include file="admin/includes/header.jsp"%>

<div class="panel panel-primary">

    <div class="panel-heading">
        <h3 class="panel-title">Profile</h3>
    </div>
    
    <div class="panel-body">
    
            <form:form modelAttribute="user" class="form-horizontal" role="form">

	            <div class="form-group">
					<form:label path="firstName" class="col-lg-2 control-label">firstName</form:label>
					<div class="col-lg-10">
						<form:input path="firstName" class="form-control" placeholder="firstName" />
						<form:errors cssClass="error" path="firstName" />
						<p class="help-block">Enter your firstName.</p>
					</div>
				</div>
				
				<div class="form-group">
					<form:label path="lastName" class="col-lg-2 control-label">lastName</form:label>
					<div class="col-lg-10">
						<form:input path="lastName" class="form-control" placeholder="lastName" />
						<form:errors cssClass="error" path="lastName" />
						<p class="help-block">Enter your lastName.</p>
					</div>
				</div>
				
				<div class="form-group">
					<form:label path="phone" class="col-lg-2 control-label">phone</form:label>
					<div class="col-lg-10">
						<form:input path="phone" class="form-control" placeholder="phone" />
						<form:errors cssClass="error" path="phone" />
						<p class="help-block">Enter your phone</p>
					</div>
				</div>
				
				<div class="form-group">
					<form:label path="address" class="col-lg-2 control-label">address</form:label>
					<div class="col-lg-10">
						<form:input path="address" class="form-control" placeholder="address" />
						<form:errors cssClass="error" path="address" />
						<p class="help-block">Enter your address.</p>
					</div>
				</div>
				
				<div class="form-group">
					<form:label path="city" class="col-lg-2 control-label">city</form:label>
					<div class="col-lg-10">
						<form:input path="city" class="form-control" placeholder="city" />
						<form:errors cssClass="error" path="city" />
						<p class="help-block">Enter your city.</p>
					</div>
				</div>
				
				<div class="form-group">
					<form:label path="state" class="col-lg-2 control-label">state</form:label>
					<div class="col-lg-10">
						<form:input path="state" class="form-control" placeholder="state" />
						<form:errors cssClass="error" path="state" />
						<p class="help-block">Enter your state.</p>
					</div>
				</div>
				
				<div class="form-group">
					<form:label path="country" class="col-lg-2 control-label">country</form:label>
					<div class="col-lg-10">
						<form:input path="country" class="form-control" placeholder="country" />
						<form:errors cssClass="error" path="country" />
						<p class="help-block">Enter your country.</p>
					</div>
				</div>
				
				<div class="form-group">
					<form:label path="postal" class="col-lg-2 control-label">postal</form:label>
					<div class="col-lg-10">
						<form:input path="postal" class="form-control" placeholder="postal" />
						<form:errors cssClass="error" path="postal" />
						<p class="help-block">Enter your postal.</p>
					</div>
				</div>
				
				<div class="form-group">
					<form:label path="gender" class="col-lg-2 control-label">gender</form:label>
					<div class="col-lg-10">
						<form:input path="gender" class="form-control" placeholder="gender" />
						<form:errors cssClass="error" path="gender" />
						<p class="help-block">Enter your gender</p>
					</div>
				</div>
				
				<div class="form-group">
					<form:label path="dob" class="col-lg-2 control-label">birth date</form:label>
					<div class="col-lg-10">
						<form:input path="dob" class="form-control" placeholder="dob" />
						<form:errors cssClass="error" path="dob" />
						<p class="help-block">Enter your birth date</p>
					</div>
				</div>

				<%-- <sec:authorize access="hasRole('ROLE_ADMIN')">
		            <div class="form-group">
						<form:label path="roles" class="col-lg-2 control-label">Roles</form:label>
						<div class="col-lg-10">
							<form:input path="roles" class="form-control" placeholder="Roles" />
							<form:errors cssClass="error" path="roles" />
							<p class="help-block">Enter the roles of the user, separated by commas</p>
						</div>
					</div>
				</sec:authorize> --%>
            
	            <div class="form-group">
	                <div class="col-lg-offset-2 col-lg-10">
	                    <button type="submit" class="btn btn-primary">Update</button>
	                </div>
	            </div>
            
        </form:form>
            
    </div>
        
</div>

<%@include file="includes/footer.jsp"%>
	