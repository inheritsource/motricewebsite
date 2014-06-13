
package se.motrice.hippo.beans;

import org.hippoecm.hst.content.beans.Node;
import org.hippoecm.hst.content.beans.standard.HippoGalleryImageSet;
import org.hippoecm.hst.content.beans.standard.HippoHtml;

@Node(jcrType="motricewebsite:textimagedocument")
public class TextImageDocument extends TextDocument{
    
    public HippoGalleryImageSet getImage() {
        return getLinkedBean("motricewebsite:image", HippoGalleryImageSet.class);
    }
    
    public HippoGalleryImageSet getIcon() {
        return getLinkedBean("motricewebsite:icon", HippoGalleryImageSet.class);
    }
    
}
