package com.board.domain;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PlanVo {
	
	private int idx;
	private String contents;
	private String complete_yn;	
	private String userid;

}
