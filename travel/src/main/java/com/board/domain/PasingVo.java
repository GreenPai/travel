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
public class PasingVo {
	@NonNull
	private  int      nowpage;          // 현재 페이지
	private  int      pagecount;        // 현재 페이지에 보여줄 row 수
	private  int      totalcount;       // 전체 자료(row)수
	private  int      totalpagecount;   // 화면에 보여줄 페이지 수
	private  int      pagestartnum;     // 페이지 시작 번호
	private  int      pageendnum;       // 페이지 끝   번호
	
}
