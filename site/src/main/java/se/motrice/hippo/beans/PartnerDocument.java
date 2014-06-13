
package se.motrice.hippo.beans;

import org.hippoecm.hst.content.beans.Node;
import org.hippoecm.hst.content.beans.standard.HippoGalleryImageSetBean;
import org.hippoecm.hst.content.beans.standard.HippoHtml;

@Node(jcrType="motricewebsite:partnerdocument")
public class PartnerDocument extends TextImageDocument {

	public String getUrl() {
    	return getProperty("motricewebsite:url");
    }
}
