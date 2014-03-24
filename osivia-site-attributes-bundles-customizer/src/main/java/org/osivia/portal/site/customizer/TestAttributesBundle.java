package org.osivia.portal.site.customizer;

import java.util.Map;
import java.util.Set;
import java.util.TreeSet;

import org.jboss.portal.core.controller.ControllerException;
import org.jboss.portal.core.model.portal.command.render.RenderPageCommand;
import org.jboss.portal.core.theme.PageRendition;
import org.osivia.portal.api.theming.IAttributesBundle;

/**
 * Test attributes bundle.
 *
 * @author Cédric Krommenhoek
 * @see IAttributesBundle
 */
public class TestAttributesBundle implements IAttributesBundle {

    /** Test attribute name. */
    private static final String TEST_ATTRIBUTE_NAME = "osivia.site.customizer.test";
    /** Test attribute value. */
    private static final String TEST_ATTRIBUTE_VALUE = "[Test value]";

    /** Singleton instance. */
    private static TestAttributesBundle instance;

    /** Attribute names. */
    private final Set<String> names;


    /**
     * Private constructor.
     */
    private TestAttributesBundle() {
        super();

        this.names = new TreeSet<String>();
        this.names.add(TEST_ATTRIBUTE_NAME);
    }


    /**
     * Singleton instance access.
     *
     * @return singleton instance
     */
    public static TestAttributesBundle getInstance() {
        if (instance == null) {
            instance = new TestAttributesBundle();
        }
        return instance;
    }


    /**
     * {@inheritDoc}
     */
    public void fill(RenderPageCommand renderPageCommand, PageRendition pageRendition, Map<String, Object> attributes) throws ControllerException {
        attributes.put(TEST_ATTRIBUTE_NAME, TEST_ATTRIBUTE_VALUE);
    }


    /**
     * {@inheritDoc}
     */
    public Set<String> getAttributeNames() {
        return this.names;
    }

}
