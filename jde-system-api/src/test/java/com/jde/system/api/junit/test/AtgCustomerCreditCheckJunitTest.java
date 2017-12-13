package com.jde.system.api.junit.test;

import java.util.HashMap;
import java.util.Map;
import java.util.ResourceBundle;
import java.io.InputStream;

import org.apache.commons.io.IOUtils;
import org.junit.Ignore;
import org.junit.Test;
import org.mule.api.MuleMessage;
import org.mule.module.client.MuleClient;
import org.mule.tck.junit4.FunctionalTestCase;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Ignore

	public class AtgCustomerCreditCheckJunitTest extends FunctionalTestCase {

		@Override
		protected String getConfigResources() {
			System.getProperties().put("mule.env", ResourceBundle.getBundle("mule-app").getString("mule.env"));
			System.getProperties().put("mulevault.key", ResourceBundle.getBundle("mule-app").getString("mulevault.key"));
//		    System.getProperties().put("-Dcom.ning.http.client.AsyncHttpClientConfig.acceptAnyCertificate", true);

			return "system-api-jde.xml,mule-domain-config.xml,system-api-jde-app-sync-payload.xml,system-api-jde-creaditcheck-implementation.xml,system-api-jde-customer-implementation.xml,system-api-jde-retry-mail-implementation.xml,system-api-jde-salesorder-implementation.xml";
		}

		private static final Logger Log = LoggerFactory.getLogger(AtgCustomerCreditCheckJunitTest.class);
		
		
		@Test
		
		public void Atg_CreditCheckJunitTest() throws Exception {

			MuleClient client = new MuleClient(muleContext);
			Map<String, Object> properties = new HashMap<String, Object>();
			properties.put("Content-Type", "application/json");
			
			MuleMessage result = null;
			String payload = "";
			
			payload = getFileContent("src/test/resource/junit/atg-customer-creditchecktest-request.json");
			
			Log.info("Payload for CreditCheck ", payload);
			
			
			result = client.send("vm://atg-customer-creditcheck-junit-config", payload, properties);
			if (result != null)
				Log.info("creditCheck Response is ??", result.getPayloadAsString());
			System.out.println(result.getPayloadAsString());

			
			
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
