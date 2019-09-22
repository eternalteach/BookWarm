package com.book.warm.security;

import javax.inject.Inject;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.book.warm.mapper.MemberMapper;
import com.book.warm.security.domain.CustomUser;
import com.book.warm.vo.UserVO;

import lombok.extern.log4j.Log4j;

@Log4j
public class CustomUserDetailsService implements UserDetailsService {
	
	@Inject
	private MemberMapper memberMapper;
	
	@Override
	public UserDetails loadUserByUsername(String user_id) throws UsernameNotFoundException {
		
		log.warn("Load User By user_id : " + user_id);
		UserVO vo = memberMapper.read(user_id);
		
		log.warn("queried by member mapper: " + vo);
		return vo == null ? null : new CustomUser(vo);
	}
}
