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
public class UserVo {
	
	private String userbirth;
	private String email;
	private String indate;
	@NonNull // NOT NULL
	
	private String userid;
	private String passwd;
	private String username;
	private String nickname;

}
