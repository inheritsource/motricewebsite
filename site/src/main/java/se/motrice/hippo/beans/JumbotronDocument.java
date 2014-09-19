
package se.motrice.hippo.beans;

import org.hippoecm.hst.content.beans.Node;
import org.hippoecm.hst.content.beans.standard.HippoHtml;

@Node(jcrType="motricewebsite:jumbotrondocument")
public class JumbotronDocument extends TextImageDocument{

	public HippoHtml getJumboContent(){
        return getHippoHtml("motricewebsite:jumbotxt");
    }
}
