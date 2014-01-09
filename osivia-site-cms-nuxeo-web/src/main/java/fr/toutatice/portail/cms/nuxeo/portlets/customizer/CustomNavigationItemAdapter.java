package fr.toutatice.portail.cms.nuxeo.portlets.customizer;

import javax.portlet.PortletContext;

import org.nuxeo.ecm.automation.client.model.Document;

import fr.toutatice.portail.cms.nuxeo.portlets.customizer.helpers.NavigationItemAdapter;
import fr.toutatice.portail.cms.nuxeo.portlets.service.CMSService;

public class CustomNavigationItemAdapter extends NavigationItemAdapter {

    public CustomNavigationItemAdapter(PortletContext portletCtx, DefaultCMSCustomizer customizer, CMSService cmsService) {
        super(portletCtx, customizer, cmsService);
    };


    /**
     * Cet element doit-il être géré dans la navigation
     *
     * @param doc
     * @return
     */

    @Override
    protected boolean isNavigable(Document doc) {

        if ((doc.getType().equals("SimplePage")) || (doc.getType().equals("SimpleSite")) || (doc.getType().equals("WikiBook"))
                || (doc.getType().equals("WikiSection"))) {
            return true;
        }

        return super.isNavigable(doc);
    }


    /**
     * Cet element doit-il être affiché dans une page (ou par défaut via un player spécifique)
     *
     * @param doc
     * @return
     */
    @Override
    protected boolean isDisplayedAsAPage(Document doc) {

        if (doc.getType().equals("SimplePage")) {
            return true;
        }

        return super.isDisplayedAsAPage(doc);
    }


}
