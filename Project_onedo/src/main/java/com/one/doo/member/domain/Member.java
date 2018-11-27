package com.one.doo.member.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;
import lombok.Getter;

@Data
@Getter
public class Member {
	private String userid;
	private String userpw;
	private String userName;
	private boolean enabled;
	private Date regDate;
	private Date updateDate;
	private List<Auth> authList;
	
	// 필요 컬럼 추가 예정..
//	private String usermail;
//	private String userPhonenum;
	
}
