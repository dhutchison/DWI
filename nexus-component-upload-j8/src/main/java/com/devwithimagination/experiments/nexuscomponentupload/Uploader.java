package com.devwithimagination.experiments.nexuscomponentupload;

import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.util.Base64;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Uploader {

    /**
     * Line separator required by multipart/form-data.
     */
    private static final String CRLF = "\r\n";

    private final String username;
    private final String password;

    private final URL uploadUrl;

    public Uploader(final String username, final String password, final String nexusHost, final String repositoryName) throws MalformedURLException {
        this.username = username;
        this.password = password;


        this.uploadUrl = new URL(String.format("%s/service/rest/v1/components?repository=%s", nexusHost, repositoryName));
    }

    public void upload(final String groupId, final String artifactId, final String version, final List<File> assets) throws IOException {

        /* Create a map of the fields that need to be included in the form */
        final Map<String, Object> formValueMap = new HashMap<>();
        formValueMap.put("maven2.groupId", groupId);
        formValueMap.put("maven2.artifactId", artifactId);
        formValueMap.put("maven2.version", version);

        for (int index = 0; index < assets.size(); index++) {
            final File asset = assets.get(index);
            formValueMap.put("maven2.asset" + (index + 1), asset);
            formValueMap.put("maven2.asset" + (index + 1) + ".extension",
                    asset.getName().substring(asset.getName().lastIndexOf(".")));
        }

        doMultipartUpload(formValueMap);

    }

    /**
     * 
     * This is very much based on https://stackoverflow.com/a/2469587/230449
     */
    private void doMultipartUpload(final Map<String, Object> formParams) throws IOException {

        // Just generate some unique random value.
        final String boundary = Long.toHexString(System.currentTimeMillis()); 

        /* Open the connection */
        final URLConnection connection = uploadUrl.openConnection();

        /* Add the authentication information */
        final String auth = username + ":" + password;
        final String encodedAuth = Base64.getEncoder().encodeToString(auth.getBytes(StandardCharsets.UTF_8));
        connection.setRequestProperty("Authorization", "Basic " + encodedAuth);

        /* Start building the request */
        connection.setDoOutput(true);
        connection.setRequestProperty("Content-Type", "multipart/form-data; boundary=" + boundary);

        try (
                OutputStream output = connection.getOutputStream();
                PrintWriter writer = new PrintWriter(new OutputStreamWriter(output, StandardCharsets.UTF_8), true);) {

            for (Map.Entry<String, Object> entry : formParams.entrySet()) {

                if (entry.getValue() instanceof String) {
                    // Send normal param.
                    writer.append("--" + boundary).append(CRLF);
                    writer.append("Content-Disposition: form-data; name=\"" + entry.getKey() + "\"").append(CRLF);
                    writer.append("Content-Type: text/plain; charset=" + StandardCharsets.UTF_8).append(CRLF);
                    writer.append(CRLF).append(entry.getValue().toString()).append(CRLF).flush();

                } else if (entry.getValue() instanceof File) {
                    // Send binary file.

                    final File binaryFile = (File) entry.getValue();

                    writer.append("--" + boundary).append(CRLF);
                    writer.append("Content-Disposition: form-data; name=\"" + entry.getKey() + "\"; filename=\""
                            + binaryFile.getName() + "\"").append(CRLF);
                    writer.append("Content-Type: " + URLConnection.guessContentTypeFromName(binaryFile.getName()))
                            .append(CRLF);
                    writer.append("Content-Transfer-Encoding: binary").append(CRLF);
                    writer.append(CRLF).flush();
                    Files.copy(binaryFile.toPath(), output);
                    // Important before continuing with writer!
                    output.flush(); 
                    // CRLF is important! It indicates end of boundary.
                    writer.append(CRLF).flush(); 
                } else {
                    throw new IllegalArgumentException("Unsupported parameter value type "
                            + entry.getValue().getClass().getName() + " for parameter " + entry.getKey());
                }
            }

            // End of multipart/form-data.
            writer.append("--" + boundary + "--").append(CRLF).flush();
        }
        
        // Request is lazily fired whenever you need to obtain information about
        // response.
        int responseCode = ((HttpURLConnection) connection).getResponseCode();
        System.out.println(responseCode); // Should be 200

    }

}
