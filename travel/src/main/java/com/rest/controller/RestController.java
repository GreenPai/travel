package com.rest.controller;


	import java.io.BufferedReader;
	import java.io.IOException;
	import java.io.InputStreamReader;
	import java.net.HttpURLConnection;
	import java.net.URL;
	import java.net.URLEncoder;
	import java.util.HashMap;

	import javax.servlet.http.HttpServletRequest;
	import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
	import org.springframework.web.bind.annotation.RequestMethod;
	import org.springframework.web.bind.annotation.RequestParam;


	//  @RestController = @Controller + @ResponseBody
	//  @ResponseBody 는 return값이 json, xml 과 같은 문자열가능
	@Controller 
	public class RestController {
		//  /deleteFile?file_num=12&sfile=flower_1.jpg"
		

		@RequestMapping(value   = "/travle",
				method  = RequestMethod.GET,
				headers = "Accept=application/json")	
			public  void  travle(
			@RequestParam  HashMap<String, Object> map,
			HttpServletRequest request, HttpServletResponse response) throws IOException {
			
			String json = getTravle( request, response);
			System.out.println( json );
			
		}
		
		private String getTravle(HttpServletRequest request, HttpServletResponse response) throws IOException {
			StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/6260000/AttractionService/getAttractionKr"); /*URL*/
	        urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=X5Ow2Q7%2F1YLN6F2IGV2I9%2F1G9A5aZ2eNuiJnwQvTm8m7w%2FDEh2jJsBMatEA%2FFBy2dM5%2FoJASYTxYqsoEukRzvQ%3D%3D"); /*Service Key*/
	        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*페이지번호*/
	        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("10", "UTF-8")); /*한 페이지 결과 수*/
	        urlBuilder.append("&" + URLEncoder.encode("resultType","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*JSON방식으로 호출 시 파라미터 resultType=json 입력*/
	        urlBuilder.append("&" + URLEncoder.encode("UC_SEQ","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*콘텐츠 ID*/
	        URL url = new URL(urlBuilder.toString());
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("GET");
	        conn.setRequestProperty("Content-type", "application/json");
	        System.out.println("Response code: " + conn.getResponseCode());
	        BufferedReader rd;
	        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
	            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	        } else {
	            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
	        }
	        StringBuilder sb = new StringBuilder();
	        String line;
	        while ((line = rd.readLine()) != null) {
	            sb.append(line);
	        }
	        rd.close();
	        conn.disconnect();
	        System.out.println(sb.toString());
	        return sb.toString();
		}
		
		
	}








