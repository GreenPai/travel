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
public class FileVo {
	@NonNull     // NOT NULL
	private int FILE_NUM;
	private int IDX;
	private String FILENAME;
	private String FILEEXT;
	private String SFILENAME;
	private String WRITER;
	private String TITLE;
	
}
