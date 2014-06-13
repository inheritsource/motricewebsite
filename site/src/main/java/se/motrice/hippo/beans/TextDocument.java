package se.motrice.hippo.beans;

import org.hippoecm.hst.content.beans.Node;
import org.hippoecm.hst.content.beans.standard.HippoHtml;

@Node(jcrType="motricewebsite:textdocument")
public class TextDocument extends BaseDocument{
    
    public HippoHtml getHtml(){
        return getHippoHtml("motricewebsite:body");    
    }

}
