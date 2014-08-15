
package se.motrice.hippo.components;

import org.hippoecm.hst.component.support.bean.BaseHstComponent;
import org.hippoecm.hst.configuration.hosting.Mount;
import org.hippoecm.hst.content.beans.ObjectBeanManagerException;
import org.hippoecm.hst.content.beans.standard.HippoGalleryImageSet;
import org.hippoecm.hst.core.component.HstComponentException;
import org.hippoecm.hst.core.component.HstRequest;
import org.hippoecm.hst.core.component.HstResponse;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import se.motrice.hippo.channels.WebsiteInfo;

public class SiteInfo  extends BaseHstComponent{

	public static final Logger log = LoggerFactory.getLogger(SiteInfo.class);
	
    @Override
    public void doBeforeRender(final HstRequest request, final HstResponse response) throws HstComponentException {
       final Mount mount = request.getRequestContext().getResolvedMount().getMount();
       final WebsiteInfo info = mount.getChannelInfo();
       if (info == null) {
           log.warn("No channel info available for mount '{}'. No logo will be shown", mount.getMountPath());
           return;
       }

       final String logoPath = info.getLogoPath();
       try {
           Object logo = getObjectBeanManager(request).getObject(logoPath);
           if (logo instanceof HippoGalleryImageSet) {
               request.setAttribute("logo", logo);
           } else {
               log.warn("Mount '{}' has illegal logo path '{}' (not an image set). No logo will be shown.");
           }
       } catch (ObjectBeanManagerException e) {
           log.warn("Cannot retrieve logo at '" + logoPath + "'", e);
       }

    }

}
