<%@ include file="/WEB-INF/jspf/htmlTags.jspf" %>
<%--@elvariable id="crPage" type="java.lang.Integer"--%>
<%--@elvariable id="info" type="se.inherit.componentsinfo.GeneralListInfo"--%>
<%--@elvariable id="pages" type="java.util.Collection<java.lang.Integer>"--%>
<%--@elvariable id="query" type="java.lang.String"--%>
<%--@elvariable id="result" type="org.hippoecm.hst.content.beans.query.HstQueryResult"--%>
<c:choose>
  <c:when test="${empty info}">
  	<tag:pagenotfound/>
  </c:when>
  <c:otherwise>
    <c:if test="${not empty info.title}">
      <hst:element var="headTitle" name="title">
        <c:out value="${info.title}"/>
      </hst:element>
      <hst:headContribution keyHint="headTitle" element="${headTitle}"/>
    </c:if>
    
    <h2>
      ${info.title} for '<c:out value="${query}"/>' : ${result.totalSize} results
    </h2>
    <ul>
      <c:forEach var="item" items="${result.hippoBeans}">
        <hst:link var="link" hippobean="${item}"/>
        <li class="overview-item">
          <hst:cmseditlink hippobean="${item}"/>
          <c:if test="${hst:isReadable(item, 'title')}">
          
          <a href="${link}">${item.title}</a>
          </c:if>
          <div>
            <c:if test="${hst:isReadable(item, 'date.time')}">
              <p><fmt:formatDate value="${item.date.time}" type="Date" pattern="MMMM d, yyyy h:mm a"/></p>
            </c:if>
            <c:if test="${hst:isReadable(item, 'summary')}">
	            <p>${item.summary}</p>
	           	 </c:if>	
          </div>
        </li>
      </c:forEach>
    </ul>
    
    <!--if there are pages on the request, they will be printed by the tag:pages -->
    <tag:pages pages="${pages}" page="${page}" query="${query}"/>
    
  </c:otherwise>
</c:choose>