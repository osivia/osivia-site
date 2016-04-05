package org.osivia.site.customizer.regions;

import java.util.Arrays;
import java.util.Map;

import javax.portlet.GenericPortlet;
import javax.portlet.PortletException;

import org.osivia.portal.api.customization.CustomizationContext;
import org.osivia.portal.api.customization.CustomizationModuleMetadatas;
import org.osivia.portal.api.customization.ICustomizationModule;
import org.osivia.portal.api.customization.ICustomizationModulesRepository;
import org.osivia.portal.api.theming.IRenderedRegions;


public class RegionsCustomizer extends GenericPortlet implements ICustomizationModule {

    /** Customizer name. */
    private static final String CUSTOMIZER_NAME = "osivia.site.customizer.regions";
    /** Customization modules repository attribute name. */
    private static final String ATTRIBUTE_CUSTOMIZATION_MODULES_REPOSITORY = "CustomizationModulesRepository";

    /** Charte "Commercial" context path. */
    private static final String CHARTE_COMMERCIAL_CONTEXT_PATH = "/osivia-site-charte-commercial";
    /** Charte "Community" context path. */
    private static final String CHARTE_COMMUNITY_CONTEXT_PATH = "/osivia-site-charte-community";


    /** Customization module metadatas. */
    private final CustomizationModuleMetadatas metadatas;


    /** Customization modules repository. */
    private ICustomizationModulesRepository repository;


    /**
     * Constructor.
     */
    public RegionsCustomizer() {
        super();
        this.metadatas = this.generateMetadatas();
    }


    /**
     * Generate customization module metadatas.
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
    @Override
    public void customize(String customizationId, CustomizationContext context) {
        Map<String, Object> attributes = context.getAttributes();
        IRenderedRegions renderedRegion = (IRenderedRegions) attributes.get(IRenderedRegions.CUSTOMIZER_ATTRIBUTE_RENDERED_REGIONS);

        // Context path
        String contextPath = (String) attributes.get(IRenderedRegions.CUSTOMIZER_ATTRIBUTE_THEME_CONTEXT_PATH);

        if (CHARTE_COMMERCIAL_CONTEXT_PATH.equals(contextPath)) {
            // Charte "Commercial"

        } else if (CHARTE_COMMUNITY_CONTEXT_PATH.equals(contextPath)) {
            // Charte "Community"

            renderedRegion.customizeRenderedRegion("tabs", "/regions/tabs.jsp");
        }

    }


}
