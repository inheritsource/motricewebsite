package se.motrice.hippo.beans;

import org.hippoecm.hst.content.beans.Node;
import org.hippoecm.hst.content.beans.standard.HippoDocument;

@Node(jcrType="motricewebsite:basedocument")
public class BaseDocument extends HippoDocument {
    
	public String getTitle() {
        return getProperty("motricewebsite:title");
    }
    
    public String getSummary() {
        return getProperty("motricewebsite:summary");
    }
    
}
