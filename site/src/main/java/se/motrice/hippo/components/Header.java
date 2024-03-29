package se.motrice.hippo.components;

import se.motrice.hippo.channels.WebsiteInfo;
import org.hippoecm.hst.configuration.hosting.Mount;
import org.hippoecm.hst.core.component.HstComponentException;
import org.hippoecm.hst.core.component.HstRequest;
import org.hippoecm.hst.core.component.HstResponse;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class Header extends LeftMenu {

    public static final Logger log = LoggerFactory.getLogger(Header.class);

    @Override
    public void doBeforeRender(final HstRequest request, final HstResponse response) throws HstComponentException {
	super.doBeforeRender(request, response);

	System.out.println("Component Header: menu=" + request.getAttribute("menu"));
        final Mount mount = request.getRequestContext().getResolvedMount().getMount();
        final WebsiteInfo info = mount.getChannelInfo();

        if (info != null) {
            request.setAttribute("headerName", info.getHeaderName());
        } else {
            log.info("No channel info available for website '{}'", mount.getMountPath());
        }
    }

}
