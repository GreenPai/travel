package com.board.controller;


	import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;


	//  @RestController = @Controller + @ResponseBody
	//  @ResponseBody 는 return값이 json, xml 과 같은 문자열가능
	@RestController 
	public class TripRestController {		
		// 여행 명소 api
		@RequestMapping(
				value   = "/trip",
				method  = RequestMethod.GET,
				headers = "Accept=application/json")	
			public  String  trip(
			@RequestParam  HashMap<String, Object> map,
			HttpServletRequest request, HttpServletResponse response) throws IOException {
			
			String json = getTrip( request, response);
			System.out.println("json:" +  json );
			return json;
			
		}
		
		private String getTrip(HttpServletRequest request, HttpServletResponse response) throws IOException {
			StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/6260000/AttractionService/getAttractionKr"); /*URL*/
	        urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=X5Ow2Q7%2F1YLN6F2IGV2I9%2F1G9A5aZ2eNuiJnwQvTm8m7w%2FDEh2jJsBMatEA%2FFBy2dM5%2FoJASYTxYqsoEukRzvQ%3D%3D"); /*Service Key*/
	        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*페이지번호*/
	        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("40", "UTF-8")); /*한 페이지 결과 수*/
	        urlBuilder.append("&" + URLEncoder.encode("resultType","UTF-8") + "=" + URLEncoder.encode("json", "UTF-8")); /*JSON방식으로 호출 시 파라미터 resultType=json 입력*/
	        //urlBuilder.append("&" + URLEncoder.encode("UC_SEQ","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*콘텐츠 ID*/
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
	       // System.out.println(sb.toString());
	        return sb.toString();
		}
			
			// 여행 명소 api
			@RequestMapping(
					value   = "/tripView",
					method  = RequestMethod.GET,
					headers = "Accept=application/json")	
				public  String  tripView(
				@RequestParam  HashMap<String, Object> map,
				HttpServletRequest request, HttpServletResponse response) throws IOException {
				
				String json = getTripView( request, response);
				System.out.println("json:" +  json );
				return json;
				
			}
			
			private String getTripView(HttpServletRequest request, HttpServletResponse response) throws IOException {
				StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/6260000/AttractionService/getAttractionKr"); /*URL*/
		        urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=X5Ow2Q7%2F1YLN6F2IGV2I9%2F1G9A5aZ2eNuiJnwQvTm8m7w%2FDEh2jJsBMatEA%2FFBy2dM5%2FoJASYTxYqsoEukRzvQ%3D%3D"); /*Service Key*/
		        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*페이지번호*/
		        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("40", "UTF-8")); /*한 페이지 결과 수*/
		        urlBuilder.append("&" + URLEncoder.encode("resultType","UTF-8") + "=" + URLEncoder.encode("json", "UTF-8")); /*JSON방식으로 호출 시 파라미터 resultType=json 입력*/
		        //urlBuilder.append("&" + URLEncoder.encode("UC_SEQ","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*콘텐츠 ID*/
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
		       // System.out.println(sb.toString());
		        return sb.toString();
			}
		

		    // 테마여행api
			@RequestMapping(
					value   = "/tema",
					method  = RequestMethod.GET,
					headers = "Accept=application/json")	 
				public  String  tema(
				@RequestParam  HashMap<String, Object> map,
				HttpServletRequest request, HttpServletResponse response) throws IOException {
				
				String json = getTema( request, response);
				return json;
				
			}
			
			private String getTema(HttpServletRequest request, HttpServletResponse response) throws IOException {
		        StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/6260000/RecommendedService/getRecommendedKr"); /*URL*/
		        urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=X5Ow2Q7%2F1YLN6F2IGV2I9%2F1G9A5aZ2eNuiJnwQvTm8m7w%2FDEh2jJsBMatEA%2FFBy2dM5%2FoJASYTxYqsoEukRzvQ%3D%3D"); /*Service Key*/
		        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*페이지번호*/
		        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("40", "UTF-8")); /*한 페이지 결과 수*/
		        urlBuilder.append("&" + URLEncoder.encode("resultType","UTF-8") + "=" + URLEncoder.encode("json", "UTF-8")); /*JSON방식으로 호출 시 파라미터 resultType=json 입력*/
		        //urlBuilder.append("&" + URLEncoder.encode("UC_SEQ","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*콘텐츠 ID*/
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
		        //System.out.println(sb.toString());
		        return sb.toString();
		    }
			
			// 테마여행api
						@RequestMapping(
								value   = "/temaView",
								method  = RequestMethod.GET,
								headers = "Accept=application/json")	 
							public  String  temaView(
							@RequestParam  HashMap<String, Object> map,
							HttpServletRequest request, HttpServletResponse response) throws IOException {
							
							String json = getTemaView( request, response);
							return json;
							
						}
						
						private String getTemaView(HttpServletRequest request, HttpServletResponse response) throws IOException {
					        StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/6260000/RecommendedService/getRecommendedKr"); /*URL*/
					        urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=X5Ow2Q7%2F1YLN6F2IGV2I9%2F1G9A5aZ2eNuiJnwQvTm8m7w%2FDEh2jJsBMatEA%2FFBy2dM5%2FoJASYTxYqsoEukRzvQ%3D%3D"); /*Service Key*/
					        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*페이지번호*/
					        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("40", "UTF-8")); /*한 페이지 결과 수*/
					        urlBuilder.append("&" + URLEncoder.encode("resultType","UTF-8") + "=" + URLEncoder.encode("json", "UTF-8")); /*JSON방식으로 호출 시 파라미터 resultType=json 입력*/
					        //urlBuilder.append("&" + URLEncoder.encode("UC_SEQ","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*콘텐츠 ID*/
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
					        //System.out.println(sb.toString());
					        return sb.toString();
					    }
			
			
			// 부산 맛집정보 api
			@RequestMapping(
					value   = "/food",
					method  = RequestMethod.GET,
					headers = "Accept=application/json")	 
				public  String  food(
				@RequestParam  HashMap<String, Object> map,
				HttpServletRequest request, HttpServletResponse response) throws IOException {
				
				String json = getFood( request, response);
				return json;
				
			}
			
			private String getFood(HttpServletRequest request, HttpServletResponse response) throws IOException {
				StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/6260000/FoodService/getFoodKr"); /*URL*/
		        urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=X5Ow2Q7%2F1YLN6F2IGV2I9%2F1G9A5aZ2eNuiJnwQvTm8m7w%2FDEh2jJsBMatEA%2FFBy2dM5%2FoJASYTxYqsoEukRzvQ%3D%3D"); /*Service Key*/
		        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*페이지번호*/
		        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("50", "UTF-8")); /*한 페이지 결과 수*/
		        urlBuilder.append("&" + URLEncoder.encode("resultType","UTF-8") + "=" + URLEncoder.encode("json", "UTF-8")); /*JSON방식으로 호출 시 파라미터 resultType=json 입력*/
		        //urlBuilder.append("&" + URLEncoder.encode("UC_SEQ","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*콘텐츠 ID*/
		        URL url = new URL(urlBuilder.toString());
		        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		        conn.setRequestMethod("GET");
		        conn.setRequestProperty("Content-type", "application/json");
		        //System.out.println("Response code: " + conn.getResponseCode());
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
		        //System.out.println(sb.toString());
		        return sb.toString();
		    }
			
			// 부산광역시_관광지 장애인 편의시설 보유 업소 정보 api
			
			@RequestMapping(
					value   = "/handi",
					method  = RequestMethod.GET,
					headers = "Accept=application/json")	 
				public  String  handi(
				@RequestParam  HashMap<String, Object> map,
				HttpServletRequest request, HttpServletResponse response) throws IOException {
				
				String json = getHandi( request, response);
				return json;
				
			}
			private String getHandi(HttpServletRequest request, HttpServletResponse response) throws IOException {
			StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/6260000/BusanFcltsDsgstInfoService/getFcltsDsgstInfo"); /*URL*/
	        urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=X5Ow2Q7%2F1YLN6F2IGV2I9%2F1G9A5aZ2eNuiJnwQvTm8m7w%2FDEh2jJsBMatEA%2FFBy2dM5%2FoJASYTxYqsoEukRzvQ%3D%3D"); /*Service Key*/
	        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*페이지번호*/
	        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("40", "UTF-8")); /*한 페이지 결과 수*/
	        urlBuilder.append("&" + URLEncoder.encode("resultType","UTF-8") + "=" + URLEncoder.encode("json", "UTF-8")); /*JSON방식으로 호출 시 파라미터 resultType=json 입력*/
	        URL url = new URL(urlBuilder.toString());
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("GET");
	        conn.setRequestProperty("Content-type", "application/json");
	        //System.out.println("Response code: " + conn.getResponseCode());
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
	        //System.out.println(sb.toString());
	        return sb.toString();
	    }
			
			
			// 부산도보여행 api
			@RequestMapping(
					value   = "/walk",
					method  = RequestMethod.GET,
					headers = "Accept=application/json")	 
				public  String  walk(
				@RequestParam  HashMap<String, Object> map,
				HttpServletRequest request, HttpServletResponse response) throws IOException {
				
				String json = getWalk( request, response);
				return json;
				
			}
			private String getWalk(HttpServletRequest request, HttpServletResponse response) throws IOException {
			StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/6260000/WalkingService/getWalkingKr"); /*URL*/
	        urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=X5Ow2Q7%2F1YLN6F2IGV2I9%2F1G9A5aZ2eNuiJnwQvTm8m7w%2FDEh2jJsBMatEA%2FFBy2dM5%2FoJASYTxYqsoEukRzvQ%3D%3D"); /*Service Key*/
	        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*페이지번호*/
	        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("40", "UTF-8")); /*한 페이지 결과 수*/
	        urlBuilder.append("&" + URLEncoder.encode("resultType","UTF-8") + "=" + URLEncoder.encode("json", "UTF-8")); /*JSON방식으로 호출 시 파라미터 resultType=json 입력*/
	        //urlBuilder.append("&" + URLEncoder.encode("UC_SEQ","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*콘텐츠 ID*/
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
	        //System.out.println(sb.toString());
	        return sb.toString();
	    }
			
			// 부산축제정보 api
			@RequestMapping(
					value   = "/festa",
					method  = RequestMethod.GET,
					headers = "Accept=application/json")	 
				public  String  festa(
				@RequestParam  HashMap<String, Object> map,
				HttpServletRequest request, HttpServletResponse response) throws IOException {
				
				String json = getFesta( request, response);
				return json;
				
			}
			private String getFesta(HttpServletRequest request, HttpServletResponse response) throws IOException {
				StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/6260000/FestivalService/getFestivalKr"); /*URL*/
		        urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=X5Ow2Q7%2F1YLN6F2IGV2I9%2F1G9A5aZ2eNuiJnwQvTm8m7w%2FDEh2jJsBMatEA%2FFBy2dM5%2FoJASYTxYqsoEukRzvQ%3D%3D"); /*Service Key*/
		        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*페이지번호*/
		        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("40", "UTF-8")); /*한 페이지 결과 수*/
		        urlBuilder.append("&" + URLEncoder.encode("resultType","UTF-8") + "=" + URLEncoder.encode("json", "UTF-8")); /*JSON방식으로 호출 시 파라미터 resultType=json 입력*/
		        //urlBuilder.append("&" + URLEncoder.encode("UC_SEQ","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*콘텐츠 ID*/
		        URL url = new URL(urlBuilder.toString());
		        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		        conn.setRequestMethod("GET");
		        conn.setRequestProperty("Content-type", "application/json");
		        //System.out.println("Response code: " + conn.getResponseCode());
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
		        //System.out.println(sb.toString());
		        return sb.toString();
		    }
			
			// 부산 공영주차장 정보 api
			@RequestMapping(
					value   = "/park",
					method  = RequestMethod.GET,
					headers = "Accept=application/json")	 
				public  String  park(
				@RequestParam  HashMap<String, Object> map,
				HttpServletRequest request, HttpServletResponse response) throws IOException {
				
				String json = getPark( request, response);
				return json;
				
			}
			private String getPark(HttpServletRequest request, HttpServletResponse response) throws IOException {
				 StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/6260000/BusanPblcPrkngInfoService/getPblcPrkngInfo"); /*URL*/
			        urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=X5Ow2Q7%2F1YLN6F2IGV2I9%2F1G9A5aZ2eNuiJnwQvTm8m7w%2FDEh2jJsBMatEA%2FFBy2dM5%2FoJASYTxYqsoEukRzvQ%3D%3D"); /*Service Key*/
			        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*페이지번호*/
			        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("10", "UTF-8")); /*한 페이지 결과 수*/
			        urlBuilder.append("&" + URLEncoder.encode("resultType","UTF-8") + "=" + URLEncoder.encode("json", "UTF-8")); /*JSON방식으로 호출 시 파라미터 resultType=json 입력*/
			        URL url = new URL(urlBuilder.toString());
			        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			        conn.setRequestMethod("GET");
			        conn.setRequestProperty("Content-type", "application/json");
			        //System.out.println("Response code: " + conn.getResponseCode());
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
			        //System.out.println(sb.toString());
			        return sb.toString();
			    }
			
			// 부산 시장투어
			@RequestMapping(
					value   = "/recom",
					method  = RequestMethod.GET,
					headers = "Accept=application/json")	 
				public  String  recom(
				@RequestParam  HashMap<String, Object> map,
				HttpServletRequest request, HttpServletResponse response) throws IOException {
				
				String json = getRecom( request, response);
				return json;
				
			}
			private String getRecom(HttpServletRequest request, HttpServletResponse response) throws IOException {
				StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/6260000/ShoppingService/getShoppingKr"); /*URL*/
		        urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=X5Ow2Q7%2F1YLN6F2IGV2I9%2F1G9A5aZ2eNuiJnwQvTm8m7w%2FDEh2jJsBMatEA%2FFBy2dM5%2FoJASYTxYqsoEukRzvQ%3D%3D"); /*Service Key*/
		        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*페이지번호*/
		        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("40", "UTF-8")); /*한 페이지 결과 수*/
		        urlBuilder.append("&" + URLEncoder.encode("resultType","UTF-8") + "=" + URLEncoder.encode("json", "UTF-8")); /*JSON방식으로 호출 시 파라미터 resultType=json 입력*/
		        //urlBuilder.append("&" + URLEncoder.encode("UC_SEQ","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*콘텐츠 ID*/
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
		        //System.out.println(sb.toString());
		        return sb.toString();
		    	}
			
			// 경상남도 레저 관광 정보
			@RequestMapping(
					value   = "/leis",
					method  = RequestMethod.GET,
					headers = "Accept=application/json")	 
				public  String  leis(
				@RequestParam  HashMap<String, Object> map,
				HttpServletRequest request, HttpServletResponse response) throws IOException {
				
				String json = getLeis( request, response);
				return json;
				
			}
			private String getLeis(HttpServletRequest request, HttpServletResponse response) throws IOException {
				StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/6480000/gyeongnamtourleisure/gyeongnamtourleisurelist"); /*URL*/
		        urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=X5Ow2Q7%2F1YLN6F2IGV2I9%2F1G9A5aZ2eNuiJnwQvTm8m7w%2FDEh2jJsBMatEA%2FFBy2dM5%2FoJASYTxYqsoEukRzvQ%3D%3D"); /*Service Key*/
		        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*페이지번호*/
		        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("40", "UTF-8")); /*한 페이지 결과 수*/
		        urlBuilder.append("&" + URLEncoder.encode("resultType","UTF-8") + "=" + URLEncoder.encode("json", "UTF-8")); /*JSON방식으로 호출 시 파라미터 resultType=json 입력*/
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
		        //System.out.println(sb.toString());
		        return sb.toString();
    		}
		}
			
			
			
			
			
		

			
			
		
		
		
		
		
		
	








