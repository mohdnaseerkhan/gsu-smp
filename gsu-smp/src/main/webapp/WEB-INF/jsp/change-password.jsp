<%@include file="includes/header.jsp"%>

<div class="panel panel-default">

	<div class="panel-heading">
		<h3 class="panel-title">Reset password</h3>
	</div>
	
	<div class="panel-body">
	
		<form:form modelAttribute="changePasswordForm" role="form">
		
			<form:errors />
			
			<div class="form-group">
				<form:label path="password">Current password</form:label>
				<form:password path="password" class="form-control" placeholder="Current password" />
				<form:errors cssClass="error" path="password" />
			</div>
			
			<div class="form-group">
				<form:label path="newPassword">new password</form:label>
				<form:password path="newPassword" class="form-control" placeholder="new password" />
				<form:errors cssClass="error" path="newPassword" />
			</div>
			
			<div class="form-group">
				<form:label path="confirmPassword">confirm password</form:label>
				<form:password path="confirmPassword" class="form-control" placeholder="confirm password" />
				<form:errors cssClass="error" path="confirmPassword" />
			</div>
			
			<button type="submit" class="btn btn-default">Submit</button>
			
		</form:form>
	</div>
</div>

<%@include file="includes/footer.jsp"%>
