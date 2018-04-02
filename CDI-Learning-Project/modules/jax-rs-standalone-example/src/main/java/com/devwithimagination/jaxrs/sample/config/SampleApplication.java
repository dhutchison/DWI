package com.devwithimagination.jaxrs.sample.config;

import java.util.HashSet;
import java.util.Set;

import javax.ws.rs.core.Application;

import com.devwithimagination.jaxrs.sample.controller.HelloWorldService;

public class SampleApplication extends Application {

	@Override
	public Set<Class<?>> getClasses() {
		Set<Class<?>> s = new HashSet<Class<?>>();
		s.add(HelloWorldService.class);
		return s;
	}
	
}
