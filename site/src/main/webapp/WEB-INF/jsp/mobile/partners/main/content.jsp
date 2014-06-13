
<%@ page language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/xml" prefix="x"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.hippoecm.org/jsp/hst/core" prefix='hst'%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:if test="${not empty document.orgName}">
	<hst:element var="headTitle" name="title">
		<c:out value="${info.title}" />
	</hst:element>
	<hst:headContribution keyHint="headTitle" element="${headTitle}" />
</c:if>

<h1>${document.title}</h1>

<p class="summary">${document.summary}</p>

<hst:html hippohtml="${document.presentation}" />

<c:if test="${hst:isReadable(document, 'logo')}">
	<c:if test="${fn:length(fn:trim(document.logo.original)) > 0 }">
		<hst:link var="logo" hippobean="${document.logo.original}" />
		<p>
			<br /> 
			<img src="${logo}" title="${document.logo.fileName}" alt="${document.logo.fileName}" /> 
			<br />
			${document.logo.description}
		</p>
	</c:if>
</c:if>
</p>



