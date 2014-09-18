<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/xml" prefix="x"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.hippoecm.org/jsp/hst/core" prefix='hst'%>

<c:if test="${not empty document.title}">
	<hst:element var="headTitle" name="title">
		<c:out value="${document.title}" />
	</hst:element>
	<hst:headContribution keyHint="headTitle" element="${headTitle}" />
</c:if>

<!-- Carousel
    ================================================== -->
<div id="myCarousel" class="carousel slide" data-ride="carousel" data-interval="8000" data-pause="hover">
	<!-- Indicators -->
	<ol class="carousel-indicators">
		<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
		<li data-target="#myCarousel" data-slide-to="1"></li>
		<li data-target="#myCarousel" data-slide-to="2"></li>
		<li data-target="#myCarousel" data-slide-to="3"></li>
	</ol>
	<div class="carousel-inner">
		<%!Boolean seen = false;%>
		<c:forEach var="item" items="${result.hippoBeans}">
			<%
				if (seen) {
			%>
			<div class="item">
				<%
					} else {
				%>
				<div class="item active">
					<%
						seen = true;
							}
					%>
					<hst:link var="img" hippobean="${item.image.original}" />
					<div style="height:300px;">
						<img src="${img}" class="resize" title="${item.title}" alt="${item.title}" />
					</div>
					<div class="container">
						<div class="carousel-caption">
							<h1>${item.summary}</h1>
							<hst:html hippohtml="${item.html}" />
							<p>
								<a class="btn btn-lg btn-primary btn-carousel" href="#" role="button">${item.buttonTxt} &raquo;</a>
							</p>
						</div>
					</div>
				</div>
		</c:forEach>
		<%
			seen = false;
		%>
	</div>
	<a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev"><span class="glyphicon glyphicon-chevron-left"></span></a>
	<a class="right carousel-control" href="#myCarousel" role="button" data-slide="next"><span class="glyphicon glyphicon-chevron-right"></span></a>
<!-- /.carousel -->
</div>
