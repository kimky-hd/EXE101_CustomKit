package com.papericious.util;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.papericious.model.GooglePojo;
import org.apache.http.client.fluent.Form;
import org.apache.http.client.fluent.Request;

import java.io.IOException;

public class GoogleUtils {

    // IMPORTANT: REPLACE THESE WITH YOUR ACTUAL GOOGLE CLOUD CREDENTIALS
    // NOTE: In a real production app, use Environment Variables or a properties file.
    public static final String GOOGLE_CLIENT_ID = System.getenv("GOOGLE_CLIENT_ID");
    public static final String GOOGLE_CLIENT_SECRET = System.getenv("GOOGLE_CLIENT_SECRET");
    
    // This must match exactly the URI registered in Google Cloud Console
    public static final String GOOGLE_REDIRECT_URI = "http://localhost:8888/login-google";
    
    public static final String GOOGLE_LINK_GET_TOKEN = "https://accounts.google.com/o/oauth2/token";
    public static final String GOOGLE_LINK_GET_USER_INFO = "https://www.googleapis.com/oauth2/v1/userinfo?access_token=";
    public static final String GOOGLE_GRANT_TYPE = "authorization_code";

    public static String getToken(final String code) throws IOException {
        String response = Request.Post(GOOGLE_LINK_GET_TOKEN)
                .bodyForm(Form.form().add("client_id", GOOGLE_CLIENT_ID)
                        .add("client_secret", GOOGLE_CLIENT_SECRET)
                        .add("redirect_uri", GOOGLE_REDIRECT_URI)
                        .add("code", code)
                        .add("grant_type", GOOGLE_GRANT_TYPE).build())
                .execute().returnContent().asString();

        JsonObject jobj = new Gson().fromJson(response, JsonObject.class);
        String accessToken = jobj.get("access_token").getAsString();
        return accessToken;
    }

    public static GooglePojo getUserInfo(final String accessToken) throws IOException {
        String link = GOOGLE_LINK_GET_USER_INFO + accessToken;
        String response = Request.Get(link).execute().returnContent().asString();
        GooglePojo googlePojo = new Gson().fromJson(response, GooglePojo.class);
        return googlePojo;
    }

    public static String getLoginUrl() {
        return "https://accounts.google.com/o/oauth2/auth?scope=email%20profile%20openid&redirect_uri=" 
                + GOOGLE_REDIRECT_URI 
                + "&response_type=code&client_id=" + GOOGLE_CLIENT_ID 
                + "&approval_prompt=force";
    }
}
