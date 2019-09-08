package com.book.warm.service;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.annotations.Param;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.book.warm.mapper.LoginMapper;
import com.book.warm.mapper.RegisterMapper;
import com.book.warm.mapper.ShopMapper;
import com.book.warm.vo.CartVO;
import com.book.warm.vo.UserVO;

@Service
public class RegisterService {
	
	@Inject
	RegisterMapper registerMapper;

	public UserVO checkUser(String user_mail) {
		return registerMapper.checkUser(user_mail);
	}

	public void insertNewUser(UserVO userVO) {
		registerMapper.insertNewUser(userVO);
	}
	
	public int checkDuplicatedId(String user_id) {
		return registerMapper.checkDuplicatedId(user_id);
	}

	
	public int checkDuplicatedNickname(String user_nickname) {
		return registerMapper.checkDuplicatedNickname(user_nickname);
	}
	
	
}
