<%@ include file="/WEB-INF/jspf/htmlTags.jspf"%>
<%--@elvariable id="headerName" type="java.lang.String"--%>

<div class="header div_color">
	<ul class="nav nav-pills pull-right" id="topmenu-items">
		<c:forEach var="item" items="${menu.siteMenuItems}">
			<hst:link var="link" link="${item.hstLink}" />
			<c:if test="${empty link}">
				<c:set var="link" value="${item.externalLink}" />
			</c:if>
			<c:choose>
				<c:when test="${item.selected or item.expanded}">
					<li class="active"><a href="${link}"> ${item.name}</a></li>
				</c:when>
				<c:otherwise>
					<li><a href="${link}"> ${item.name}</a></li>
				</c:otherwise>
			</c:choose>
		</c:forEach>
	</ul>
</div>

<div><hr class="separator_border" /></div>

<div class="header">
	<h3 class="text-muted">
		<hst:link var="motrice_logo" path="/assets/motrice_logo2.png" />
		<img id="front-logo-id" src="${motrice_logo}" /><span>
			Verksamhetens processer p&aring;&nbsp;verksamhetens&nbsp;villkor</span>
	</h3>
</div>
