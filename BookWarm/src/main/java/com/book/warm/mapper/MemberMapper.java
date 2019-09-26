package com.book.warm.mapper;

import java.util.List;

import com.book.warm.vo.UserVO;

public interface MemberMapper {
	
	public UserVO read(String user_id);
	public List<UserVO> readAllUser();
}
