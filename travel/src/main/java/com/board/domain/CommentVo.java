package com.board.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;

// @Data  : @Getter, @Setter, @RequiredArgsConstructor, @ToString, @EqualsAndHashCode 합친것
@Data
@NoArgsConstructor
@AllArgsConstructor
public class CommentVo {
	@NonNull
	private  int      cno;
	private  String   writer;
	private  String   wdate;
	private  String   content;
	@NonNull
	private  int      bno;
}
