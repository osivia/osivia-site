package fr.toutatice.portail.cms.nuxeo.portlets.customizer;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.portlet.PortletContext;

import org.nuxeo.ecm.automation.client.model.Document;
import org.nuxeo.ecm.automation.client.model.Documents;
import org.osivia.portal.core.cms.CMSException;
import org.osivia.portal.core.cms.CMSHandlerProperties;
import org.osivia.portal.core.cms.CMSServiceCtx;

import fr.toutatice.portail.cms.nuxeo.api.NuxeoQueryFilter;
import fr.toutatice.portail.cms.nuxeo.api.services.NuxeoConnectionProperties;
import fr.toutatice.portail.cms.nuxeo.portlets.customizer.helpers.MenuBarFormater;
import fr.toutatice.portail.cms.nuxeo.portlets.customizer.helpers.NavigationItemAdapter;
import fr.toutatice.portail.cms.nuxeo.portlets.list.DocumentQueryCommand;


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
    public static final String ENCADRE_REFERENCE = "encadre_reference";
    public static final String VISUEL_NIVEAU2 = "visuel_niveau2";
    public static final String UNE_NIVEAU2 = "une_niveau2";
    public static final String UNE_TITRE_NIVEAU3_1C = "une_titre_niveau3_1c";
    public static final String UNE_NIVEAU3_1C = "une_niveau3_1c";
    public static final String VISUEL_NIVEAU3 = "visuel_niveau3";

    public static final String BLOG_SCHEMAS = "dublincore,common, toutatice, note";
    public static final String ANNONCE_SCHEMAS = "dublincore,common, toutatice, note, annonce";

    public static String TEMPLATE_DOWNLOAD = "download";

    /** Permalink URL identifier. */
    public static final String IDENT_PERMALINK_URL = "/purl/";



    public CMSCustomizer(PortletContext ctx) {
        super(ctx);

    }

    @Override
    public NavigationItemAdapter getNavigationItemAdapter()	{
        if( this.navigationItemAdapter == null){
            this.navigationItemAdapter = new CustomNavigationItemAdapter(this.portletCtx, this, this.getCMSService());
        }

        return this.navigationItemAdapter;
    }

    public static List<ListTemplate> getListTemplates() {

        List<ListTemplate> templates = DefaultCMSCustomizer.getListTemplates();

        templates.add(new ListTemplate(ACTUALITE, "Actualité", ANNONCE_SCHEMAS));
        templates.add(new ListTemplate(ENCADRE, "Encadré", ANNONCE_SCHEMAS));
        templates.add(new ListTemplate(ENCADRE_NIVEAU2, "Encadré niveau 2", DEFAULT_SCHEMAS));
        templates.add(new ListTemplate(ENCADRE_REFERENCE, "Encadré références", ANNONCE_SCHEMAS));
        templates.add(new ListTemplate(VISUEL_NIVEAU2, "Visuel niveau 2", DEFAULT_SCHEMAS));
        templates.add(new ListTemplate(UNE_NIVEAU2, "Une niveau 2", BLOG_SCHEMAS));
        templates.add(new ListTemplate(UNE_NIVEAU3_1C, "Une niveau 3 - 1 colonne", BLOG_SCHEMAS));
        templates.add(new ListTemplate(UNE_TITRE_NIVEAU3_1C, "Une Titre niveau 3 - 1 colonne", BLOG_SCHEMAS));
        templates.add(new ListTemplate(VISUEL_NIVEAU3, "Visuel niveau 3", DEFAULT_SCHEMAS));

        return templates;
    }


    public static String getSearchSchema() {

        return "dublincore,common, toutatice, wcm_navigation, wcm_content";

    }


    @Override
    public String getNuxeoNativeViewerUrl(CMSServiceCtx ctx) {

        String url = null;

        Document doc = (Document) ctx.getDoc();

        if ("PictureBook".equals(doc.getType())) {
            this.getNuxeoConnectionProps();
            url = NuxeoConnectionProperties.getPublicBaseUri().toString() + "/nxdoc/default/" + doc.getId()
                    + "/view_documents?tabId=tab_slideshow";

        }

        if ("Forum".equals(doc.getType())) {
            url = this.getDefaultExternalViewer(ctx);

        }

        return url;

    }

    @Override
    public MenuBarFormater getMenuBarFormater() {
        if (this.menuBarFormater == null) {
            this.menuBarFormater = new DemoMenuBarFormater(this.portletCtx, this, this.getCMSService());
        }

        return this.menuBarFormater;
    }

    @Override
    public CMSHandlerProperties getCMSDefaultPlayer(CMSServiceCtx ctx) throws Exception {

        Document doc = (Document) ctx.getDoc();

        Map<String, String> windowProperties = new HashMap<String, String>();

        windowProperties.put("osivia.cms.scope", ctx.getScope());

        windowProperties.put("osivia.hideTitle", "1");

        windowProperties.put("osivia.cms.displayLiveVersion", ctx.getDisplayLiveVersion());
        windowProperties.put("osivia.cms.hideMetaDatas", ctx.getHideMetaDatas());
        windowProperties.put("osivia.cms.uri", doc.getPath());
        windowProperties.put("osivia.cms.publishPathAlreadyConverted", "1");
        windowProperties.put("osivia.hideDecorators", "1");
        windowProperties.put("theme.dyna.partial_refresh_enabled", "false");

        CMSHandlerProperties linkProps = new CMSHandlerProperties();
        linkProps.setWindowProperties(windowProperties);
        linkProps.setPortletInstance("toutatice-portail-cms-nuxeo-viewDocumentPortletInstance");

        return linkProps;
    }

    @Override
    public Map<String, String> parseCMSURL(CMSServiceCtx cmsCtx, String requestPath, Map<String, String> requestParameters) throws Exception {
        Map<String, String> cmsCommandProperties = new HashMap<String, String>();

        if (requestPath.startsWith(IDENT_PERMALINK_URL)) {
            // URL de la forme: /purl/url
            String[] ident = requestPath.split("/");

            String clause = " ecm:primaryType = 'WikiSection' and webc:url = '" + ident[2] + "'";
            String filteredClause = NuxeoQueryFilter.addPublicationFilter(clause, false);

            String savedScope = cmsCtx.getScope();
            cmsCtx.setScope("superuser_context");
            try {
                Documents documents = (Documents) this.getCMSService().executeNuxeoCommand(cmsCtx, new DocumentQueryCommand(filteredClause));

                if (documents.size() != 1) {
                    throw new CMSException(CMSException.ERROR_NOTFOUND);
                } else {
                    cmsCommandProperties.put("cmsPath", documents.get(0).getPath());
                }
            } finally {
                cmsCtx.setScope(savedScope);
            }
        } else {
            cmsCommandProperties = super.parseCMSURL(cmsCtx, requestPath, requestParameters);
        }

        return cmsCommandProperties;
    }


    @Override
    public CMSHandlerProperties getCMSPlayer(CMSServiceCtx ctx) throws Exception {

        Document doc = (Document) ctx.getDoc();

        if ("WikiBook".equals(doc.getType()) || "WikiSection".equals(doc.getType())) {
            return this.getWikiPlayer(ctx);
        }


        return super.getCMSPlayer(ctx);

    }


    public CMSHandlerProperties getWikiPlayer(CMSServiceCtx ctx) throws Exception {
        Document doc = (Document) ctx.getDoc();

        Map<String, String> windowProperties = new HashMap<String, String>();
        windowProperties.put("osivia.cms.uri", doc.getPath());
        windowProperties.put("osivia.hideDecorators", "1");
        windowProperties.put("osivia.ajaxLink", "1");

        CMSHandlerProperties linkProps = new CMSHandlerProperties();
        linkProps.setWindowProperties(windowProperties);
        linkProps.setPortletInstance("osivia-services-wiki-wikiPortletInstance");

        return linkProps;

    }

}
