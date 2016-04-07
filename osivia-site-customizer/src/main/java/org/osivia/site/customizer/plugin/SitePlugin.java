package org.osivia.site.customizer.plugin;

import java.util.Map;
import java.util.SortedMap;

import org.osivia.portal.api.customization.CustomizationContext;
import org.osivia.portal.api.internationalization.Bundle;
import org.osivia.portal.api.internationalization.IBundleFactory;
import org.osivia.portal.api.internationalization.IInternationalizationService;
import org.osivia.portal.api.locator.Locator;

import fr.toutatice.portail.cms.nuxeo.api.domain.AbstractPluginPortlet;
import fr.toutatice.portail.cms.nuxeo.api.domain.ListTemplate;

/**
 * Site plugin.
 * 
 * @author Cédric Krommenhoek
 * @see AbstractPluginPortlet
 */
public class SitePlugin extends AbstractPluginPortlet {

    /** Plugin name. */
    private static final String PLUGIN_NAME = "osivia.site.plugin";

    /** Annonce schemas. */
    private static final String ANNONCE_SCHEMAS = "dublincore, toutatice, note, annonce";
    /** Zoom list schemas. */
    private static final String ZOOM_SCHEMAS = "dublincore, toutatice, zoom";


    /** Internationalization bundle factory. */
    private final IBundleFactory bundleFactory;


    /**
     * Constructor.
     */
    public SitePlugin() {
        super();

        // Internationalization bundle factory
        IInternationalizationService internationalizationService = Locator.findMBean(IInternationalizationService.class,
                IInternationalizationService.MBEAN_NAME);
        this.bundleFactory = internationalizationService.getBundleFactory(this.getClass().getClassLoader());
    }


    /**
     * {@inheritDoc}
     */
    @Override
    protected String getPluginName() {
        return PLUGIN_NAME;
    }


    /**
     * {@inheritDoc}
     */
    @Override
    protected void customizeCMSProperties(String customizationID, CustomizationContext context) {
        // List templates
        this.customizeListTemplates(context);
        // Menu templates
        this.customizeMenuTemplates(context);
    }


    /**
     * Customize list templates.
     *
     * @param context customization context
     */
    private void customizeListTemplates(CustomizationContext context) {
        // Internationalization bundle
        Bundle bundle = this.bundleFactory.getBundle(context.getLocale());

        // List templates
        Map<String, ListTemplate> templates = this.getListTemplates(context);

        // News
        ListTemplate news = new ListTemplate("actualite", bundle.getString("LIST_TEMPLATE_NEWS"), ANNONCE_SCHEMAS);
        templates.put(news.getKey(), news);

        // Slider "Home"
        ListTemplate homeSlider = new ListTemplate("slider-home", bundle.getString("LIST_TEMPLATE_SLIDER_HOME"), ANNONCE_SCHEMAS);
        templates.put(homeSlider.getKey(), homeSlider);

        // Tiles
        ListTemplate tiles = new ListTemplate("tuile", bundle.getString("LIST_TEMPLATE_TILES"), ZOOM_SCHEMAS);
        templates.put(tiles.getKey(), tiles);
    }


    /**
     * Customize menu templates.
     * 
     * @param context customization context
     */
    private void customizeMenuTemplates(CustomizationContext context) {
        // Internationalization bundle
        Bundle bundle = this.bundleFactory.getBundle(context.getLocale());
        
        // Menu templates
        SortedMap<String, String> templates = this.getMenuTemplates(context);
        
        // "Commercial"
        templates.put("commercial", bundle.getString("MENU_TEMPLATE_COMMERCIAL"));
    }

}
