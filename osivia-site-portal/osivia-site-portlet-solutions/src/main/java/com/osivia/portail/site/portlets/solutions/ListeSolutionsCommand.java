package com.osivia.portail.site.portlets.solutions;

import org.nuxeo.ecm.automation.client.Constants;
import org.nuxeo.ecm.automation.client.OperationRequest;
import org.nuxeo.ecm.automation.client.Session;
import org.nuxeo.ecm.automation.client.model.Documents;

import fr.toutatice.portail.cms.nuxeo.api.INuxeoCommand;
import fr.toutatice.portail.cms.nuxeo.api.NuxeoQueryFilter;
import fr.toutatice.portail.cms.nuxeo.api.NuxeoQueryFilterContext;

public class ListeSolutionsCommand implements INuxeoCommand {

	String path;

	public ListeSolutionsCommand(String path) {
		super();
		this.path = path;
	}

	public Object execute(Session session) throws Exception {

		OperationRequest request;

		request = session.newRequest("Document.Query");


		String nuxeoRequest = "ecm:path STARTSWITH '" + this.path
		+ "' ORDER BY ecm:pos ";

		// Insertion du filtre sur les élements publiés
        String filteredRequest = NuxeoQueryFilter.addPublicationFilter(NuxeoQueryFilterContext.CONTEXT_DEFAULT, nuxeoRequest);

		request.set("query", "SELECT * FROM Document WHERE " + filteredRequest);

		request.setHeader(Constants.HEADER_NX_SCHEMAS, "*");

		Documents children = (Documents) request.execute();

		return children;


	}

	public String getId() {
		return "ListeSolutions/" + this.path;
	};

}
