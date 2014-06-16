package se.inherit.components;

import se.inherit.channels.WebsiteInfo;
import org.hippoecm.hst.component.support.bean.BaseHstComponent;
import org.hippoecm.hst.configuration.hosting.Mount;
import org.hippoecm.hst.core.component.HstComponentException;
import org.hippoecm.hst.core.component.HstRequest;
import org.hippoecm.hst.core.component.HstResponse;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class Header extends Menu {

    public static final Logger log = LoggerFactory.getLogger(Header.class);

    @Override
    public void doBeforeRender(final HstRequest request, final HstResponse response) throws HstComponentException {
	super.doBeforeRender(request, response);
        final Mount mount = request.getRequestContext().getResolvedMount().getMount();
        final WebsiteInfo info = mount.getChannelInfo();

        if (info != null) {
            request.setAttribute("headerName", info.getHeaderName());
        } else {
            log.warn("No channel info available for website '{}'", mount.getMountPath());
        }
    }

}
