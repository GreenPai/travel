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
	@NonNull     // NOT NULL
    private int totalCount;      // 전체 게시물 수
    private int currentPage;     // 현재 페이지 번호
    private int pageSize;        // 페이지당 게시물 수
    private int totalPageCount;  // 전체 페이지 수
}
