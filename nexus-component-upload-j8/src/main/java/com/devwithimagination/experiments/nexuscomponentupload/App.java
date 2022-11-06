package com.devwithimagination.experiments.nexuscomponentupload;

import java.io.File;
import java.util.Arrays;

/**
 * Hello world!
 *
 */
public class App {
    public static void main( String[] args ) throws Exception {

        //TODO: Make args

        final String username = "admin";
        final String password = "admin123";
        final String nexusHost = "http://localhost:8081";
        final String repositoryName = "maven-releases";

        final File asset1 = new File("/Users/dhutchison/Downloads/1Password.zip");


        final Uploader uploader = new Uploader(username, password, nexusHost, repositoryName);
        uploader.upload("com.1password", "release", "1.0.0", Arrays.asList(asset1));

        System.out.println( "Hello World!" );
    }
}
