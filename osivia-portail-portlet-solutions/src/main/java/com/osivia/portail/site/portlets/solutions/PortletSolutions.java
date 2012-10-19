package com.osivia.portail.site.portlets.solutions;

import java.io.IOException;

import javax.portlet.ActionRequest;
import javax.portlet.ActionResponse;
import javax.portlet.PortletConfig;
import javax.portlet.PortletException;
import javax.portlet.PortletMode;
import javax.portlet.PortletRequestDispatcher;
import javax.portlet.RenderMode;
import javax.portlet.RenderRequest;
import javax.portlet.RenderResponse;
import javax.portlet.WindowState;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.nuxeo.ecm.automation.client.jaxrs.model.Documents;

import com.osivia.portail.site.portlets.utils.IConstantes;

import fr.toutatice.portail.api.urls.IPortalUrlFactory;
import fr.toutatice.portail.api.windows.PortalWindow;
import fr.toutatice.portail.api.windows.WindowFactory;
import fr.toutatice.portail.cms.nuxeo.api.NuxeoController;
import fr.toutatice.portail.cms.nuxeo.api.NuxeoException;
import fr.toutatice.portail.cms.nuxeo.core.CMSPortlet;
import fr.toutatice.portail.cms.nuxeo.core.PortletErrorHandler;

public class PortletSolutions extends CMSPortlet {
	
	protected static final Log logger = LogFactory.getLog(PortletSolutions.class);

	private IPortalUrlFactory portalUrlFactory;
	
	@Override
	public void init(PortletConfig config) throws PortletException {
		super.init(config);
		
		portalUrlFactory = (IPortalUrlFactory) getPortletContext().getAttribute("UrlService");
		if (portalUrlFactory == null) {
			throw new PortletException("Cannot start PortletSolutions due to service unavailability");
		}
	}
	
	@Override
	protected void doView(RenderRequest request, RenderResponse response) throws PortletException, IOException {
		try {
			response.setContentType(IConstantes.HTML_TEXT_TYPE);
			
			NuxeoController nuxeoCtrl = new NuxeoController(request, response, getPortletContext());
		
			PortalWindow window = WindowFactory.getWindow(request);
			String solutionSPath = window.getProperty(ISolutionsConstantes.PATH_PROP);

			if (solutionSPath != null) {

				Documents docs = (Documents) nuxeoCtrl.executeNuxeoCommand(new ListeSolutionsCommand(solutionSPath)); 
				
				request.setAttribute("docs", docs);
				request.setAttribute("nuxeoCtrl", nuxeoCtrl);

				PortletRequestDispatcher dispatcher = getPortletContext().getRequestDispatcher(ISolutionsConstantes.VIEW_JSP);
				dispatcher.include(request, response);				
				
			} else {
				response.setContentType(IConstantes.HTML_TEXT_TYPE);
				response.getWriter().print("<h2>Document non défini</h2>");
				response.getWriter().close();
				return;
			}

		} catch( NuxeoException e){
			PortletErrorHandler.handleGenericErrors(response, e);
		}
		catch (Exception e) {
			if( ! (e instanceof PortletException))
				throw new PortletException(e);
		}

	}
	
	@RenderMode(name = IConstantes.ADMIN_USER)
	public void doAdmin(RenderRequest req, RenderResponse res) throws IOException, PortletException {

		res.setContentType(IConstantes.HTML_TEXT_TYPE);
		PortletRequestDispatcher rd = null;

		PortalWindow window = WindowFactory.getWindow(req);
		String path = window.getProperty(ISolutionsConstantes.PATH_PROP);

		if (path == null)
			path = "";

		req.setAttribute(ISolutionsConstantes.PARAM_PATH, path);

		rd = getPortletContext().getRequestDispatcher(ISolutionsConstantes.ADMIN_JSP);
		rd.include(req, res);

	}
	
	public void processAction(ActionRequest req, ActionResponse res) throws IOException, PortletException {


		if (IConstantes.ADMIN_USER.equals(req.getPortletMode().toString()) && req.getParameter(ISolutionsConstantes.PARAM_MODIF_PREFS) != null) {

			PortalWindow window = WindowFactory.getWindow(req);
			String path = req.getParameter(ISolutionsConstantes.PARAM_PATH);
			
			if( path != null && path.length() > 0)
				window.setProperty(ISolutionsConstantes.PATH_PROP, path);
			else
				window.setProperty(ISolutionsConstantes.PATH_PROP, null);

			res.setPortletMode(PortletMode.VIEW);
			res.setWindowState(WindowState.NORMAL);
		}

	
	}
	

	
	
	

}
