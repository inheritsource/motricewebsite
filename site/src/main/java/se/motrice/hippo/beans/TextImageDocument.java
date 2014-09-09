
package se.motrice.hippo.beans;

import org.hippoecm.hst.content.beans.Node;
import org.hippoecm.hst.content.beans.standard.HippoGalleryImageSet;

@Node(jcrType="motricewebsite:textimagedocument")
public class TextImageDocument extends TextDocument{
    
    public HippoGalleryImageSet getImage() {
        return getLinkedBean("motricewebsite:image", HippoGalleryImageSet.class);
    }
    
    public HippoGalleryImageSet getIcon() {
        return getLinkedBean("motricewebsite:icon", HippoGalleryImageSet.class);
    }
    
    public String getImageCaption() {
        return getProperty("motricewebsite:imagecaption");
    }
    
    public long getSeqNumber() {
        return getProperty("motricewebsite:seqnumber");
    }

    public String getButtonTxt() {
        return getProperty("motricewebsite:buttontxt");
    }

    public String getButtonRef() {
        return getProperty("motricewebsite:buttonref");
    }

}
