<%@ page language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/xml" prefix="x" %>
<%@ taglib uri="http://www.hippoecm.org/jsp/hst/core" prefix='hst'%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div id="bxnews" class="contentbox">
	<div class="bxtitle"><fmt:message key="news"/></div>
	<div class="bxcontent">
	  <c:forEach var="item" items="${result.hippoBeans}">
	    <hst:link var="link" hippobean="${item}"/>
		<ul class=bxlist>
		    <li class="bxlist-date">
		       <c:if test="${hst:isReadable(item, 'date')}">
		          <fmt:formatDate value="${item.date.time}" type="Date" pattern="d MMMM yyyy" />
		       </c:if>
		    </li>
		    <li class="bxlist-title">
		      <a href="${link}">${item.title}</a>
		    </li>
		</ul>
	  </c:forEach>
	  
	  <hst:link var="link" path="/news" />

	  <ul class=bxlist><li class="bxlist-readmore"><a href="${link}"><fmt:message key="morenews"/></a></li></ul>
	  
	  
    </div>
</div>



