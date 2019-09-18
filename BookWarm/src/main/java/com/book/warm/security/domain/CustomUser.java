package com.book.warm.security.domain;

import java.sql.Timestamp;
import java.util.Collection;
import java.util.stream.Collectors;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import com.book.warm.vo.UserVO;

public class CustomUser extends User {

	private static final long serialVersionUID = 1L;
	
	private UserVO user;
	
	public CustomUser(String user_id, String user_pw, String user_nickname, String user_name, Timestamp user_bday,
			String user_sex, String user_phone, String user_mail, int user_zipcode, String user_addr,
			String user_addr_detail, String user_join_date, String user_level, int user_tot_price, int user_point,
			String enabled, Collection<? extends GrantedAuthority> authList) {
		
		super(user_id, user_pw, authList);
		
	}
	
	public CustomUser(UserVO vo) {
		
		super(vo.getUser_id(), vo.getUser_pw(), vo.getAuthList().parallelStream()
				.map(auth -> new SimpleGrantedAuthority(auth.getAuthority()))
				.collect(Collectors.toList()));
		
		this.user = vo;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public UserVO getUser() {
		return user;
	}

}
