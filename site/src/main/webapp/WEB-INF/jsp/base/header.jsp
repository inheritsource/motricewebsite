<%@ include file="/WEB-INF/jspf/htmlTags.jspf" %>
<%--@elvariable id="headerName" type="java.lang.String"--%>

  <div class="header">
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

    <h3 class="text-muted">
     <hst:link var="motrice_logo" path="/assets/motrice_logo.png"/>
    <img src="${motrice_logo}"/><br/><span>p&aring;&nbsp;verksamhetens&nbsp;villkor</span></h3>
  </div>
