<%@include file="../includes/header.jsp"%>

<h1>Create Client/Prospect</h1>

<c:forEach var="clientProspect" items="${clientProspect}">
<li>${clientProspect.companyName}</li>
</c:forEach>



<%@include file="../includes/footer.jsp"%>