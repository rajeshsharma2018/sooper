package com.simplesarkar.configuration;

import org.apache.log4j.Logger;

import com.simplesarkar.common.ArgumentValidator;
import com.simplesarkar.common.IConfigStore;
import com.simplesarkar.common.SimpleUtils;

public final class ConfigurationStoreFactory {
	final static Logger log = Logger.getLogger(ConfigurationStoreFactory.class);
	
	public static IConfigStore GetConfigStore()
	{
		IConfigStore configStoreInst = null;
		String configStoreType = null;
		configStoreType = SimpleUtils.GetEnvOrJVMProp("ConfigStoreType");
		
		if ((!ArgumentValidator.IsStringNullOrEmpty(configStoreType)) && (configStoreType.equalsIgnoreCase("xmlconfigstore")))
		{
			log.info("Env var set to load XML config store...");
			configStoreInst =  XmlConfigurationStore.GetInstance();
		}
		else
		{
			log.info("Env var missing or not set to xml store, loading static store");
			configStoreInst = StaticConfigurationStore.GetInstance();
		}
		
		return configStoreInst;
	}
}
