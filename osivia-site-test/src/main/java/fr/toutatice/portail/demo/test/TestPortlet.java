package fr.toutatice.portail.demo.test;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;
import java.util.TimeZone;

import javax.portlet.ActionRequest;
import javax.portlet.ActionResponse;
import javax.portlet.GenericPortlet;
import javax.portlet.PortletConfig;
import javax.portlet.PortletException;
import javax.portlet.PortletMode;
import javax.portlet.PortletPreferences;
import javax.portlet.PortletRequestDispatcher;
import javax.portlet.PortletSession;
import javax.portlet.PortletURL;
import javax.portlet.RenderMode;
import javax.portlet.RenderRequest;
import javax.portlet.RenderResponse;
import javax.portlet.ResourceRequest;
import javax.portlet.ResourceResponse;
import javax.portlet.UnavailableException;
import javax.portlet.WindowState;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import fr.toutatice.portail.api.contexte.PortalControllerContext;
import fr.toutatice.portail.api.statut.IStatutService;
import fr.toutatice.portail.api.urls.IPortalUrlFactory;
import fr.toutatice.portail.api.windows.PortalWindow;
import fr.toutatice.portail.api.windows.WindowFactory;

public class TestPortlet extends GenericPortlet {

	protected static final Log logger = LogFactory.getLog(TestPortlet.class);

	private IPortalUrlFactory portalUrlFactory;

	public String formatResourceLastModified() {

		SimpleDateFormat inputFormater = new SimpleDateFormat("EEE, dd MMM yyyy HH:mm:ss z", Locale.ENGLISH);
		inputFormater.setTimeZone(TimeZone.getTimeZone("GMT"));
		String lastModified = inputFormater.format(new Date(System.currentTimeMillis()));
		;
		return lastModified;
	}

	public String formatResourceExpires(ResourceResponse resourceResponse) {

		SimpleDateFormat inputFormater = new SimpleDateFormat("EEE, dd MMM yyyy HH:mm:ss z", Locale.ENGLISH);
		inputFormater.setTimeZone(TimeZone.getTimeZone("GMT"));
		return inputFormater.format(new Date(System.currentTimeMillis()
				+ resourceResponse.getCacheControl().getExpirationTime() * 1000));
	}

	public boolean isResourceExpired(String sOriginalDate, ResourceResponse resourceResponse) {

		boolean isExpired = true;

		if (sOriginalDate != null) {

			SimpleDateFormat inputFormater = new SimpleDateFormat("EEE, dd MMM yyyy HH:mm:ss z", Locale.ENGLISH);
			inputFormater.setTimeZone(TimeZone.getTimeZone("GMT"));
			try {
				Date originalDate = inputFormater.parse(sOriginalDate);
				if (System.currentTimeMillis() < originalDate.getTime()
						+ resourceResponse.getCacheControl().getExpirationTime() * 1000)
					isExpired = false;
			} catch (Exception e) {

			}
		}

		return isExpired;
	}

	public boolean serveResourceByCache(ResourceRequest resourceRequest, ResourceResponse resourceResponse)
			throws PortletException, IOException {

		String sOriginalDate = resourceRequest.getProperty("if-modified-since");
		if (sOriginalDate == null)
			sOriginalDate = resourceRequest.getProperty("If-Modified-Since");

		if (!isResourceExpired(sOriginalDate, resourceResponse)) { // validation
																	// request

			// resourceResponse.setContentLength(0);
			resourceResponse.setProperty(ResourceResponse.HTTP_STATUS_CODE,
					String.valueOf(HttpServletResponse.SC_NOT_MODIFIED));
			resourceResponse.setProperty("Last-Modified", sOriginalDate);

			// au moins un caractère
			// resourceResponse.getPortletOutputStream().write(' ');
			resourceResponse.getPortletOutputStream().close();

			return true;
		}

		return false;
	}

	@Override
	public void init(PortletConfig config) throws PortletException {
		super.init(config);

		portalUrlFactory = (IPortalUrlFactory) getPortletContext().getAttribute("PortalUrlFactory");
		if (portalUrlFactory == null) {
			throw new PortletException("Cannot start TestPortlet due to service unavailability");
		}
	}

