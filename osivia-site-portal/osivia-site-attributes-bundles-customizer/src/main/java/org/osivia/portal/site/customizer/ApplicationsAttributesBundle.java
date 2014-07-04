package org.osivia.portal.site.customizer;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeSet;

import org.jboss.portal.core.controller.ControllerException;
import org.jboss.portal.core.model.portal.command.render.RenderPageCommand;
import org.jboss.portal.core.theme.PageRendition;
import org.osivia.portal.api.theming.IAttributesBundle;

import fr.toutatice.portail.cms.nuxeo.api.services.NuxeoConnectionProperties;

/**
 * Bundle to set a list of apps to log out when portal sign out is called
 * 
 * @author LB
 * @see IAttributesBundle
 */
public class ApplicationsAttributesBundle implements IAttributesBundle {

    private static final String APP_ATTRIBUTE_NAME = "osivia.site.customizer.applications";

    private static final String NUXEO_LOGOUT = NuxeoConnectionProperties.getPublicBaseUri().toString().concat("/logout");

    private static final String CAS_LOGOUT = System.getProperty("cas.logout");

    /** Test attribute value. */
    private List<String> applications = new ArrayList<String>();

    /** Singleton instance. */
    private static ApplicationsAttributesBundle instance;

    /** Attribute names. */
    private final Set<String> names;


    /**
     * Private constructor.
     */
    private ApplicationsAttributesBundle() {
        super();

        applications.add(NUXEO_LOGOUT);
        applications.add(CAS_LOGOUT);

        this.names = new TreeSet<String>();
        this.names.add(APP_ATTRIBUTE_NAME);
    }


    /**
     * Singleton instance access.
     *
     * @return singleton instance
     */
    public static ApplicationsAttributesBundle getInstance() {
        if (instance == null) {
            instance = new ApplicationsAttributesBundle();
        }
        return instance;
    }


    /**
     * {@inheritDoc}
     */
    public void fill(RenderPageCommand renderPageCommand, PageRendition pageRendition, Map<String, Object> attributes) throws ControllerException {
        attributes.put(APP_ATTRIBUTE_NAME, applications);
    }


    /**
     * {@inheritDoc}
     */
    public Set<String> getAttributeNames() {
        return this.names;
    }

}
