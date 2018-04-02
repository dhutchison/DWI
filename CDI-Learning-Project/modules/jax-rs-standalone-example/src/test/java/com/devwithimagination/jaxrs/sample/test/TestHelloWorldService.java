package com.devwithimagination.jaxrs.sample.test;

import java.net.URL;

import javax.ws.rs.client.ClientBuilder;
import javax.ws.rs.client.WebTarget;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import org.jboss.arquillian.container.test.api.Deployment;
import org.jboss.arquillian.container.test.api.RunAsClient;
import org.jboss.arquillian.junit.Arquillian;
import org.jboss.arquillian.test.api.ArquillianResource;
import org.jboss.shrinkwrap.api.ShrinkWrap;
import org.jboss.shrinkwrap.api.asset.EmptyAsset;
import org.jboss.shrinkwrap.api.spec.WebArchive;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;

import com.devwithimagination.jaxrs.sample.config.SampleApplication;
import com.devwithimagination.jaxrs.sample.controller.HelloWorldService;

/**
 * Test case for the HelloWorldService. 
 * @author dhutchison
 *
 */
@RunWith(Arquillian.class)
public class TestHelloWorldService {

	@Deployment
	public static WebArchive createDeployment() {
	    WebArchive deployment =  ShrinkWrap
	        .create(WebArchive.class)
	        .addClasses(SampleApplication.class, HelloWorldService.class)
	        .addAsWebInfResource(EmptyAsset.INSTANCE, "beans.xml")
	        .addAsWebInfResource("WEB-INF/web.xml");
	    
	    return deployment;
	}

	@Test
	@RunAsClient
	public void testGetMessage(@ArquillianResource final URL base) {
		
		WebTarget webTarget = ClientBuilder.newClient().target(base.toExternalForm());
		
	    final Response response = webTarget
	        .path("/rest/hello/test")
	        .request(MediaType.APPLICATION_JSON)
	        .get();
	        
	    Assert.assertEquals("Service say: test\n Cache Manager configured? true\n", response.readEntity(String.class));
	}
	
}
