<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/xml" prefix="x"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.hippoecm.org/jsp/hst/core" prefix='hst'%>

<!-- 
 <c:if test="${not empty document.title}">
	<hst:element var="headTitle" name="title">
		<c:out value="${document.title}" />
	</hst:element>
	<hst:headContribution keyHint="headTitle" element="${headTitle}" />
</c:if>
-->

<div class="container marketing">
	<div class="row">
		<c:forEach var="item" items="${result.hippoBeans}">
			<hst:link var="link" hippobean="${item}" />
			<!--  	<h3>
				<a href="${link}">${item.title}</a>
			</h3>
			<p class="document-summary">
				${item.summary}<a href="${link}"><fmt:message key="readmore" /></a>
			</p> -->
			<div class="col-lg-4">
				<hst:link var="img" hippobean="${item.image.original}" />
				<img class="img-circle" src="${img}" alt="hallo"
					style="width: 140px; height: 140px;">
				<h2>${item.title}</h2>
				<hst:html hippohtml="${item.html}" fullyQualifiedLinks="true" />
				<p>
					<a class="btn btn-default" href="#" role="button">${item.buttonTxt} &raquo;</a>
				</p>
			</div>
			<!-- /.col-lg-4 -->
		</c:forEach>
	</div>
	<!-- /.row -->
</div>

<footer>
	<p>&copy; Motrice AB 2014</p>
</footer>
