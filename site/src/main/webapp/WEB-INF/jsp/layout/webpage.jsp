<!doctype html>
<%@ include file="/WEB-INF/jspf/htmlTags.jspf"%>
<html lang="en">
<head>
<meta charset="utf-8" />
<hst:headContributions categoryExcludes="scripts" xhtml="true" />
<!--[if lt IE 9]>
        <hst:link var="html4shiv" path="/js/html5shiv.js"/>
        <script type="text/javascript" src="${html4shiv}"></script>
    <![endif]-->
<hst:link var="link" path="/dist/css/bootstrap.css" />
<link rel="stylesheet" href="${link}" type="text/css" />

<!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
<!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->

<hst:link var="emwlink" path="/assets/js/ie-emulation-modes-warning.js" />
<script src="${emwlink}"></script>

<!-- Custom styles for this template -->
<hst:link var="link2" path="/css/motrice_style.css" />
<link rel="stylesheet" href="${link2}" type="text/css" />

<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta name="description" content="">
<meta name="author" content="">

<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
      <script src="../../assets/js/html5shiv.js"></script>
      <script src="../../assets/js/respond.min.js"></script>
    <![endif]-->

	<!-- google analytics -->
		<script>
           (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  			(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new
			Date();a=s.createElement(o),
			m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
			})(window,document,'script','//www.google-analytics.com/analytics.js','ga');

	  		ga('create', 'UA-27121379-2', 'auto');
	  		ga('send', 'pageview');
		</script>
</head>
<body>
	<hst:include ref="header" />
	<hst:include ref="main" />
	<hst:headContributions categoryIncludes="scripts" xhtml="true" />
	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
	<!-- <script src="/site/dist/js/bootstrap.min.js"></script> -->
        <hst:link var="bootstrap_min" path="/dist/js/bootstrap.min.js"/>
        <script type="text/javascript" src="${bootstrap_min}"></script>

	<!-- <script src="/site/assets/js/docs.min.js"></script> -->
        <hst:link var="docs_min" path="/assets/js/docs.min.js"/>
        <script type="text/javascript" src="${docs_min}"></script>

	<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
	<!-- <script src="/site/assets/js/ie10-viewport-bug-workaround.js"></script> -->
        <hst:link var="ie10_vp_bug_wa" path="/assets/js/ie10-viewport-bug-workaround.js"/>
        <script type="text/javascript" src="${ie10_vp_bug_wa}"></script>
</body>
</html>
