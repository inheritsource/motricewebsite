<%@ include file="/WEB-INF/jspf/htmlTags.jspf" %>
<%--@elvariable id="document" type="se.motrice.hippo.beans.TextDocument"--%>
<%--@elvariable id="headTitle" type="java.lang.String"--%>

<c:choose>
  <c:when test="${empty document}">
    <tag:pagenotfound/>
  </c:when>
  <c:otherwise>

  <div class="jumbotron">
        <h1>Om Motrice</h1>

        <p class="lead">
	  Motrice är
	</p>

        <ul>
          <li>
	    <b>Ett källkodsöppet it-system</b>
	    <p>
	      Designat för att skapa "processmedvetna" eller "processdrivna"
	      verksamhetssystem.
	    </p>
	  </li>

          <li>
	    <b>En "community" under uppbyggnad</b>

	    <p>
	      Systemets öppenhet innebär att flera aktörer kan delta i
	      utvecklingen av systemet. En "aktör" kan i detta sammanhang vara t.ex:
	    </p>

            <ul>
              <li>	
		<p>En kommun eller offentlig etat</p>
              </li>

              <li>	
		<p>Ett företag</p>
              </li>

              <li>	
		<p>En privatperson</p>
              </li>
	    </ul>

            <p>
	      Typiskt vill "communityn" bestå både av "leverantörer" och
              avnämare. På sikt kommer man att styra upp detta i någon form av
              organisation, t.ex en stiftelse.
	    </p>
	</ul>
      </div>

      

    <c:if test="${not empty document.title}">
      <hst:element var="headTitle" name="title">
        <c:out value="${document.title}"/>
      </hst:element>
      <hst:headContribution keyHint="headTitle" element="${headTitle}"/>
    </c:if>

    <article class="well well-large">
      <hst:cmseditlink hippobean="${document}"/>
      <header>
        <h2>${fn:escapeXml(document.title)}</h2>
        <p>${fn:escapeXml(document.summary)}</p>
      </header>
      <hst:html hippohtml="${document.html}"/>
    </article>

    <p>I18n key example: <fmt:message key="home.title"/></p>

  </c:otherwise>
</c:choose>

<hst:include ref="container"/>


<div class="footer">
     <p>&copy; Motrice 2013</p>
</div>