	public void serveResource(ResourceRequest resourceRequest, ResourceResponse resourceResponse)
			throws PortletException, IOException {

		try {

			if ("vignette".equals(resourceRequest.getParameter("type"))) {

				logger.debug("calcul vignette");

				Enumeration<String> props = resourceRequest.getPropertyNames();
				while (props.hasMoreElements()) {
					String name = props.nextElement();
					String value = resourceRequest.getProperty(name);
					logger.debug(name + ":" + value);
				}

				if (serveResourceByCache(resourceRequest, resourceResponse))
					return;

				String filename = getPortletContext().getRealPath("java.png");

				// Get the MIME type of the image
				String mimeType = getPortletContext().getMimeType(filename);

				// Set content size
				File file = new File(filename);

				// Les headers doivent être positionnées avant la réponse

				resourceResponse.setContentType(mimeType);

				// Marche seulement avec version ENterprise
				resourceResponse.setContentLength((int) file.length());

				// ce tag est indispensable pour IE7
				resourceResponse.setProperty("Cache-Control", "max-age="
						+ resourceResponse.getCacheControl().getExpirationTime());

				resourceResponse.setProperty("Last-Modified", formatResourceLastModified());
				// resourceResponse.setProperty("Expires",
				// formatResourceExpires(resourceResponse));

				// resourceResponse.setProperty("ETag", "W/\"" +
				// System.currentTimeMillis() + "\"");

				// Open the file and output streams
				FileInputStream in = new FileInputStream(file);
				OutputStream out = resourceResponse.getPortletOutputStream();

				// Copy the contents of the file to the output stream
				byte[] buf = new byte[1024];
				int count = 0;
				while ((count = in.read(buf)) >= 0) {
					out.write(buf, 0, count);
				}
				in.close();
				out.close();

				logger.debug("generation dynamique vignette");

			}

		} catch (Exception e) {
			throw new PortletException(e);

		}
	}

	public void processAction(ActionRequest req, ActionResponse res) throws IOException, PortletException {

		logger.debug("processAction ");

		if (req.getParameter("testAction") != null) {

			if (req.getParameter("exceptionAction") != null)
				throw new PortletException("exception de test");
			logger.debug("testAction ");

		}

		if ("admin".equals(req.getPortletMode().toString()) && req.getParameter("modifierPrefs") != null) {

			PortalWindow window = WindowFactory.getWindow(req);
			window.setProperty("pia.test.delai", req.getParameter("delai"));

			res.setPortletMode(PortletMode.VIEW);
			res.setWindowState(WindowState.NORMAL);
		}

		if ("admin".equals(req.getPortletMode().toString()) && req.getParameter("annuler") != null) {

			res.setPortletMode(PortletMode.VIEW);
			res.setWindowState(WindowState.NORMAL);
		}

		if ("edit".equals(req.getPortletMode().toString()) && req.getParameter("modifierPrefs") != null) {

			PortletPreferences prefs = req.getPreferences();

			prefs.setValue("perso", req.getParameter("perso"));
			prefs.store();

			res.setPortletMode(PortletMode.VIEW);
			res.setWindowState(WindowState.NORMAL);

		}

	}

	@RenderMode(name = "admin")
	public void doAdmin(RenderRequest req, RenderResponse res) throws IOException, PortletException {

		res.setContentType("text/html");
		PortletRequestDispatcher rd = null;

		PortalWindow window = WindowFactory.getWindow(req);
		String delai = window.getProperty("pia.test.delai");

		if (delai == null)
			delai = "";

		req.setAttribute("delai", delai);

		rd = getPortletContext().getRequestDispatcher("/WEB-INF/jsp/admin.jsp");
		rd.include(req, res);

	}

	public void doEdit(RenderRequest req, RenderResponse res) throws IOException, PortletException {

		res.setContentType("text/html");

		PortletPreferences prefs = req.getPreferences();

		req.setAttribute("perso", prefs.getValue("perso", ""));

		long begin = System.currentTimeMillis();

		PortletRequestDispatcher rd = null;
		rd = getPortletContext().getRequestDispatcher("/WEB-INF/jsp/edit.jsp");
		rd.include(req, res);

		long end4 = System.currentTimeMillis();
		long elapsedTime4 = end4 - begin;

		logger.debug("tes portlet. temps : " + elapsedTime4);
	}

