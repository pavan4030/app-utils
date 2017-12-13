package com.jde.system.api.junit.test;

import static org.junit.Assert.*;

import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;
import java.util.ResourceBundle;

import org.apache.commons.io.IOUtils;
import org.junit.Ignore;
import org.junit.Test;

import org.mule.api.MuleMessage;
import org.mule.module.client.MuleClient;
import org.mule.tck.junit4.FunctionalTestCase;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.jde.system.api.junit.test.JdeSystemApiSalesorderImplementationTest;

public class JdeSystemApiSalesorderImplementationTest extends FunctionalTestCase{
	
      @Override
      protected String getConfigResources(){
		System.getProperties().put("mule.env", "junit");
		System.getProperties().put("mulevault.key",ResourceBundle.getBundle("mule-app").getString("mulevault.key"));
		return "system-api-jde.xml,system-api-junit.xml,system-api-jde-app-sync-payload.xml,system-api-jde-customer-implementation.xml,system-api-jde-retry-mail-implementation.xml,system-api-jde-salesorder-implementation.xml";
	}
	
	private static final Logger Log = LoggerFactory
			.getLogger(JdeSystemApiSalesorderImplementationTest.class);
	
	
	//junit for positive scenario
		@Test
		public void jdeSystemApiSalesorderImplementationPositiveTest() throws Exception {
			String payload = "";
			payload = getFileContent("junit/jde_systemapi_salesorder_PositiveScenario.json");
			
		
		
			
			MuleClient client = new MuleClient(muleContext);

			Map<String, Object> properties = new HashMap<String, Object>();
			properties.put("Content-Type", "application/json");
			properties.put("http.method", "POST");

			MuleMessage result = null;
			result = client.send("vm://create-update-salesorderjunitTest",payload,properties);
			Log.info("jdeSystemApiSalesorderImplementationPositiveTest request sent ", result.getPayloadAsString());
			
			JsonElement jelement = new JsonParser().parse(result.getPayloadAsString());
			JsonObject jobject = jelement.getAsJsonObject();

			assertNotNull("jde System Api Salesorder Implementation is null payload", jobject);

		}
		
		
		//junit for negative scenario
		
		@Test
		public void jdeSystemApiSalesorderImplementationNegativeTest() throws Exception {
			String payload = "";
			payload = getFileContent("junit/jde_systemapi_salesorder_NegativeScenario.json");
			
			MuleClient client = new MuleClient(muleContext);

			Map<String, Object> properties = new HashMap<String, Object>();
			properties.put("Content-Type", "application/json");
			properties.put("http.method", "POST");

			MuleMessage result = null;
			result = client.send("vm://create-update-salesorderjunitTest",payload,properties);
			Log.info("jdeSystemApiSalesorderImplementationNegativeTest request sent ", result.getPayloadAsString());
			
			JsonElement jelement = new JsonParser().parse(result.getPayloadAsString());
			JsonObject jobject = jelement.getAsJsonObject();

			assertNotNull("jde System Api Salesorder Implementation is null payload", jobject);

			JsonObject errorElement = jobject.getAsJsonObject("errorMessage");

			assertNotNull("jde System Api Salesorder Implementation  Json Validation Schema Not working", errorElement);

			JsonElement errorCodeElement = errorElement.get("errorDescription");

			assertNotNull("jde System Api Salesorder Implementation Not working", errorCodeElement);
			
			Log.info("jdeSystemApiSalesorderImplementationNegativeTest Error Description ", errorCodeElement);
		}
		
		public String getFileContent(String fileName) {

			try {
				ClassLoader classLoader = getClass().getClassLoader();
				InputStream inStr = classLoader.getResourceAsStream(fileName);

				String fileContent = IOUtils.toString(inStr);
				return fileContent;
			} catch (Exception e) {
				e.printStackTrace();
			}
			return "";

		}

}
