package com.jde.system.api.junit.test;
import static org.junit.Assert.*;
import java.util.ResourceBundle;

import org.junit.Ignore;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.jde.system.api.junit.test.JDESALESORDERFunctionalJunitTest;

@Ignore

public class JDESALESORDERFunctionalJunitTest extends FunctionalTestCase{
	
	@Override
	protected String getConfigResources(){
		System.getProperties().put("mule.env",ResourceBundle.getBundle("mule-app").getString("mule.env"));
		System.getProperties().put("mulevault.key",ResourceBundle.getBundle("mule-app").getString("mulevault.key"));
		return "system-api-jde.xml,mule-domain-config.xml,system-api-jde-app-sync-payload.xml,system-api-jde-creaditcheck-implementation.xml,system-api-jde-customer-implementation.xml,system-api-jde-retry-mail-implementation.xml,system-api-jde-salesorder-implementation.xml";
	}
	
	private static final Logger Log = LoggerFactory
			.getLogger(JDESALESORDERFunctionalJunitTest.class);
	
	@Test
	public void jdeSystem() throws Exception{
		
	}
	
	public String getFileContent(String fileName) {
		try{
			ClassLoader classLoader = getClass().getClassLoader();
			InputStream inStr = classLoader.getResourceAsStream(fileName);

			String fileContent = IOUtils.toString(inStr);
			return fileContent;
		}catch(Exception e){
			e.printStackTrace();
		}
		return "";

}
