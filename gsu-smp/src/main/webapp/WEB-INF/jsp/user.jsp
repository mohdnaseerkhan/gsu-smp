<%@include file="includes/header.jsp"%>	

<div class="panel panel-primary">

    <div class="panel-heading">
        <h3 class="panel-title">Profile</h3>
    </div>
    
    <div class="panel-body">
        <dl class="dl-horizontal">
            <dt>First Name</dt>
            <dd><c:out value="${user.firstName}" /></dd>
            <dt>Last Name</dt>
            <dd><c:out value="${user.lastName}" /></dd>
            <dt>Email</dt>
            <dd><c:out value="${user.email}" /></dd>
            <dt>phone</dt>
            <dd><c:out value="${user.phone}" /></dd>
            <dt>address</dt>
            <dd><c:out value="${user.address}" /></dd>
            <dt>city</dt>
            <dd><c:out value="${user.city}" /></dd>
            <dt>state</dt>
            <dd><c:out value="${user.state}" /></dd>
            <dt>country</dt>
            <dd><c:out value="${user.country}" /></dd>
            <dt>postal</dt>
            <dd><c:out value="${user.postal}" /></dd>
            <dt>gender</dt>
            <dd><c:out value="${user.gender}" /></dd>
            <dt>dob</dt>
            <dd><c:out value="${user.dob}" /></dd>
        </dl>
    </div>
    
	<c:if test="${user.editable}">
	    <div class="panel-footer">
	
	        <a class="btn btn-link" href="/users/${user.id}/edit">Edit</a>
	        <a class="btn btn-link" href="/users/${user.id}/change-password">Change password</a>
	        <a class="btn btn-link" href="/users/${user.id}/change-email">Change email id</a>
	
	    </div>
	</c:if>

</div>

<%@include file="includes/footer.jsp"%>