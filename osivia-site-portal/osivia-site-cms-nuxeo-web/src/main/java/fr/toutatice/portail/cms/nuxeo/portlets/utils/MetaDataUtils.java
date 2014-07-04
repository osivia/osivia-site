/**
 * Classe utilitaire permettant un travail sur les méta-données des contenus Nuxeo.
 */
package fr.toutatice.portail.cms.nuxeo.portlets.utils;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.commons.lang.StringUtils;
import org.nuxeo.ecm.automation.client.model.Document;

/**
 * @author david
 *
 */
public class MetaDataUtils {

	/**
	 * Méta-donnée source d'un contenu Nuxeo.
	 */
	public static String SOURCE_META_DATA = "dc:source";

	/**
	 * Constructeur privé car seul accès statique permis.
	 */
	private MetaDataUtils(){

	}

	/**
	 * Des informations sont portées par les méta-données.
	 * Cette méthode récupère le nom d'un lien renseigné dans une méta-donnée
	 * sous la forme: nom_lien:"<nom_du_lien>"
	 *
	 * @param document Contenu Nuxeo
	 * @param metaData Méta-donnée du contenu Nuxeo
	 * @return le nom du lien renseigné dans la méta-donnée du contenu
	 */
	public static String getLinkNameFromMetaData(Document document, String metaData){
		String link = "";
		String data = document.getString(metaData, "");
		if(StringUtils.isNotEmpty(data)){
			Pattern linkRegExp = Pattern.compile("(.*)nom_lien:([^\"]*)\"([^\"]*)\"(.*)");
			Matcher matcher = linkRegExp.matcher(data);
			if(matcher.matches()){
				/* L'expression régulière implique de prendre le troisième groupe. */
				link = matcher.group(3);
			}
		}
		return link;
	}

	/**
	 * Des informations sont portées par les méta-données.
	 * Cette méthode récupère la cible d'un lien renseigné dans une méta-donnée
	 * sous la forme: cible_lien:"<nom_d__lien>"
	 *
	 * @param document Contenu Nuxeo
	 * @param metaData Méta-donnée du contenu Nuxeo
	 * @return la cible du lien renseigné dans la méta-donnée du contenu
	 */
	public static String getTargetLinkFromMetadata(Document document, String metaData){
		String targetLink = "";
		String data = document.getString(metaData, "");
		if(StringUtils.isNotEmpty(data)){
			Pattern linkRegExp = Pattern.compile("(.*)cible_lien:([^\"]*)\"([^\"]*)\"(.*)");
			Matcher matcher = linkRegExp.matcher(data);
			if(matcher.matches()){
				/* L'expression régulière implique de prendre le troisième groupe. */
				targetLink = matcher.group(3);
			}
		}
		return targetLink;
	}

	/**
	 * Des informations sont portées par les méta-données.
	 * Cette méthode récupère le nom de styles css renseignés dans une méta-donnée
	 * sous la forme: styles:"<noms des classes css>"
	 *
	 * @param document Contenu Nuxeo
	 * @param metaData Méta-donnée du contenu Nuxeo
	 * @return le nom des classes css renseignées dans la méta-donnée du contenu
	 */
	public static String getStylesFromMetaData(Document document, String metaData){
		String styles = "";
		String data = document.getString(metaData, "");
		if(StringUtils.isNotEmpty(data)){
			Pattern linkRegExp = Pattern.compile("(.*)styles:([^\"]*)\"([^\"]*)\"(.*)");
			Matcher matcher = linkRegExp.matcher(data);
			if(matcher.matches()){
				/* L'expression régulière implique de prendre le troisième groupe. */
				styles = matcher.group(3);
			}
		}
		return styles;
	}

}
