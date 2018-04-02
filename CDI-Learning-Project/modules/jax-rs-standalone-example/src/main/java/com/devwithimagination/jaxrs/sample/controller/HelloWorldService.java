package com.devwithimagination.jaxrs.sample.controller;

import javax.cache.CacheManager;
import javax.inject.Inject;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.core.Response;

@Path("/hello")
public class HelloWorldService {

    @Inject
    private CacheManager cacheManager;

    @GET
    @Path("/{param}")
    public Response getMessage(@PathParam("param") String message) {

        final String cm = ((cacheManager != null) ? Integer.toString(cacheManager.hashCode()) : "null");

        final String output = String.format("Service say: %s\n Cache Manager configured? %s\n", message, (cm != null));

        return Response.status(200).entity(output).build();
    }


}