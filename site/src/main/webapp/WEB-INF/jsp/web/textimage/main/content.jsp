
<%@ page language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/xml" prefix="x" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.hippoecm.org/jsp/hst/core" prefix='hst'%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:if test="${not empty document.title}">
  <hst:element var="headTitle" name="title">
    <c:out value="${document.title}"/>
  </hst:element>
  <hst:headContribution keyHint="headTitle" element="${headTitle}" />
</c:if>

<c:if test="${hst:isReadable(document, 'image') }">
  <c:if test="${fn:length(fn:trim(document.image.original)) > 0 }">
	  <hst:link var="img" hippobean="${document.image.original}"/>
	  <p>
	  <img src="${img}" title="${document.image.fileName}" class="resize" alt="${document.image.fileName}"/>
	  </p>
  </c:if>
</c:if>

<h1>${document.title}</h1>

<c:if test="${hst:isReadable(document, 'summary') }">
	<p class="summary">${document.summary}</p>
</c:if>

<hst:html hippohtml="${document.html}"/>
