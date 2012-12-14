package fr.toutatice.portail.cms.nuxeo.portlets.customizer;

import java.util.Map;

import javax.portlet.PortletContext;

import org.nuxeo.ecm.automation.client.jaxrs.model.Document;

import fr.toutatice.portail.cms.nuxeo.portlets.customizer.DefaultCMSCustomizer;
import fr.toutatice.portail.cms.nuxeo.portlets.customizer.helpers.NavigationItemAdaptor;
import fr.toutatice.portail.cms.nuxeo.portlets.service.CMSService;
import fr.toutatice.portail.core.cms.CMSItem;

public class CustomNavigationItemAdaptor extends NavigationItemAdaptor {
	
	public CustomNavigationItemAdaptor(PortletContext portletCtx, DefaultCMSCustomizer customizer, CMSService cmsService) {
		super(portletCtx,  customizer,  cmsService);
	};
	
	
	
	/**
	 * Définition d'un template par défaut (uniquement pour les publishSite)
	 * 
	 * @param doc
	 * @return
	 */
	
	protected String getDefaultPageTemplate(Document doc)	{
		
		return  "/default/templates/BLOG_TMPL1";
		
	}
	
	
	/**
	 * Cet element doit-il être géré dans la navigation
	 * 
	 * @param doc
	 * @return
	 */
	
	protected boolean isNavigable(Document doc)	{
		
		if ( (doc.getType().equals("SimplePage")) || (doc.getType().equals("SimpleSite")))
			return true;
		
		return super.isNavigable(doc);
	}
	
	
	/**
	 * Cet element doit-il être affiché dans une page (ou par défaut via un player spécifique)
	 * 
	 * @param doc
	 * @return
	 */
	protected boolean isDisplayedAsAPage(Document doc)	{
		
		if  (doc.getType().equals("SimplePage"))
			return true;
		
		return super.isDisplayedAsAPage(doc);
	}
	
	

}
