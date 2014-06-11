package se.motrice.hippo.beans;

import org.hippoecm.hst.content.beans.Node;
import org.hippoecm.hst.content.beans.standard.HippoHtml;

@Node(jcrType="motricewebsite:textdocument")
public class TextDocument extends BaseDocument{
    
    public String getTitle() {
        return getProperty("motricewebsite:title");
    }

    public String getSummary() {
        return getProperty("motricewebsite:summary");
    }
    
    public HippoHtml getHtml(){
        return getHippoHtml("motricewebsite:body");    
    }

}
