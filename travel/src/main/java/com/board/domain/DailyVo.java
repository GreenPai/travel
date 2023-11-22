package com.board.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
@RequiredArgsConstructor

public class DailyVo {
	
	private String tempMax; 
	private String tempMin;
	private String description;
	private String today_date;
	private String main;
	private int    tno;
	private int    num;
	private String titles;
	private String time1;
	private String cont1;
	@NonNull     // NOT NULL
	private String plan_date;	
	private String userid;

}
