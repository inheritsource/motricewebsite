<%@ include file="/WEB-INF/jspf/htmlTags.jspf" %>
<%--@elvariable id="menu" type="org.hippoecm.hst.core.sitemenu.HstSiteMenu"--%>



<c:if test="${not empty menu.siteMenuItems}">

  <c:forEach var="item" items="${menu.siteMenuItems}">
          <c:if test="${item.expanded and not empty item.childMenuItems}">
          <ul class="nav-submenus">
              <c:forEach var="subitem" items="${item.childMenuItems}">
	          <hst:link var="link" link="${subitem.hstLink}"/>
                  <c:if test="${empty link}">
                        <c:set var="link" value="${subitem.externalLink}"/>
                  </c:if>
                  <c:choose>
                  <c:when test="${subitem.selected}">
		      <li class="active"><a href="${link}">${subitem.name}</a></li>
                  </c:when>
                  <c:otherwise>
                      <li><a href="${link}">${subitem.name}</a></li>
                  </c:otherwise>
                  </c:choose>
                      <c:if test="${subitem.expanded and not empty subitem.childMenuItems}">
                      <ul>
                      <c:forEach var="subsubitem" items="${subitem.childMenuItems}">
		         <hst:link var="link" link="${subsubitem.hstLink}"/>
			 <c:if test="${empty link}">
                            <c:set var="link" value="${subsubitem.externalLink}"/>
                         </c:if>
                          <c:choose >
                          <c:when test="${subsubitem.selected}">
                              <li class="active"><a href="${link}">${subsubitem.name}</a></li>
                          </c:when>
                          <c:otherwise>
			      <li><a href="${link}">${subsubitem.name}</a></li>
                          </c:otherwise>
                          </c:choose>
                      </c:forEach>
                      </ul>
                      </c:if>
              </c:forEach>
          </ul>
          </c:if>
  </c:forEach>
</c:if>
<hst:cmseditmenu menu="${menu}"/>
