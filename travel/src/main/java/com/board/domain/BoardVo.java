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
public class BoardVo {
	@NonNull     // NOT NULL
	private int     bno;
	@NonNull
	private String  title;
	private String  content;
	@NonNull
	private String  writer;
	private String  regdate;
	private int     hit;
	
}
