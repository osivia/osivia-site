package fr.toutatice.portail.cms.nuxeo.portlets.customizer;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.SortedMap;

import javax.portlet.PortletContext;

import org.nuxeo.ecm.automation.client.model.Document;
import org.nuxeo.ecm.automation.client.model.Documents;
import org.nuxeo.ecm.automation.client.model.PropertyList;
import org.osivia.portal.api.Constants;
import org.osivia.portal.api.internationalization.Bundle;
import org.osivia.portal.core.cms.CMSException;
import org.osivia.portal.core.cms.CMSHandlerProperties;
import org.osivia.portal.core.cms.CMSItemType;
import org.osivia.portal.core.cms.CMSPublicationInfos;
import org.osivia.portal.core.cms.CMSServiceCtx;
import org.osivia.portal.core.cms.ListTemplate;

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

    /** News list template. */
    private static final String STYLE_NEWS = "actualite";
    /** Frame list template. */
    private static final String STYLE_FRAME = "encadre";
    /** Reference list template. */
    private static final String STYLE_REFERENCE = "reference";
    /** Blog list template. */
    private static final String STYLE_BLOG = "blog";
    /** Slider list template. */
    private static final String STYLE_SLIDER = "slider";
    /** Forum list template. */
    private static final String STYLE_FORUM = "forum";
    /** Tile list template. */
    private static final String STYLE_TILE = "tuile";
    /** Footer links list template. */
    private static final String STYLE_FOOTER_LINKS = "footer-links";
    /** Shortcuts list template. */
    private static final String STYLE_SHORTCUTS = "shortcuts";
    /** Roadmap list template. */
    private static final String STYLE_ROADMAP = "roadmap";
    /** Roadmap distribution list template. */
    private static final String STYLE_DISTRIB = "distrib";

    /** Annonce schemas. */
    private static final String SCHEMAS_ANNONCE = "dublincore,common, toutatice, note, annonce";
    /** Search schemas. */
    private static final String SCHEMAS_SEARCH = "dublincore,common, toutatice, wcm_navigation, wcm_content";
    /** Blog schemas. */
    private static final String SCHEMAS_BLOG = "dublincore, common, toutatice, webpage";
    /** Forum schemas. */
    private static final String SCHEMAS_FORUM = "dublincore, common, toutatice";
    /** Zoom schemas. */
    private static final String SCHEMAS_ZOOM = "dublincore, common, toutatice, zoom";
    /** Roadmap schemas. */
    private static final String SCHEMAS_DISTRIB = "dublincore, toutatice, roadmapdistrib";


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
     * {@inheritDoc}
     */
    @Override
    public List<ListTemplate> getListTemplates(Locale locale) {
        List<ListTemplate> templates = super.getListTemplates(locale);

        // Bundle
        Bundle bundle = this.getBundleFactory().getBundle(locale);

        // News
        templates.add(new ListTemplate(STYLE_NEWS, bundle.getString("LIST_TEMPLATE_NEWS"), SCHEMAS_ANNONCE));
        // Frame
        templates.add(new ListTemplate(STYLE_FRAME, bundle.getString("LIST_TEMPLATE_FRAME"), SCHEMAS_ZOOM));
        // Reference
        templates.add(new ListTemplate(STYLE_REFERENCE, bundle.getString("LIST_TEMPLATE_REFERENCE"), SCHEMAS_ANNONCE));
        // Blog
        templates.add(new ListTemplate(STYLE_BLOG, bundle.getString("LIST_TEMPLATE_BLOG"), SCHEMAS_BLOG));
        // Forum
        templates.add(new ListTemplate(STYLE_FORUM, bundle.getString("LIST_TEMPLATE_FORUM"), SCHEMAS_FORUM));
        // Slider
        templates.add(new ListTemplate(STYLE_SLIDER, bundle.getString("LIST_TEMPLATE_SLIDER"), SCHEMAS_ANNONCE));
        // Tiles
        templates.add(new ListTemplate(STYLE_TILE, bundle.getString("LIST_TEMPLATE_TILES"), SCHEMAS_ZOOM));
        // Footer links
        templates.add(new ListTemplate(STYLE_FOOTER_LINKS, bundle.getString("LIST_TEMPLATE_FOOTER_LINKS"), SCHEMAS_ZOOM));
        // Shortcuts
        templates.add(new ListTemplate(STYLE_SHORTCUTS, bundle.getString("LIST_TEMPLATE_SHORCUTS"), SCHEMAS_ZOOM));

        // Roadmap
        templates.add(new ListTemplate(STYLE_ROADMAP, bundle.getString("LIST_TEMPLATE_ROADMAP"), SCHEMAS_DISTRIB));
        // Roadmap distribution
        templates.add(new ListTemplate(STYLE_DISTRIB, bundle.getString("LIST_TEMPLATE_ROADMAP_DISTRIBUTION"), SCHEMAS_DISTRIB));

        return templates;
    }


    /**
     * Get search schemas.
     *
     * @return search schemas
     */
    public static String getSearchSchema() {
        return SCHEMAS_SEARCH;
    }


    /**
     * {@inheritDoc}
     */
    @Override
    public SortedMap<String, String> getMenuTemplates(Locale locale) {
        SortedMap<String, String> templates = super.getMenuTemplates(locale);

        // Bundle
        Bundle bundle = this.getBundleFactory().getBundle(locale);

        // Template "commercial"
        templates.put("commercial", bundle.getString("MENU_TEMPLATE_COMMERCIAL"));

        return templates;
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

        // Wiki
        if ("WikiBook".equals(doc.getType()) || "WikiSection".equals(doc.getType())) {
            return this.getWikiPlayer(ctx);
        }

        // FAQ
        if ("FaqFolder".equals(doc.getType()) || "Question".equals(doc.getType())) {
            return this.getFaqPlayer(ctx);
        }

        // Blog
        if ("BlogPost".equals(doc.getType())) {
            return this.getCMSMinimalPlayer(ctx);
        }

        // Forum
        if ("Forum".equals(doc.getType())) {
            return this.getForumPlayer(ctx);
        }
        if ("Thread".equals(doc.getType())) {
            return this.getForumThreadPlayer(ctx);
        }

        // Roadmap
        if ("Product".equals(doc.getType())) {
            return this.getRoadmapPlayer(ctx);
        }
        if ("Distribution".equals(doc.getType())) {
            return this.getDistributionPlayer(ctx);
        }

        // Calendar
        if ("Agenda".equals(doc.getType())) {
            return this.getCalendarPlayer(ctx);
        }
        if ("VEVENT".equals(doc.getType())) {
            return this.getEventPlayer(ctx);
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
     * Get calendar player.
     *
     * @param ctx
     * @return calendar player
     */
    private CMSHandlerProperties getCalendarPlayer(CMSServiceCtx ctx) {
        Document doc = (Document) ctx.getDoc();

        Map<String, String> windowProperties = new HashMap<String, String>();
        windowProperties.put(Constants.WINDOW_PROP_URI, doc.getPath());
        windowProperties.put("osivia.title", doc.getTitle());
        windowProperties.put("osivia.hideTitle", "1");
        windowProperties.put("osivia.ajaxLink", "0");
        windowProperties.put("osivia.cms.hideMetaDatas", "1");
        windowProperties.put("osivia.calendar.cmsPath", "${contentPath}");

        CMSHandlerProperties linkProps = new CMSHandlerProperties();
        linkProps.setWindowProperties(windowProperties);
        linkProps.setPortletInstance("osivia-services-calendar-instance");

        return linkProps;
    }


    /**
     * Get the event player.
     *
     * @param ctx
     * @return Event player
     */
    private CMSHandlerProperties getEventPlayer(CMSServiceCtx ctx) {
        Document doc = (Document) ctx.getDoc();

        Map<String, String> windowProperties = new HashMap<String, String>();
        windowProperties.put(Constants.WINDOW_PROP_URI, doc.getPath());
        windowProperties.put("osivia.title", doc.getTitle());
        windowProperties.put("osivia.hideTitle", "1");
        windowProperties.put("osivia.ajaxLink", "0");
        windowProperties.put("osivia.cms.hideMetaDatas", "1");

        CMSHandlerProperties linkProps = new CMSHandlerProperties();
        linkProps.setWindowProperties(windowProperties);
        linkProps.setPortletInstance("osivia-services-calendar-event-instance");

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
        // CMSPublicationInfos pubInfos = this.getCmsService().getPublicationInfos(cmsContext, document.getPath());

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

        // === FAQ === //
        // FAQ folder
        customizedTypes.add(new CMSItemType("FaqFolder", true, false, false, false, true, Arrays.asList("Question"), null));
        // FAQ question
        customizedTypes.add(new CMSItemType("Question", false, false, false, false, true, new ArrayList<String>(0), null));

        // === BLOG === //
        // Blog site
        customizedTypes.add(new CMSItemType("BlogSite", true, false, false, true, true, Arrays.asList("BlogPost"), "/default/templates/blogSite"));
        // Blog post
        customizedTypes.add(new CMSItemType("BlogPost", false, false, false, true, true, new ArrayList<String>(0), null));

        // === WIKI === //
        // Wiki book
        customizedTypes.add(new CMSItemType("WikiBook", true, true, true, true, true, Arrays.asList("WikiSection"), null));
        // Wiki section
        customizedTypes.add(new CMSItemType("WikiSection", true, true, true, true, true, Arrays.asList("WikiSection"), null));

        // === FORUM === //
        // Forum
        customizedTypes.add(new CMSItemType("Forum", true, true, false, true, true, Arrays.asList("Thread"), null));
        // Forum thread
        customizedTypes.add(new CMSItemType("Thread", false, false, false, true, true, new ArrayList<String>(0), null));

        // === ROADMAP === //
        // Project
        customizedTypes.add(new CMSItemType("Product", true, true, true, true, true, Arrays.asList("Distribution"), null));
        // Distribution
        customizedTypes.add(new CMSItemType("Distribution", false, true, true, true, true, new ArrayList<String>(0), null));

        // === AGENDA === //
        // Agenda
        customizedTypes.add(new CMSItemType("Agenda", false, true, false, false, true, Arrays.asList("VEVENT"), null));
        // Events
        customizedTypes.add(new CMSItemType("VEVENT", false, false, false, false, true, new ArrayList<String>(0), null));

        return customizedTypes;
    }

}
