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
public class TrainVo {
	@NonNull
	private String traingradename;
	private String depplandtime;
	private String arrplandtime;
	private String depplacename;
	private String arrplacename;
	private String citycode;
	private int adultcharge;
	private String nodename;
	@NonNull
	private String trainno;
	@NonNull
	private String nodeid;
	
}
