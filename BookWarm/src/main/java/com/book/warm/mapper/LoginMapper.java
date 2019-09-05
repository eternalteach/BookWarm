package com.book.warm.mapper;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.book.warm.vo.UserVO;

public interface LoginMapper {
	
	@Select("select * from user_info where user_id=#{user_id} and user_pw=#{user_pw}")
	public UserVO loginMember(@Param("user_id") String user_id, @Param("user_pw") String user_pw);
	
	
}
