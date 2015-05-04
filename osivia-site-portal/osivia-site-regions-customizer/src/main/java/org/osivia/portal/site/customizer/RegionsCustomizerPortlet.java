package org.osivia.portal.site.customizer;

import java.util.Arrays;
import java.util.Map;

import javax.portlet.GenericPortlet;
import javax.portlet.PortletException;

import org.apache.commons.lang.StringUtils;
import org.osivia.portal.api.customization.CustomizationContext;
import org.osivia.portal.api.customization.CustomizationModuleMetadatas;
import org.osivia.portal.api.customization.ICustomizationModule;
import org.osivia.portal.api.customization.ICustomizationModulesRepository;
import org.osivia.portal.api.theming.IRenderedRegions;

/**
 * Technical portlet for regions customization.
 *
 * @author Cédric Krommenhoek
 * @see GenericPortlet
 * @see ICustomizationModule
 */
public class RegionsCustomizerPortlet extends GenericPortlet implements ICustomizationModule {

    /** "osivia-site-charte-commercial" context path init parameter name. */
    private static final String OSIVIA_SITE_CHARTE_COMMERCIAL_CONTEXT_PATH_INIT_PARAM = "osivia.site.customizer.regions.osivia-site-charte-commercial.context";
    /** "osivia-site-charte-community" context path init parameter name. */
    private static final String OSIVIA_SITE_CHARTE_COMMUNITY_CONTEXT_PATH_INIT_PARAM = "osivia.site.customizer.regions.osivia-site-charte-community.context";
    /** Customizer name. */
    private static final String CUSTOMIZER_NAME = "osivia.site.customizer.regions.name";
    /** Customization modules repository attribute name. */
    private static final String ATTRIBUTE_CUSTOMIZATION_MODULES_REPOSITORY = "CustomizationModulesRepository";

    /** Customization modules repository. */
    private ICustomizationModulesRepository repository;
    /** Internationalization customization module metadatas. */
    private final CustomizationModuleMetadatas metadatas;


    /**
     * Constructor.
     */
    public RegionsCustomizerPortlet() {
        super();
        this.metadatas = this.generateMetadatas();
    }


    /**
     * Utility method used to generate attributes bundles customization module metadatas.
     *
     * @return metadatas
     */
    private CustomizationModuleMetadatas generateMetadatas() {
        CustomizationModuleMetadatas metadatas = new CustomizationModuleMetadatas();
        metadatas.setName(CUSTOMIZER_NAME);
        metadatas.setModule(this);
        metadatas.setCustomizationIDs(Arrays.asList(IRenderedRegions.CUSTOMIZER_ID));
        return metadatas;
    }


    /**
     * {@inheritDoc}
     */
    @Override
    public void init() throws PortletException {
        super.init();
        this.repository = (ICustomizationModulesRepository) this.getPortletContext().getAttribute(ATTRIBUTE_CUSTOMIZATION_MODULES_REPOSITORY);
        this.repository.register(this.metadatas);
    }


    /**
     * {@inheritDoc}
     */
    @Override
    public void destroy() {
        super.destroy();
        this.repository.unregister(this.metadatas);
    }


    /**
     * {@inheritDoc}
     */
    public void customize(String customizationID, CustomizationContext context) {
        String charteCommercialContextPath = this.getInitParameter(OSIVIA_SITE_CHARTE_COMMERCIAL_CONTEXT_PATH_INIT_PARAM);
        String charteCommunityContextPath = this.getInitParameter(OSIVIA_SITE_CHARTE_COMMUNITY_CONTEXT_PATH_INIT_PARAM);

        Map<String, Object> attributes = context.getAttributes();
        String contextPath = (String) attributes.get(IRenderedRegions.CUSTOMIZER_ATTRIBUTE_THEME_CONTEXT_PATH);
        if (StringUtils.equals(contextPath, charteCommercialContextPath) || StringUtils.equals(contextPath, charteCommunityContextPath)) {
            IRenderedRegions renderedRegion = (IRenderedRegions) attributes.get(IRenderedRegions.CUSTOMIZER_ATTRIBUTE_RENDERED_REGIONS);

            if (StringUtils.equals(contextPath, charteCommercialContextPath)) {
                // Remove default back
                renderedRegion.removeRenderedRegion("back");
                // Remove default breadcrumb
                renderedRegion.removeRenderedRegion("breadcrumb");
                // Customize toolbar (obsolete with portal version 4.1.0)
                renderedRegion.customizeRenderedRegion("toolbar", "/regions/web-toolbar.jsp");
                // Customize drawer toolbar (obsolete with portal version 4.1.0)
                renderedRegion.customizeRenderedRegion("drawer-toolbar", "/regions/drawer-toolbar.jsp");
                // Add title
                renderedRegion.customizeRenderedRegion("title", "/regions/title.jsp");
            }
            
            if (StringUtils.equals(contextPath, charteCommunityContextPath)) {
                // Replace default toolbar
                renderedRegion.customizeRenderedRegion("toolbar", "/regions/toolbar.jsp");
                // Add logo
                renderedRegion.customizeRenderedRegion("logo", "/regions/logo.jsp");
                // Replace tabs
                renderedRegion.customizeRenderedRegion("tabs", "/header/tabs.jsp");
                // Remove footer
                renderedRegion.removeRenderedRegion("footer");
            }
        }
    }

}
