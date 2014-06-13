
<%@ page language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/xml" prefix="x"%>
<%@ taglib uri="http://www.hippoecm.org/jsp/hst/core" prefix='hst'%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<div class="yui3-g" id="topmenu">
	<div class="content">
		<ul class="yui3-u" id="topmenu-items">
			<c:forEach var="item" items="${menu.siteMenuItems}">
				<c:choose>
					<c:when test="${item.selected or item.expanded}">
						<li class="selected">${item.name}</li>
					</c:when>
					<c:otherwise>

						<hst:link var="link" link="${item.hstLink}" />
						<c:if test="${empty link}">
							<c:set var="link" value="${item.externalLink}" />
						</c:if>
						<li><a href="${link}"> ${item.name} </a></li>
					</c:otherwise>
				</c:choose>

			</c:forEach>
			<li>
				<hst:link var="link" path="/search" />
				<form action="${link}" method="POST"
					class="navbar-search pull-right">
					<input type="text" class="search-query"
						placeholder="<fmt:message key="search.submit.text"/>" name="query">
				</form>
			</li>

		</ul>
		<div class="spacer" style="clear: both;"></div>
	</div>
</div>

