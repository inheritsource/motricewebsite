package se.inherit.channels;

import org.hippoecm.hst.configuration.channel.ChannelInfo;
import org.hippoecm.hst.core.parameters.FieldGroup;
import org.hippoecm.hst.core.parameters.FieldGroupList;
import org.hippoecm.hst.core.parameters.JcrPath;
import org.hippoecm.hst.core.parameters.Parameter;

/**
 * Retrieves the properties of a website channel.
 */
@FieldGroupList({
        @FieldGroup(
                titleKey = "fields.website",
                value = { "headerName", "logo"}
        )
})
public interface WebsiteInfo extends ChannelInfo {

    @Parameter(name = "headerName", defaultValue = "HST Website")
    String getHeaderName();

    @Parameter(name = "logo", displayName = "Logo")
    @JcrPath(
            pickerSelectableNodeTypes = { "hippogallery:imageset" },
            pickerInitialPath = "/content/gallery/inheritwebsite/logos"
    )
    String getLogoPath();
}