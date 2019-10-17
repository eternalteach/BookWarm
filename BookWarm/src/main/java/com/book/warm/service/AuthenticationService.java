package com.book.warm.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.book.warm.mapper.AuthenticationMapper;
import com.book.warm.vo.AuthVO;
import com.book.warm.vo.OrdersStatusVO;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class AuthenticationService {

	@Autowired
	AuthenticationMapper authenticationMapper;

	public int addRoleUser(String user_id) {
		log.info("========== addRoleUser()");
		return authenticationMapper.addAuthenticationRoleUser(user_id);
	}

	public int modifyRoleUser(String user_id) {
		log.info("========== modifyRoleUser()");
		authenticationMapper.removeAllAuthentication(user_id);
		return authenticationMapper.addAuthenticationRoleUser(user_id);
	}

	public int modifyRoleManager(String user_id) {
		log.info("========== modifyRoleManager()");
		authenticationMapper.removeAllAuthentication(user_id);
		authenticationMapper.addAuthenticationRoleUser(user_id);
		return authenticationMapper.addAuthenticationRoleManager(user_id);
	}

	public int modifyRoleAdmin(String user_id) {
		log.info("========== modifyRoleAdmin()");
		authenticationMapper.removeAllAuthentication(user_id);
		authenticationMapper.addAuthenticationRoleUser(user_id);
		authenticationMapper.addAuthenticationRoleManager(user_id);
		return authenticationMapper.addAuthenticationRoleAdmin(user_id);
	}

	public int modifyAuthentication(AuthVO authVO) {
		log.info("========== modifyAuthentication()");
		log.info("authVO.getAuthority()"+authVO.getAuthority());
		if (authVO.getAuthority().equals("ROLE_USER")) {
			log.info("modifyRoleUser : " + authVO.getAuthority());
			return modifyRoleUser(authVO.getUser_id());
			
		} else if (authVO.getAuthority().equals("ROLE_MANAGER")) {
			log.info("modifyRoleManager : " + authVO.getAuthority());
			return modifyRoleManager(authVO.getUser_id());
			
		} else if (authVO.getAuthority().equals("ROLE_ADMIN")) {
			log.info("modifyRoleAdmin : " + authVO.getAuthority());
			return modifyRoleAdmin(authVO.getUser_id());
		}
		return 0;
	}


}
