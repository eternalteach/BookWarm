package com.book.warm.mapper;

import com.book.warm.vo.UserVO;

public interface MemberMapper {
	
	public UserVO read(String user_id);
}
