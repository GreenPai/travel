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
public class TripVo {
	@NonNull
	private int UC_SEQ;
	@NonNull
	private String MAIN_TITLE;
	@NonNull
	private String GUGUN_NM;
	
	private int LAT;
	private int LNG;
	private String PLACE;
	private String TITLE;
	private String SUBTITLE;
	private String MAIN_IMG_NORMAL;
	private String ADDR1;
	private String CNTCT_TEL;
	private String HOMPAGE_URL;
	private String TRFC_INFO;
	private String USAGE_DAY;
	private String HLDY_INFO;
	private String USAGE_DAY_WEEK_AND_TIME;
	private int USAGE_AMOUNT;
	private String MIDDLE_SIZE_RM1;
	private String INTEMCNTNTS;

}
