package fr.toutatice.portail.cms.nuxeo.portlets.customizer;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.portlet.PortletContext;

import org.nuxeo.ecm.automation.client.model.Document;
import org.nuxeo.ecm.automation.client.model.Documents;
import org.nuxeo.ecm.automation.client.model.PropertyList;
import org.osivia.portal.core.cms.CMSException;
import org.osivia.portal.core.cms.CMSHandlerProperties;
import org.osivia.portal.core.cms.CMSServiceCtx;

import fr.toutatice.portail.cms.nuxeo.api.NuxeoQueryFilter;
import fr.toutatice.portail.cms.nuxeo.api.services.NuxeoConnectionProperties;
import fr.toutatice.portail.cms.nuxeo.portlets.list.DocumentQueryCommand;


/**
 * CMS customizer du site OSIVIA.
 * 
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
 */
public class CMSCustomizer extends DefaultCMSCustomizer {

    /** Actualité. */
    public static final String ACTUALITE = "actualite";
    /** Encadré. */
    public static final String ENCADRE = "encadre";
    /** Encadré niveau 2. */
    public static final String ENCADRE_NIVEAU2 = "encadre_niveau2";
    /** Visuel niveau 2. */
    public static final String VISUEL_NIVEAU2 = "visuel_niveau2";
    /** Une niveau 2. */
    public static final String UNE_NIVEAU2 = "une_niveau2";
    /** Une titre niveau 3 avec une colonne. */
    public static final String UNE_TITRE_NIVEAU3_1C = "une_titre_niveau3_1c";
    /** Une niveau 3 avec une colonne. */
    public static final String UNE_NIVEAU3_1C = "une_niveau3_1c";
    /** Visuel niveau 3. */
    public static final String VISUEL_NIVEAU3 = "visuel_niveau3";
    /** Blog schemas. */
    public static final String BLOG_SCHEMAS = "dublincore,common, toutatice, note";
    /** Annonce schemas. */
    public static final String ANNONCE_SCHEMAS = "dublincore,common, toutatice, note, annonce";
    /** Search schemas. */
    public static final String SEARCH_SCHEMAS = "dublincore,common, toutatice, wcm_navigation, wcm_content";
    /** Template download. */
    public static final String TEMPLATE_DOWNLOAD = "download";

    /** Permalink URL identifier. */
    public static final String IDENT_PERMALINK_URL = "/purl/";


    /**
     * Constructor.
     * 
     * @param ctx portlet context
     */
    public CMSCustomizer(PortletContext ctx) {
        super(ctx);
    }


    /**
     * Get list templates.
     * 
     * @return list templates
     */
    public static List<ListTemplate> getListTemplates() {
        List<ListTemplate> templates = DefaultCMSCustomizer.getListTemplates();

        templates.add(new ListTemplate(ACTUALITE, "Actualité", ANNONCE_SCHEMAS));
        templates.add(new ListTemplate(ENCADRE, "Encadré", ANNONCE_SCHEMAS));
        templates.add(new ListTemplate(ENCADRE_NIVEAU2, "Encadré niveau 2", DEFAULT_SCHEMAS));
        templates.add(new ListTemplate(VISUEL_NIVEAU2, "Visuel niveau 2", DEFAULT_SCHEMAS));
        templates.add(new ListTemplate(UNE_NIVEAU2, "Une niveau 2", BLOG_SCHEMAS));
        templates.add(new ListTemplate(UNE_NIVEAU3_1C, "Une niveau 3 - 1 colonne", BLOG_SCHEMAS));
        templates.add(new ListTemplate(UNE_TITRE_NIVEAU3_1C, "Une Titre niveau 3 - 1 colonne", BLOG_SCHEMAS));
        templates.add(new ListTemplate(VISUEL_NIVEAU3, "Visuel niveau 3", DEFAULT_SCHEMAS));

        return templates;
    }


    /**
     * Get search schemas.
     * 
     * @return search schemas
     */
    public static String getSearchSchema() {
        return SEARCH_SCHEMAS;
    }


    /**
     * {@inheritDoc}
     */
    @Override
    public String getNuxeoNativeViewerUrl(CMSServiceCtx ctx) {
        String url = null;
        Document doc = (Document) ctx.getDoc();

        if ("PictureBook".equals(doc.getType())) {
            this.getNuxeoConnectionProps();
            url = NuxeoConnectionProperties.getPublicBaseUri().toString() + "/nxdoc/default/" + doc.getId() + "/view_documents?tabId=tab_slideshow";
        }

        if ("Forum".equals(doc.getType())) {
            url = this.getDefaultExternalViewer(ctx);
        }

        return url;
    }


    /**
     * {@inheritDoc}
     */
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


    /**
     * {@inheritDoc}
     */
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
                Documents documents = (Documents) this.getCmsService().executeNuxeoCommand(cmsCtx, new DocumentQueryCommand(filteredClause));

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


    /**
     * {@inheritDoc}
     */
    @Override
    public CMSHandlerProperties getCMSPlayer(CMSServiceCtx ctx) throws Exception {

        Document doc = (Document) ctx.getDoc();

        if ("WikiBook".equals(doc.getType()) || "WikiSection".equals(doc.getType())) {
            return this.getWikiPlayer(ctx);
        }
        
        /* DCH: correctif temporaire pour osivia-com */
        PropertyList subjMetatdata = doc.getProperties().getList("dc:subjects");
        if (subjMetatdata != null && !subjMetatdata.isEmpty()) {
            List<Object> tags = subjMetatdata.list();
            if (tags.contains("actualite")) {
                return this.getCMSDefaultPlayer(ctx);
            }
        }

        return super.getCMSPlayer(ctx);

    }


    /**
     * Get Wiki player.
     * 
     * @param ctx CMS context
     * @return Wiki player
     */
    public CMSHandlerProperties getWikiPlayer(CMSServiceCtx ctx) {
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
