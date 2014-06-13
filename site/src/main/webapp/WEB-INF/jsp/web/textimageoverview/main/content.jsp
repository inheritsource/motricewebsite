
<%@ page language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/xml" prefix="x"%>
<%@ taglib uri="http://www.hippoecm.org/jsp/hst/core" prefix="hst"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:choose>
	<c:when test="${fn:length(document.documents) == 1}">
		<!--  BEGIN exakt ett dokument under menuitem, visa det i sin helhet -->
		<!--  		Detta borde inte ligga dubbelt här utan använda annan template textimage.main.content -->

		<c:if test="${not empty document.documents[0].title}">
			<hst:element var="headTitle" name="title">
				<c:out value="${document.documents[0].title}" />
			</hst:element>
			<hst:headContribution keyHint="headTitle" element="${headTitle}" />
		</c:if>
		<h1>${document.documents[0].title}</h1>
		<c:if test="${hst:isReadable(document, 'summary') }">
			<p class="summary">${document.documents[0].summary}</p>
		</c:if>
		<c:if test="${hst:isReadable(document.documents[0], 'image')}">
			<c:if
				test="${fn:length(fn:trim(document.documents[0].image.original)) > 0 }">
				<hst:link var="img"
					hippobean="${document.documents[0].image.original}" />
				<p>
					<img src="${img}" title="${document.documents[0].image.fileName}"
						alt="${document.documents[0].image.fileName}" />
				</p>
			</c:if>
		</c:if>
		<hst:html hippohtml="${document.documents[0].html}" />
		<!--  END exakt ett dokument under menuitem, visa det i sin helhet -->
	</c:when>
	<c:when test="${fn:length(document.documents) gt 1}">
		<!--  BEGIN flera dokument under menuitem, visa lista med summary och länkar -->

            <!--  visa rubrik och innehåll från summarydokument först -->
			<c:forEach var="item" items="${document.documents}">
				<c:choose>
				   <c:when test="${hst:isReadable(item, 'summary') == false}">
						<h1>${item.title}</h1>
						<hst:html hippohtml="${item.html}"/>
				   </c:when>
				</c:choose>
			</c:forEach>
						   
				  
			<!--  lista upp länkar och summary av alla andra dokument  -->
		<div class="document-summaries">
			<c:forEach var="item" items="${document.documents}">
				<c:choose>
				   <c:when test="${hst:isReadable(item, 'summary') }">
					<hst:link var="link" hippobean="${item}" />
					<h3><a href="${link}">${item.title}</a></h3>
					<p class="document-summary">${item.summary}&nbsp;<a href="${link}"><fmt:message key="readmore"/></a></p>
				   </c:when>
				</c:choose>
			</c:forEach>
		</div>
		<!--  END flera dokument under menuitem, visa lista med summary och länkar -->
	</c:when>
	<c:otherwise>
		<!--  mindre än ett dokument under menuitem -->
	</c:otherwise>
</c:choose>