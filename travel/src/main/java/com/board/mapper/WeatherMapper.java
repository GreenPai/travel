package com.board.mapper;

import org.apache.ibatis.annotations.Param;

import com.board.domain.WeatherVo;
import com.fasterxml.jackson.databind.JsonNode;

public interface WeatherMapper {

	void insertWeather(WeatherVo weather);

	JsonNode readTree(String response);
	
	int countByDtTxt(@Param("dt_txt") String dt_txt);

    void insertWeather(@Param("dt_txt") String dt_txt, @Param("description") String description, @Param("temp_max") double temp_max, @Param("temp_min") double temp_min);

}
