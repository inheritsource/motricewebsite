
<%@ page language="java" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/xml" prefix="x" %>
<%@ taglib uri="http://www.hippoecm.org/jsp/hst/core" prefix='hst'%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en" class="no-js">
  <head>
	    <meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
	    <hst:headContributions categoryExcludes="scripts,hippoPagecomposer" />

	    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js"></script>
	    <script language="javascript" src="<hst:link path="/js/jquery.tweet.js"/>" type="text/javascript"></script>
	    <script type="text/javascript" src="<hst:link path="/js/tweets.js"/>"></script>
	    <script type="text/javascript" src="<hst:link path="/js/modernizr.js"/>"></script>
	    <script src="//platform.twitter.com/widgets.js" type="text/javascript"></script>

	    <link rel="stylesheet" type="text/css" href="http://yui.yahooapis.com/3.4.0/build/cssreset/reset-min.css"/>
	    <link rel="stylesheet" type="text/css" href="http://yui.yahooapis.com/3.4.0/build/cssfonts/fonts-min.css"/>
	    <link rel="stylesheet" type="text/css" href="http://yui.yahooapis.com/3.4.0/build/cssbase/base-min.css"/>
	    <link rel="stylesheet" type="text/css" href="http://yui.yahooapis.com/3.4.0/build/cssgrids/grids-min.css"/>
		<link rel="stylesheet" href="<hst:link path="/css/inherit_style.css"/>" type="text/css"/>

		<!-- old analytics script
		<script type="text/javascript">
			var _gaq = _gaq || [];
			_gaq.push([ '_setAccount', 'UA-27121379-1' ]);
			_gaq.push([ '_trackPageview' ]);

			(function() {
				var ga = document.createElement('script');
				ga.type = 'text/javascript';
				ga.async = true;
				ga.src = ('https:' == document.location.protocol ? 'https://ssl'
						: 'http://www')
						+ '.google-analytics.com/ga.js';
				var s = document.getElementsByTagName('script')[0];
				s.parentNode.insertBefore(ga, s);
			})();
		</script> -->
</head>
	<body>
		<div id="top-bar">
			<div class="content">
				<hst:include ref="header" />
			</div>
		</div>

		<hst:include ref="main" />

<!--
		<div id="footer">
			<div class="content">

                <div id="footer-line"><br/></div>

				<div class="footer-item-label">
					<b><fmt:message key="address"/></b>
				</div>

				<div class="footer-item">
					Inherit S AB<br/>
					Långsjövägen 8<br/>
					131 33 Nacka<br/>
				</div>

				<div class="footer-item">
					<b><fmt:message key="phone"/>: </b> +46 8 641 64 14 <br/>
					<b><fmt:message key="mobile"/>: </b> +46 708 18 07 69<br/>
					<b><fmt:message key="email"/>: </b> info _at_ inherit.se<br/>
				</div>

			</div>
		</div>
 -->

		<hst:headContributions categoryIncludes="scripts" />
		<hst:headContributions categoryIncludes="hippoPagecomposer" />
	</body>
</html>
