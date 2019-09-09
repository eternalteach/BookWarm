package com.book.warm.service;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.annotations.Param;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.book.warm.mapper.LoginMapper;
import com.book.warm.mapper.ShopMapper;
import com.book.warm.vo.CartVO;
import com.book.warm.vo.UserVO;

@Service
public class LoginService {
	
	@Inject
	LoginMapper loginMapper;
	
	public UserVO loginMember(String user_id, String user_pw) {
		return loginMapper.loginMember(user_id, user_pw);
	}
	
}
