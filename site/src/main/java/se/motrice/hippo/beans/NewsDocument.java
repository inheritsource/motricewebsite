package se.motrice.hippo.beans;

import java.util.Calendar;

import org.hippoecm.hst.content.beans.Node;
import org.hippoecm.hst.content.beans.standard.HippoHtml;
import org.hippoecm.hst.content.beans.standard.HippoGalleryImageSetBean;

@Node(jcrType="motricewebsite:newsdocument")
public class NewsDocument extends BaseDocument{

    public String getTitle() {
        return getProperty("motricewebsite:title");
    }
    
    public String getSummary() {
        return getProperty("motricewebsite:summary");
    }
    
    public Calendar getDate() {
        return getProperty("motricewebsite:date");
    }

    public HippoHtml getHtml(){
        return getHippoHtml("motricewebsite:body");    
    }

    /**
     * Get the imageset of the newspage
     *
     * @return the imageset of the newspage
     */
    public HippoGalleryImageSetBean getImage() {
        return getLinkedBean("motricewebsite:image", HippoGalleryImageSetBean.class);
    }


}
