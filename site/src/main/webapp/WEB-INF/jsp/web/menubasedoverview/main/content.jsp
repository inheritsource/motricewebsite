<%@ page language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/xml" prefix="x"%>
<%@ taglib uri="http://www.hippoecm.org/jsp/hst/core" prefix="hst"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<div class="document-overview-header">
	<c:if test="${not empty overviewdoc}">
<!--  	<h3>${overviewdoc.title}</h3> -->
		<c:choose>
			<c:when test="${hst:isReadable(overviewdoc, 'body') }">
				<p>${overviewdoc.body}</p>
			</c:when>
			<c:when test="${hst:isReadable(overviewdoc, 'summary') }">
				<hst:link var="link" hippobean="${overviewdoc}" />
				<h3>${overviewdoc.title}</h3>
				<p class="document-summary">${overviewdoc.summary}</p>
			</c:when>
		</c:choose>
	</c:if>
</div>

<div class="document-overview">
	<c:if test="${not empty summarylist}">
		<c:forEach var="item" items="${summarylist}">
			<c:if test="${hst:isReadable(item, 'summary')}">
				<hst:link var="link" hippobean="${item}" />
				<h3>
					<a href="${link}">${item.title}</a>
				</h3>
				<p class="overview-list">
					${item.summary}&nbsp;<a href="${link}"><fmt:message
							key="readmore" /></a>
				</p>
			</c:if>
		</c:forEach>
	</c:if>
</div>


