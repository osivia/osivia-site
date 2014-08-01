package fr.toutatice.portail.cms.nuxeo.portlets.customizer;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.portlet.PortletContext;

import org.nuxeo.ecm.automation.client.model.Document;
import org.nuxeo.ecm.automation.client.model.Documents;
import org.nuxeo.ecm.automation.client.model.PropertyList;
import org.osivia.portal.api.Constants;
import org.osivia.portal.core.cms.CMSException;
import org.osivia.portal.core.cms.CMSHandlerProperties;
import org.osivia.portal.core.cms.CMSItemType;
import org.osivia.portal.core.cms.CMSPublicationInfos;
import org.osivia.portal.core.cms.CMSServiceCtx;

import fr.toutatice.portail.cms.nuxeo.api.NuxeoQueryFilter;
import fr.toutatice.portail.cms.nuxeo.api.NuxeoQueryFilterContext;
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
    /** "blog" schemas. */
    public static final String SCHEMAS_BLOG = "dublincore, common, toutatice, webpage";
    /** "blog" list template. */
    public static final String STYLE_BLOG = "blog";
    /** "slider" schemas. */
    public static final String SCHEMAS_SLIDER = "dublincore, common, toutatice, annonce, note";
    /** "slider" list template. */
    public static final String STYLE_SLIDER = "slider";
    /** "forum" schemas. */
    public static final String SCHEMAS_FORUM = "dublincore, common, toutatice";
    /** "forum" list template. */
    public static final String STYLE_FORUM = "forum";
    /** "tuile" schemas. */
    public static final String SCHEMAS_TUILE = "dublincore, toutatice, zoom";
    /** "tuile" list template. */
    public static final String STYLE_TUILE = "tuile";

    /** Permalink URL identifier. */
    public static final String IDENT_PERMALINK_URL = "/purl/";


    private static final String STYLE_ROADMAP = "roadmap";
    private static final String STYLE_DISTRIB = "distrib";
    private static final String SCHEMAS_DISTRIB = "dublincore, toutatice, roadmapdistrib";


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
        templates.add(new ListTemplate(STYLE_BLOG, "Blog", SCHEMAS_BLOG));
        templates.add(new ListTemplate(STYLE_FORUM, "Forum", SCHEMAS_FORUM));
        templates.add(new ListTemplate(STYLE_SLIDER, "Carrousel", SCHEMAS_SLIDER));
        templates.add(new ListTemplate(STYLE_TUILE, "Tuile [visuel, description]", SCHEMAS_TUILE));

        // =========== roadmap =============
        templates.add(new ListTemplate(STYLE_ROADMAP, "Roadmap", SCHEMAS_DISTRIB));
        templates.add(new ListTemplate(STYLE_DISTRIB, "Distribution de la roadmap", SCHEMAS_DISTRIB));

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

        // if ("Forum".equals(doc.getType())) {
        // url = this.getDefaultExternalViewer(ctx);
        // }

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
        windowProperties.put("osivia.cms.hideMetaDatas", "0");
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

            String clause = " (ecm:primaryType = 'WikiBook' or ecm:primaryType = 'WikiSection') and webc:url = '" + ident[2] + "'";
            String filteredClause = NuxeoQueryFilter.addPublicationFilter(NuxeoQueryFilterContext.CONTEXT_DEFAULT, clause);

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
        
        if ("FaqFolder".equals(doc.getType()) || "Question".equals(doc.getType())) {
            return this.getFaqPlayer(ctx);
        }

        if ("BlogPost".equals(doc.getType())) {
            return this.getCMSMinimalPlayer(ctx);
        }

        if ("Forum".equals(doc.getType())) {
            return this.getForumPlayer(ctx);
        }

        if ("Thread".equals(doc.getType())) {
            return this.getForumThreadPlayer(ctx);
        }

        // =========== roadmap =============
        if ("Product".equals(doc.getType())) {
            return this.getRoadmapPlayer(ctx);
        }
        if ("Distribution".equals(doc.getType())) {
            return this.getDistributionPlayer(ctx);
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
     * @param ctx CMS service context
     * @return Wiki player
     */
    private CMSHandlerProperties getWikiPlayer(CMSServiceCtx ctx) {
        Document doc = (Document) ctx.getDoc();

        Map<String, String> windowProperties = new HashMap<String, String>();
        windowProperties.put(Constants.WINDOW_PROP_URI, doc.getPath());
        windowProperties.put("osivia.hideDecorators", "1");
        windowProperties.put("osivia.ajaxLink", "1");

        CMSHandlerProperties linkProps = new CMSHandlerProperties();
        linkProps.setWindowProperties(windowProperties);
        linkProps.setPortletInstance("osivia-services-wiki-wikiPortletInstance");

        return linkProps;
    }


    /**
     * Get FAQ player.
     * 
     * @param ctx CMS service context
     * @return FAQ player
     */
    private CMSHandlerProperties getFaqPlayer(CMSServiceCtx ctx) {
        Document doc = (Document) ctx.getDoc();

        Map<String, String> windowProperties = new HashMap<String, String>();
        windowProperties.put(Constants.WINDOW_PROP_URI, doc.getPath());
        windowProperties.put("osivia.ajaxLink", "1");
        windowProperties.put("osivia.hideDecorators", "1");
        windowProperties.put(Constants.WINDOW_PROP_VERSION, ctx.getDisplayLiveVersion());

        CMSHandlerProperties linkProps = new CMSHandlerProperties();
        linkProps.setWindowProperties(windowProperties);
        linkProps.setPortletInstance("toutatice-faq-portletInstance");

        return linkProps;
    }


    /**
     * Get forum player.
     * 
     * @param ctx CMS context
     * @return CMS forum player
     * @throws CMSException
     */
    private CMSHandlerProperties getForumPlayer(CMSServiceCtx ctx) throws CMSException {
        Map<String, String> windowProperties = new HashMap<String, String>();
        windowProperties.put("osivia.nuxeoRequest", this.createForumPlayerRequest(ctx));
        windowProperties.put("osivia.cms.style", CMSCustomizer.STYLE_FORUM);
        windowProperties.put("osivia.hideDecorators", "1");
        windowProperties.put("theme.dyna.partial_refresh_enabled", "false");
        windowProperties.put(Constants.WINDOW_PROP_SCOPE, ctx.getScope());
        windowProperties.put("osivia.ajaxLink", "1");
        windowProperties.put(Constants.WINDOW_PROP_VERSION, ctx.getDisplayLiveVersion());

        CMSHandlerProperties linkProps = new CMSHandlerProperties();
        linkProps.setWindowProperties(windowProperties);
        linkProps.setPortletInstance("toutatice-portail-cms-nuxeo-viewListPortletInstance");

        return linkProps;
    }

    /**
     * Utility method used to create forum player request.
     * 
     * @param cmsContext CMS context
     * @return request
     * @throws CMSException
     */
    private String createForumPlayerRequest(CMSServiceCtx cmsContext) throws CMSException {
        // Document
        Document document = (Document) cmsContext.getDoc();
        // Publication infos
        CMSPublicationInfos pubInfos = this.getCmsService().getPublicationInfos(cmsContext, document.getPath());

        StringBuilder request = new StringBuilder();
        request.append("ecm:parentId = '").append(pubInfos.getLiveId()).append("' ");
        request.append("AND ecm:primaryType = 'Thread' ");
        request.append("ORDER BY dc:modified DESC ");
        return request.toString();
    }


    /**
     * Get forum thread player.
     * 
     * @param cmsContext CMS context
     * @return forum thread player
     */
    private CMSHandlerProperties getForumThreadPlayer(CMSServiceCtx cmsContext) {
        Document document = (Document) cmsContext.getDoc();

        Map<String, String> windowProperties = new HashMap<String, String>();
        windowProperties.put(Constants.WINDOW_PROP_URI, document.getPath());
        windowProperties.put("osivia.hideDecorators", "1");
        windowProperties.put("osivia.ajaxLink", "1");

        CMSHandlerProperties linkProps = new CMSHandlerProperties();
        linkProps.setWindowProperties(windowProperties);
        linkProps.setPortletInstance("osivia-services-forum-portletInstance");

        return linkProps;
    }


    /**
     * Get minimal player.
     * 
     * @param ctx CMS service context
     * @return minimal player
     */
    private CMSHandlerProperties getCMSMinimalPlayer(CMSServiceCtx ctx) {
        Document doc = (Document) ctx.getDoc();

        Map<String, String> windowProperties = new HashMap<String, String>();
        windowProperties.put(Constants.WINDOW_PROP_SCOPE, ctx.getScope());
        windowProperties.put(Constants.WINDOW_PROP_URI, doc.getPath());
        windowProperties.put("osivia.hideTitle", "1");
        windowProperties.put("osivia.ajaxLink", "1");
        windowProperties.put("osivia.cms.hideMetaDatas", "1");
        windowProperties.put(Constants.WINDOW_PROP_VERSION, ctx.getDisplayLiveVersion());

        CMSHandlerProperties linkProps = new CMSHandlerProperties();
        linkProps.setWindowProperties(windowProperties);
        linkProps.setPortletInstance("toutatice-portail-cms-nuxeo-viewDocumentPortletInstance");

        return linkProps;
    }


    /**
     * Get roadmap player.
     * 
     * @param ctx CMS context
     * @return CMS forum player
     * @throws CMSException
     */
    private CMSHandlerProperties getRoadmapPlayer(CMSServiceCtx ctx) throws CMSException {
        Map<String, String> windowProperties = new HashMap<String, String>();
        windowProperties.put("osivia.nuxeoRequest", this.createRoadmapPlayerRequest(ctx));
        // windowProperties.put("osivia.displayNuxeoRequest", "1");
        // windowProperties.put("osivia.hideTitle", "1");
        windowProperties.put("osivia.title", "Roadmap");
        windowProperties.put("osivia.cms.style", CMSCustomizer.STYLE_ROADMAP);
        windowProperties.put("osivia.hideDecorators", "1");
        windowProperties.put("theme.dyna.partial_refresh_enabled", "false");
        windowProperties.put(Constants.WINDOW_PROP_SCOPE, ctx.getScope());
        windowProperties.put("osivia.ajaxLink", "1");
        windowProperties.put(Constants.WINDOW_PROP_VERSION, ctx.getDisplayLiveVersion());

        CMSHandlerProperties linkProps = new CMSHandlerProperties();
        linkProps.setWindowProperties(windowProperties);
        linkProps.setPortletInstance("toutatice-portail-cms-nuxeo-viewListPortletInstance");

        return linkProps;
    }

    /**
     * Utility method used to create roadmap player request.
     * 
     * @param cmsContext CMS context
     * @return request
     * @throws CMSException
     */
    private String createRoadmapPlayerRequest(CMSServiceCtx cmsContext) throws CMSException {
        // Document
        Document document = (Document) cmsContext.getDoc();
        // Publication infos
        CMSPublicationInfos pubInfos = this.getCmsService().getPublicationInfos(cmsContext, document.getPath());

        StringBuilder request = new StringBuilder();
        // request.append("ecm:uuid = '").append(document.getId()).append("' ");
        request.append("ecm:parentId = '").append(pubInfos.getLiveId()).append("' ");
        // request.append("AND ecm:primaryType = 'Thread' ");
        request.append("ORDER BY rmpd:releaseDate DESC ");
        return request.toString();
    }

    /**
     * Get distribution player.
     * 
     * @param ctx CMS context
     * @return CMS forum player
     * @throws CMSException
     */
    private CMSHandlerProperties getDistributionPlayer(CMSServiceCtx ctx) throws CMSException {
        Document document = (Document) ctx.getDoc();

        Map<String, String> windowProperties = new HashMap<String, String>();
        windowProperties.put("osivia.nuxeoRequest", this.createDistributionPlayerRequest(ctx));
        // windowProperties.put("osivia.displayNuxeoRequest", "1");
        windowProperties.put("osivia.hideTitle", "1");
        windowProperties.put("osivia.title", document.getTitle());
        windowProperties.put("osivia.cms.style", CMSCustomizer.STYLE_DISTRIB);
        windowProperties.put("osivia.hideDecorators", "1");
        windowProperties.put("theme.dyna.partial_refresh_enabled", "false");
        windowProperties.put(Constants.WINDOW_PROP_SCOPE, ctx.getScope());
        windowProperties.put("osivia.ajaxLink", "1");
        windowProperties.put(Constants.WINDOW_PROP_VERSION, ctx.getDisplayLiveVersion());

        CMSHandlerProperties linkProps = new CMSHandlerProperties();
        linkProps.setWindowProperties(windowProperties);
        linkProps.setPortletInstance("toutatice-portail-cms-nuxeo-viewListPortletInstance");

        return linkProps;
    }

    /**
     * Utility method used to create roadmap player request.
     * 
     * @param cmsContext CMS context
     * @return request
     * @throws CMSException
     */
    private String createDistributionPlayerRequest(CMSServiceCtx cmsContext) throws CMSException {
        // Document
        Document document = (Document) cmsContext.getDoc();

        // Publication infos
        CMSPublicationInfos pubInfos = this.getCmsService().getPublicationInfos(cmsContext, document.getPath());

        StringBuilder request = new StringBuilder();
        request.append("ecm:uuid = '").append(document.getId()).append("' ");
        // request.append("ecm:parentId = '").append(pubInfos.getLiveId()).append("' ");
        // request.append("AND ecm:primaryType = 'Thread' ");
        request.append("ORDER BY rmpd:releaseDate DESC ");
        return request.toString();
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public Map<String, CMSItemType> getCMSItemTypes() {
        Map<String, CMSItemType> cmsItemTypes = super.getCMSItemTypes();

        List<CMSItemType> customizedTypes = this.getCustomizedCMSItemTypes();
        for (CMSItemType customizedType : customizedTypes) {
            cmsItemTypes.put(customizedType.getName(), customizedType);
        }

        return cmsItemTypes;
    }


    /**
     * Get customized CMS item types.
     * 
     * @return customized CMS item types
     */
    private List<CMSItemType> getCustomizedCMSItemTypes() {
        List<CMSItemType> customizedTypes = new ArrayList<CMSItemType>();

        // FAQ folder
        customizedTypes.add(new CMSItemType("FaqFolder", true, false, false, false, true, Arrays.asList("Question"), null));
        // FAQ question
        customizedTypes.add(new CMSItemType("Question", false, false, false, false, true, new ArrayList<String>(0), null));
        // Blog site
        customizedTypes.add(new CMSItemType("BlogSite", true, false, false, true, true, Arrays.asList("BlogPost"), "/default/templates/blogSite"));
        // Blog post
        customizedTypes.add(new CMSItemType("BlogPost", false, false, false, true, true, new ArrayList<String>(0), null));
        // Wiki book
        customizedTypes.add(new CMSItemType("WikiBook", true, true, true, true, true, Arrays.asList("WikiSection"), null));
        // Blog post
        customizedTypes.add(new CMSItemType("WikiSection", true, true, true, true, true, Arrays.asList("WikiSection"), null));
        // Forum
        customizedTypes.add(new CMSItemType("Forum", true, true, false, true, true, Arrays.asList("Thread"), null));
        // Forum thread
        customizedTypes.add(new CMSItemType("Thread", false, false, false, true, true, new ArrayList<String>(0), null));

        // =========== roadmap =============
        // Project
        customizedTypes.add(new CMSItemType("Product", true, true, true, true, true, Arrays.asList("Distribution"), null));
        // Distribution
        customizedTypes.add(new CMSItemType("Distribution", false, true, true, true, true, new ArrayList<String>(0), null));
        
        
        return customizedTypes;
    }

}
