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
	
	private String indate;
	private String userbirth;
    private String address;
    private String address2;
	
	@NonNull // NOT NULL
	
	private String email;
	private String userid;
	private String passwd;
	private String username;
	private String nickname;

}
