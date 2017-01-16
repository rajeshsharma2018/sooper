package com.simplesarkar.configuration;

import org.apache.log4j.Logger;
import java.io.File;
import java.io.IOException;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.w3c.dom.Document;
import org.w3c.dom.NamedNodeMap;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

import com.simplesarkar.common.ArgumentValidator;
import com.simplesarkar.common.IConfigStore;
import com.simplesarkar.databaseutils.DataBaseTypes;

public class XmlConfigurationStore implements IConfigStore{
	final static Logger log = Logger.getLogger(XmlConfigurationStore.class);
	
	private boolean isInitd;
	private Document xDoc;
	private Node configElement;
	private static XmlConfigurationStore configStoreInst;
	private static Object lockingObj = new Object();
	private static final String configFilePath = "AppConfig.xml";
	
	public static XmlConfigurationStore GetInstance()
	{
		XmlConfigurationStore store = null;
		synchronized(lockingObj)
		{
			if (configStoreInst == null)
			{
				configStoreInst = new XmlConfigurationStore();
				try
				{
					configStoreInst.Init(configFilePath);
				}
				catch (Exception ex)
				{
					log.error("Could not init the configStore from the config file : " + configFilePath);
					log.error("Caught exception in the init : " + ex.toString());
					configStoreInst = null;
				}
			}
			
			store = configStoreInst;
		}
		
		return store;
	}
	
	//singleton... 
	private XmlConfigurationStore() {
	    isInitd = false;
	    xDoc = null;
	    configElement = null;
	}	
	
	private void Init(String configFilePath) throws IllegalArgumentException, ParserConfigurationException, SAXException, IOException
	{
		if (ArgumentValidator.IsStringNullOrEmpty(configFilePath))
		{
			log.error("The config FilePath is null");
		}
		
		File fXmlFile = new File(configFilePath);
		DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
		DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
		xDoc = dBuilder.parse(fXmlFile);
		xDoc.getDocumentElement().normalize();
		configElement = xDoc.getElementsByTagName("Configuration").item(0);
		isInitd = true;
	}
	
	public String GetDBConnectionString()
	{
		String retVal = null;
		
		if (!isInitd)
		{
			return retVal;
		}
		
		Node dbConfNode = getNodeByName(configElement, "DBConfig");
		if (dbConfNode != null)
		{
			retVal = getAttributeValue(dbConfNode, "DBConnStr"); 	
		}
		return retVal;
	}
	
	public String GetDBUserName()
	{
		String retVal = null;
		
		if (!isInitd)
		{
			return retVal;
		}
		
		Node dbConfNode = getNodeByName(configElement, "DBConfig");
		if (dbConfNode != null)
		{
			retVal = getAttributeValue(dbConfNode, "DBUserName"); 	
		}
		return retVal;
	}
	
	public String GetDBPasswd()
	{
		String retVal = null;
		
		if (!isInitd)
		{
			return retVal;
		}
		
		Node dbConfNode = getNodeByName(configElement, "DBConfig");
		if (dbConfNode != null)
		{
			retVal = getAttributeValue(dbConfNode, "DBPasswd"); 	
		}
		return retVal;
	}
	
	public String GetEmailUserName() {
		String retVal = null;
		
		if (!isInitd)
		{
			return retVal;
		}
		
		Node dbConfNode = getNodeByName(configElement, "EmailConfig");
		if (dbConfNode != null)
		{
			retVal = getAttributeValue(dbConfNode, "EmailUserName"); 	
		}
		return retVal;
	}

	public String GetEmailPassword() {
		String retVal = null;
		
		if (!isInitd)
		{
			return retVal;
		}
		
		Node dbConfNode = getNodeByName(configElement, "EmailConfig");
		if (dbConfNode != null)
		{
			retVal = getAttributeValue(dbConfNode, "EmailUserPassword"); 	
		}
		return retVal;
	}

	public String GetEmailHostName() {
		String retVal = null;
		
		if (!isInitd)
		{
			return retVal;
		}
		
		Node dbConfNode = getNodeByName(configElement, "EmailConfig");
		if (dbConfNode != null)
		{
			retVal = getAttributeValue(dbConfNode, "EmailHostName"); 	
		}
		return retVal;
	}

	public String GetEmailHostPort() {
		String retVal = null;
		
		if (!isInitd)
		{
			return retVal;
		}
		
		Node dbConfNode = getNodeByName(configElement, "EmailConfig");
		if (dbConfNode != null)
		{
			retVal = getAttributeValue(dbConfNode, "EmailHostPort"); 	
		}
		return retVal;
	}

	private String getAttributeValue(Node masterNode, String attributeName)
	{
		String value = null;
		
		NamedNodeMap nodeMap = masterNode.getAttributes();
		for (int i = 0; i < nodeMap.getLength(); i++)
		{
			Node node = nodeMap.item(i);
			if (node.getNodeName().equals(attributeName))
			{
				value = node.getNodeValue();
				break;
			}
		}
		return value;
	}
	
	private Node getNodeByName(Node masterNode, String nodeName)
	{
		Node nodeToReturn = null;
		NodeList nl = masterNode.getChildNodes();
		for (int i = 0 ; i < nl.getLength(); i++)
		{
			Node node = nl.item(i);
			if ((node.getNodeType() == Node.ELEMENT_NODE) && (node.getNodeName().equals(nodeName)))
			{
				nodeToReturn = node;
				break;
			}
		}
		
		return nodeToReturn;
	}

	public DataBaseTypes GetDBType() {
		//TODO : modify this to read the config form the xml, as of now we only have one DB type
		return DataBaseTypes.MYSQL;
	}	
}
