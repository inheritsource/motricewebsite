<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/xml" prefix="x"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.hippoecm.org/jsp/hst/core" prefix='hst'%>

<c:if test="${not empty document.title}">
  <hst:element var="headTitle" name="title">
    <c:out value="${document.title}"/>
  </hst:element>
  <hst:headContribution keyHint="headTitle" element="${headTitle}" />
</c:if>

<!-- 
<h2>${document.title}</h2>
<p>I18n key example: <fmt:message key="home.title"/></p>
<p>${document.summary}</p>
  
<div class="jumbotron">  
<hst:html hippohtml="${document.html}"/> 
</div>
 -->

<div class="jumbotron">
  <div class="container">
  <h1>Motrice processplattform</h1>
  <p>
    En web-baserad processplattform som koordinerar anv&auml;ndarna och s&auml;krar organisationens arbetsfl&ouml;den.
  </p>
  </div>
</div>
<p>hilightcontent</p>
<div class="container">
 <c:forEach var="item" items="${result.hippoBeans}">
    <hst:link var="link" hippobean="${item}"/>

    <h3><a href="${link}">${item.title}</a></h3>
    <p class="document-summary">${item.summary}<a href="${link}"><fmt:message key="readmore"/></a></p>
  </c:forEach>
<!--  <hst:html hippohtml="${document.html}"/> --> 
  <footer>
    <p>&copy; Motrice AB 2014</p>
  </footer>
</div>
      