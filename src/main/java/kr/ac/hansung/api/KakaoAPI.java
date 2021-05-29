package kr.ac.hansung.api;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.message.BasicNameValuePair;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

@Service
public class KakaoAPI {

   private final static String K_CLIENT_ID = "4471fac76ed3cfc26c129be27b92eddd";
   private final static String K_REDIRECT_URI = "http://localhost:1000/hansung/oauth";

   public String getAccessToken(String autorize_code) {

      final String RequestUrl = "https://kauth.kakao.com/oauth/token";
      final List<NameValuePair> postParams = new ArrayList<NameValuePair>();
      postParams.add(new BasicNameValuePair("grant_type", "authorization_code"));
      postParams.add(new BasicNameValuePair("client_id", K_CLIENT_ID)); 
      postParams.add(new BasicNameValuePair("redirect_uri", K_REDIRECT_URI)); 
      postParams.add(new BasicNameValuePair("code", autorize_code)); 

      final HttpClient client = HttpClientBuilder.create().build();
      final HttpPost post = new HttpPost(RequestUrl);
      JsonNode returnNode = null;

      try {

         post.setEntity(new UrlEncodedFormEntity(postParams));
         final HttpResponse response = client.execute(post);
         final int responseCode = response.getStatusLine().getStatusCode();

         ObjectMapper mapper = new ObjectMapper();
         returnNode = mapper.readTree(response.getEntity().getContent());


      } catch (UnsupportedEncodingException e) {
         e.printStackTrace();
      } catch (ClientProtocolException e) {
         e.printStackTrace();
      } catch (IOException e) {
         e.printStackTrace();
      } finally {
         // clear resources
      }
      return returnNode.get("access_token").toString();
   }

   public JsonNode getKakaoUserInfo(String accessToken) {

      final String RequestUrl = "https://kapi.kakao.com/v2/user/me";
      final HttpClient client = HttpClientBuilder.create().build();
      final HttpPost post = new HttpPost(RequestUrl);

      // add header
      post.addHeader("Authorization", "Bearer " + accessToken);

      //log.info("accessToken: " + accessToken);

      JsonNode returnNode = null;

      try {

         final HttpResponse response = client.execute(post);
         final int responseCode = response.getStatusLine().getStatusCode();

         //log.info("\nSending 'POST' request to URL : " + RequestUrl);
         //log.info("Response Code : " + responseCode);

         ObjectMapper mapper = new ObjectMapper();
         returnNode = mapper.readTree(response.getEntity().getContent());

      } catch (UnsupportedEncodingException e) {
         e.printStackTrace();
      } catch (ClientProtocolException e) {
         e.printStackTrace();
      } catch (IOException e) {
         e.printStackTrace();
      } finally {

         // clear resources
      }
      return returnNode;
   }



   public void kakaologout(String accessToken) {
      final String RequestUrl = "https://kapi.kakao.com/v1/user/logout";
      final HttpClient client = HttpClientBuilder.create().build();
      final HttpPost post = new HttpPost(RequestUrl);

      // add header
      post.addHeader("Authorization", "Bearer " + accessToken);

      try {

         final HttpResponse response = client.execute(post);
         final int responseCode = response.getStatusLine().getStatusCode();

         //log.info("Response Code : " + responseCode);

      } catch (IOException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }
   }
}