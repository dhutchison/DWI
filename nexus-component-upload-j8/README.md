# Goal

The documentation for the [Sonatype Nexus component API][component-api] includes details of how to upload a Jar file to a Maven repository using cUrl:

```
curl -v -u admin:admin123 -X POST 'http://localhost:8081/service/rest/v1/components?repository=maven-releases' -F maven2.groupId=com.google.guava -F maven2.artifactId=guava -F maven2.version=24.0-jre -F maven2.asset1=@guava-24.0-jre.jar -F maven2.asset1.extension=jar -F maven2.asset2=@guava-24.0-jre-sources.jar -F maven2.asset2.classifier=sources -F maven2.asset2.extension=jar
```

I'm looking for a way to replicate this in Java 8, while bringing in no additional dependencies.  




[component-api]: https://help.sonatype.com/repomanager3/integrations/rest-and-integration-api/components-api#ComponentsAPI-UploadComponent "Upload Component"