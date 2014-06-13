<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://www.hippoecm.org/jsp/hst/core" prefix='hst'%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

		
<div id="header">

	<div id="div_logo">

		<!--  alt="    {fn:escapeXml(logo.alt)}" -->
		<c:if test="${not empty logo and not empty logo.original}">
		    <hst:link var="logoSrc" hippobean="${logo.original}"/>
		    <h1><img src="${logoSrc}" width="${logo.original.width}" height="${logo.original.height}" /></h1>
		</c:if>

	</div>
	
	<div id="div_contact">
		<span><fmt:message key="phone"/>: </span>+46 8 641 64 14 <br/>
		<span><fmt:message key="mobile"/>: </span>+46 708 18 07 69<br/>
		<span><fmt:message key="email"/>: </span>inherit _at_ inherit.se<br/>
	</div>

</div>
