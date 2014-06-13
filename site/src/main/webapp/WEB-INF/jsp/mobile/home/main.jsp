<%@ page language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/xml" prefix="x" %>
<%@ taglib uri="http://www.hippoecm.org/jsp/hst/core" prefix='hst'%>

<hst:include ref="mainmenu"/>


<div class="yui3-g" id="bodylayout-home">

	<div class="yui3-u" id="main">
		<div class="content-home">
		<hst:include ref="content"/>
		</div>
	</div>

	<div class="yui3-u" id="extra">
		<div class="content"> 
		<hst:include ref="right"/>
		</div>
	</div>
</div>

