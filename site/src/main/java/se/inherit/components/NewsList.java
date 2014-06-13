
package se.inherit.components;

import java.util.ArrayList;
import java.util.List;

import se.inherit.componentsinfo.PageableListInfo;

import org.hippoecm.hst.component.support.bean.BaseHstComponent;
import org.hippoecm.hst.content.beans.query.HstQuery;
import org.hippoecm.hst.content.beans.query.HstQueryResult;
import org.hippoecm.hst.content.beans.query.exceptions.QueryException;
import org.hippoecm.hst.content.beans.standard.HippoBean;
import org.hippoecm.hst.core.component.HstComponentException;
import org.hippoecm.hst.core.component.HstRequest;
import org.hippoecm.hst.core.component.HstResponse;
import org.hippoecm.hst.core.parameters.ParametersInfo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


@ParametersInfo(type = PageableListInfo.class)
public class NewsList extends BaseHstComponent {

    public static final Logger log = LoggerFactory.getLogger(NewsList.class);

    @Override
    public void doBeforeRender(final HstRequest request, final HstResponse response) throws HstComponentException {
    	PageableListInfo info = getParametersInfo(request);
    	
    	HippoBean scope = getSiteContentBaseBean(request).getBean("news");
    	int pageSize = 3;
    	int crPage = 1;
    	String sortBy = "motricewebsite:date";
    	String sortOrder = "descending";
    	String docType = "motricewebsite:newsdocument";
    	String query = null;

        Class<? extends HippoBean> filterClass = getObjectConverter().getAnnotatedClassFor(docType);
        if(filterClass == null) {
            throw new HstComponentException("There is no bean for docType '"+docType+"'. Cannot use '"+docType+"' as in this search");
        }

        try {
            HstQuery hstQuery = getQueryManager(request).createQuery(scope, filterClass, true);
            hstQuery.setLimit(pageSize);
            hstQuery.setOffset(pageSize * (crPage - 1));
            if(sortBy != null && !"".equals(sortBy)) {
                if(sortOrder == null || "".equals(sortOrder) || "descending".equals(sortOrder)) {
                    hstQuery.addOrderByDescending(sortBy);
                } else {
                    hstQuery.addOrderByAscending(sortBy);
                }
            }
            
/* Dead code, query init to null and not changed before this line...
            if(query != null && !"".equals(query)) {
                Filter f = hstQuery.createFilter();
                f.addContains(".", query);
                hstQuery.setFilter(f);
            }
*/
            HstQueryResult result = hstQuery.execute();

            request.setAttribute("result", result);
            request.setAttribute("info", info);
            request.setAttribute("crPage", crPage);
            request.setAttribute("query", query);


            if(info instanceof PageableListInfo && ((PageableListInfo)info).isPagesVisible()) {
                request.setAttribute("totalSize", result.getTotalSize());
                // add pages
                if(result.getTotalSize() > pageSize) {
                    List<Integer> pages = new ArrayList<Integer>();
                    int numberOfPages = result.getTotalSize() / pageSize ;
                    if(result.getTotalSize() % pageSize != 0) {
                        numberOfPages++;
                    }
                    for(int i = 0; i < numberOfPages; i++) {
                        pages.add(i + 1);
                    }
                    request.setAttribute("pages", pages);
                }
            }


        } catch (QueryException e) {
            throw new HstComponentException("Exception occured during creation or execution of HstQuery. ", e);
        }
    }
}
