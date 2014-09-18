package se.motrice.hippo.components;

import org.hippoecm.hst.content.beans.query.HstQuery;
import org.hippoecm.hst.content.beans.query.HstQueryManager;
import org.hippoecm.hst.content.beans.query.HstQueryResult;
import org.hippoecm.hst.content.beans.standard.HippoBean;
import org.hippoecm.hst.core.component.HstComponentException;
import org.hippoecm.hst.core.component.HstRequest;
import org.hippoecm.hst.core.component.HstResponse;
import org.hippoecm.hst.core.request.HstRequestContext;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import se.motrice.hippo.beans.TextImageDocument;

public class HomeHead extends BaseComponent {

    public static final Logger log = LoggerFactory.getLogger(HomeHead.class);

    @Override
    public void doBeforeRender(final HstRequest request, final HstResponse response) throws HstComponentException {

        //HippoBean doc = request.getRequestContext().getContentBean();
    	HstRequestContext ctx = request.getRequestContext();
        HstQueryManager hstQueryManager = ctx.getQueryManager();
        HippoBean scope = getBeanForResolvedSiteMapItem(request,ctx.getResolvedSiteMapItem());
        HstQueryResult result=null;

        try {
//        	HstQuery hstQuery = hstQueryManager.createQuery(scope,
//        			TextDocument.class, true);
        	HstQuery hstQuery = hstQueryManager.
        	  createQuery((HippoBean) scope.getBean("chead"),TextImageDocument.class,true);
        	hstQuery.addOrderByAscending("motricewebsite:seqnumber");
        	result = hstQuery.execute();
        }
        catch (Exception e) {
        	log.error("Query execution failed. Path info: {}", ctx.getResolvedSiteMapItem().getPathInfo());
        }
/*
        if (doc == null) {
            log.info("Did not find a content bean for relative content path '{}' for pathInfo '{}'",
                         request.getRequestContext().getResolvedSiteMapItem().getRelativeContentPath(),
                         request.getRequestContext().getResolvedSiteMapItem().getPathInfo());
            response.setStatus(404);
            return;
        }
        */
        request.setAttribute("result",result);
    }
}
