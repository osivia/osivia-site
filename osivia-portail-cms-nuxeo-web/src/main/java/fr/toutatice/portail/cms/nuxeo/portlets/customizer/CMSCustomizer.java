package fr.toutatice.portail.cms.nuxeo.portlets.customizer;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.portlet.PortletContext;

import org.nuxeo.ecm.automation.client.jaxrs.model.Document;

import fr.toutatice.portail.cms.nuxeo.portlets.customizer.helpers.MenuBarFormater;
import fr.toutatice.portail.core.cms.CMSHandlerProperties;
import fr.toutatice.portail.core.cms.CMSServiceCtx;
import fr.toutatice.portail.cms.nuxeo.portlets.customizer.DemoMenuBarFormater;

/**
 * Ce customizer permet de définir :
 * 
 * de nouveaux templates de listes le schéma du moteur de recherche la
 * visualisation des contenus via les 3 méthodes suivantes
 * getPortletDelegatedLink (appelé depuis la couche portlet quand la
 * visualisation est à traiter par une ressource du portlet) getCmsPlayer
 * (appelé depuis la couche CMS dans les autres cas) getExternalViewer (appelée
 * à partir des 2 précédentes)
 * 
 * 
 * Le template d'affichage est WEB-INF/jsp/liste/view-[nom-du-template].jsp
 * 
 * @author jeanseb
 * 
 */
public class CMSCustomizer extends DefaultCMSCustomizer {
	
	public static final String ACTUALITE = "actualite";	
	public static final String ENCADRE = "encadre";

	public static final String ENCADRE_NIVEAU2 = "encadre_niveau2";
	public static final String VISUEL_NIVEAU2 = "visuel_niveau2";
	public static final String UNE_NIVEAU2 = "une_niveau2";
	public static final String UNE_TITRE_NIVEAU3_1C = "une_titre_niveau3_1c";
	public static final String UNE_NIVEAU3_1C = "une_niveau3_1c";
	public static final String VISUEL_NIVEAU3 = "visuel_niveau3";
	
	public static final String BLOG_SCHEMAS = "dublincore,common, toutatice, note";
	public static final String ANNONCE_SCHEMAS = "dublincore,common, toutatice, note, annonce";

	public static String TEMPLATE_DOWNLOAD = "download";	
	
	public CMSCustomizer(PortletContext ctx) {
		super(ctx);

	}

	public static List<ListTemplate> getListTemplates() {

		List<ListTemplate> templates = DefaultCMSCustomizer.getListTemplates();

		templates.add(new ListTemplate(ACTUALITE, "Actualité", ANNONCE_SCHEMAS));
		templates.add(new ListTemplate(ENCADRE, "Encadré", ANNONCE_SCHEMAS));
		templates.add(new ListTemplate(ENCADRE_NIVEAU2, "Encadré niveau 2", DEFAULT_SCHEMAS));
		templates.add(new ListTemplate(VISUEL_NIVEAU2, "Visuel niveau 2", BLOG_SCHEMAS));
		templates.add(new ListTemplate(UNE_NIVEAU2, "Une niveau 2", BLOG_SCHEMAS));
		templates.add(new ListTemplate(UNE_NIVEAU3_1C, "Une niveau 3 - 1 colonne", BLOG_SCHEMAS));
		templates.add(new ListTemplate(UNE_TITRE_NIVEAU3_1C, "Une Titre niveau 3 - 1 colonne", BLOG_SCHEMAS));
		templates.add(new ListTemplate(VISUEL_NIVEAU3, "Visuel niveau 3", BLOG_SCHEMAS));

		return templates;
	}

	public static String getSearchSchema() {

		return "dublincore,common, toutatice";

	}

	public CMSHandlerProperties getCMSFaqPlayer(CMSServiceCtx ctx) throws Exception {

		Document doc = (Document) ctx.getDoc();

		Map<String, String> windowProperties = new HashMap<String, String>();

		windowProperties.put("pia.cms.scope", ctx.getScope());
		windowProperties.put("pia.cms.uri", doc.getPath());
		windowProperties.put("pia.hideDecorators", "1");
		windowProperties.put("theme.dyna.partial_refresh_enabled", "false");

		CMSHandlerProperties linkProps = new CMSHandlerProperties();
		linkProps.setWindowProperties(windowProperties);
		linkProps.setPortletInstance("toutatice-faq-portletInstance");

		return linkProps;

	}

	/*
	 * On détermine le player associé à chaque item
	 */

	public CMSHandlerProperties getCMSPlayer(CMSServiceCtx ctx) throws Exception {

		Document doc = (Document) ctx.getDoc();

		if ("FaqFolder".equals(doc.getType()) || "Question".equals(doc.getType()))
			return getCMSFaqPlayer(ctx);

			
		return super.getCMSPlayer(ctx);

	}
	
	
	public String getNuxeoNativeViewerUrl(CMSServiceCtx ctx) {

		String url = null;

		Document doc = (Document) ctx.getDoc();

		if ("PictureBook".equals(doc.getType())) {
			url = getNuxeoConnectionProps().getPublicBaseUri().toString() + "/nxdoc/default/" + doc.getId()
					+ "/view_documents?tabId=tab_slideshow";

		}
		
		if ("Forum".equals(doc.getType())) {
			url = getDefaultExternalViewer(ctx);

		}
		

		return url;

	}




	public MenuBarFormater getMenuBarFormater() {
		if (menuBarFormater == null) {
			menuBarFormater = new DemoMenuBarFormater(portletCtx, this, getCMSService());
		}

		return menuBarFormater;
	}

	
	public CMSHandlerProperties getCMSDefaultPlayer(CMSServiceCtx ctx) throws Exception {

		Document doc = (Document) ctx.getDoc();

		Map<String, String> windowProperties = new HashMap<String, String>();

		windowProperties.put("pia.cms.scope", ctx.getScope());
		
		windowProperties.put("pia.hideTitle", "1");
		

		windowProperties.put("pia.cms.displayLiveVersion", ctx.getDisplayLiveVersion());
		windowProperties.put("pia.cms.hideMetaDatas", ctx.getHideMetaDatas());
		windowProperties.put("pia.cms.uri", doc.getPath());
		windowProperties.put("pia.cms.publishPathAlreadyConverted", "1");
		windowProperties.put("pia.hideDecorators", "1");
		windowProperties.put("theme.dyna.partial_refresh_enabled", "false");

		CMSHandlerProperties linkProps = new CMSHandlerProperties();
		linkProps.setWindowProperties(windowProperties);
		linkProps.setPortletInstance("toutatice-portail-cms-nuxeo-viewDocumentPortletInstance");

		return linkProps;
	}

}