package com.osivia.portail.site.portlets.utils;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;

import javax.portlet.PortletException;
import javax.portlet.ResourceResponse;

import org.jboss.portal.core.cms.ui.CMSPortlet;

public class ResourceHelper {
	
	private ResourceHelper(){
		
	}	
	
	public static  ResourceResponse writeOutputImage(CMSPortlet portlet, String imagePathAndName, ResourceResponse resourceResponse) throws PortletException{
		try{
			
			String filename = portlet.getPortletContext().getRealPath(imagePathAndName);
			String mimeType = portlet.getPortletContext().getMimeType(filename);
	
			/* Set content size */
			File file = new File(filename);
	
			/* Les headers doivent être positionnées avant la réponse */
			resourceResponse.setContentType(mimeType);	
			// Marche seulement avec version Enterprise
			resourceResponse.setContentLength((int) file.length());
	
			/* Open the file and output streams */
			FileInputStream in = new FileInputStream(file);
			OutputStream out = resourceResponse.getPortletOutputStream();
	
			/* Copy the contents of the file to the output stream */
			byte[] buf = new byte[1024];
			int count = 0;
			while ((count = in.read(buf)) >= 0) {
				out.write(buf, 0, count);
			}
			in.close();
			out.close();
			
			return resourceResponse;
			
		} catch (Exception e) {
			throw new PortletException(e);

		}
	}

}
