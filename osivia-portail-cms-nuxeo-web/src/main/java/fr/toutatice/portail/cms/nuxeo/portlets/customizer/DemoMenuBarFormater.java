package fr.toutatice.portail.cms.nuxeo.portlets.customizer;

import java.util.List;

import javax.portlet.PortletContext;

import org.nuxeo.ecm.automation.client.jaxrs.model.Document;

import fr.toutatice.portail.api.menubar.MenubarItem;
import fr.toutatice.portail.cms.nuxeo.portlets.customizer.helpers.MenuBarFormater;

/**
 * Customization de la barre de menu des portlets Pour démonstration, on renomme
 * l'item permalink
 * 
 * @author jeanseb
 * 
 */
public class DemoMenuBarFormater extends MenuBarFormater {

	public DemoMenuBarFormater(PortletContext portletCtx, DefaultCMSCustomizer customizer,
			fr.toutatice.portail.cms.nuxeo.portlets.service.CMSService cmsService) {
		super(portletCtx, customizer, cmsService);

	}

	@Override
	protected void addPermaLinkItem(List<MenubarItem> menuBar, String url) throws Exception {
		MenubarItem item = new MenubarItem("Permalink", MenubarItem.ORDER_PORTLET_SPECIFIC_CMS, url, null,
				"portlet-menuitem-permalink", null);
		item.setAjaxDisabled(true);
		menuBar.add(item);

	}

	protected void addAdministrationLinkItem(List<MenubarItem> menuBar, Document doc, String url) throws Exception {

		MenubarItem item = new MenubarItem("Modifier dans Nuxeo", MenubarItem.ORDER_PORTLET_SPECIFIC_CMS + 2, url,
				null, "portlet-menuitem-nuxeo-edit", "nuxeo");
		item.setAjaxDisabled(true);
		menuBar.add(item);
	}
}
