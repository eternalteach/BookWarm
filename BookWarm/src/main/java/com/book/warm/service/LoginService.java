package com.book.warm.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.book.warm.mapper.LoginMapper;
import com.book.warm.vo.UserVO;

@Service
public class LoginService {
	
	@Inject
	LoginMapper loginMapper;
	
	public UserVO loginMember(String user_id, String user_pw) {
		return loginMapper.loginMember(user_id, user_pw);
	}
	
}
