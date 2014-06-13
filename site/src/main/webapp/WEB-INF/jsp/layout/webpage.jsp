<!doctype html>
<%@ include file="/WEB-INF/jspf/htmlTags.jspf" %>
<html lang="en">
  <head>
    <meta charset="utf-8"/>
    <hst:headContributions categoryExcludes="scripts" xhtml="true"/>
    <!--[if lt IE 9]>
        <hst:link var="html4shiv" path="/js/html5shiv.js"/>
        <script type="text/javascript" src="${html4shiv}"></script>
    <![endif]-->
    <hst:link var="link" path="/dist/css/bootstrap.css"/>
    <link rel="stylesheet" href="${link}" type="text/css"/>

     <!-- Custom styles for this template -->
    <link href="jumbotron-narrow.css" rel="stylesheet">

    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="../../assets/js/html5shiv.js"></script>
      <script src="../../assets/js/respond.min.js"></script>
    <![endif]-->
  </head>
  <body>
    <div class="container">
    <hst:include ref="header"/>
    <hst:include ref="main"/>
    <hst:headContributions categoryIncludes="scripts" xhtml="true"/>
    </div>
  </body>
</html>