	protected void doView(RenderRequest request, RenderResponse response) throws PortletException, IOException,
			UnavailableException {

		/* Test session */
		PortletSession session = request.getPortletSession();

		String userId = (String) session.getAttribute("userId");
		if (userId == null) {
			if (request.getUserPrincipal() != null) {
				userId = request.getUserPrincipal().getName();
				session.setAttribute("userId", userId);
			}
		}

		request.setAttribute("session.userId", userId);

		long begin = System.currentTimeMillis();

		try {

			response.setContentType("text/html");

			PortalWindow window = WindowFactory.getWindow(request);
			String delai = null;
			String sWindow = "";
			if (window != null) {
				delai = window.getProperty("pia.test.delai");
				sWindow = request.getWindowID();
			}

			if (delai == null || delai.length() == 0)
				delai = "300";

			if ("loop".equals(delai)) {
				long j = 0;

				while (true) {
					j++;
					if (j % 100000000L == 0) {
						logger.info("loop");
						break;
					}
				}

				request.setAttribute("delai", delai);
				request.getPortletSession().setAttribute("test", "test");
			}

			if (delai != null && delai.length() > 0) {
				try {
					Thread.sleep(Long.parseLong(delai));
				}
				/*
				 * catch(InterruptedException e){ // On test le comportement si
				 * on continue à ecrire dans la requete
				 * request.setAttribute("delai", delai); }
				 */finally {
					request.setAttribute("delai", delai);
				}
			}

			request.setAttribute("delai", delai);

			if (request.getParameter("erreurRender") != null) {
				throw new PortletException("Erreur render . Generated exception");
			}

			if (request.getParameter("NullPointer") != null) {
				String test = null;
				test.toString();
			}

			request.setAttribute("id-user", request.getRemoteUser());

			// Préférences utilisateur
			PortletPreferences prefs = request.getPreferences();
			String perso = prefs.getValue("perso", "Non défini");
			request.setAttribute("perso", perso);

			// Test render parameter
			String testParam = request.getParameter("test-param");
			if (testParam == null)
				testParam = "";
			request.setAttribute("test-param", testParam);

			if (sWindow.lastIndexOf("/") != -1)
				sWindow = sWindow.substring(sWindow.lastIndexOf("/"));

			String testString = sWindow + " user:" + request.getRemoteUser() + " status:" + request.getWindowState();
			request.setAttribute("test", testString);

			request.setAttribute("expiration", response.getCacheControl().getExpirationTime());

			request.setAttribute("jboss", request.getWindowID());

			long end4 = System.currentTimeMillis();
			long elapsedTime4 = end4 - begin;

			logger.debug("tes4 portlet. temps : " + elapsedTime4);

			/* Window creation */

			Map<String, String> windowProperties = new HashMap<String, String>();
			windowProperties.put("pia.test.delai", "99");

			Map<String, String> params = new HashMap<String, String>();
			params.put("test-param", "dynamic test");

			String urlPortletTest = portalUrlFactory.getExecutePortletLink(request,
					"toutatice-demo-test-portletInstance", windowProperties, params);
			request.setAttribute("TestPortletUrl", urlPortletTest);

			String completeName = "";

			Map<String, Object> userDatas = (Map<String, Object>) request.getAttribute("pia.userDatas");
			if (userDatas != null) {

				completeName = (String) userDatas.get("salutation");
				
			}
			
			request.setAttribute("completeName", completeName);
			
		

			getPortletContext().getRequestDispatcher("/WEB-INF/jsp/view.jsp").include(request, response);

			response.setTitle("Test " + System.currentTimeMillis());

		} catch (Exception e) {

			throw new PortletException(e);
		} finally {
			long end = System.currentTimeMillis();
			long elapsedTime = end - begin;

			logger.debug("test portlet. temps : " + elapsedTime);

		}

	}

}
